package pe.com.pdp.service.impl;

import java.io.File;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import pe.com.pdp.Constante;
import pe.com.pdp.FileUtil;
import pe.com.pdp.GenerateQRCode;
import pe.com.pdp.dao.postgres.BusquedaFotoMapper;
import pe.com.pdp.dao.postgres.BusquedaMapper;
import pe.com.pdp.dao.postgres.ContactoMapper;
import pe.com.pdp.dao.postgres.ElementoMapper;
import pe.com.pdp.dao.postgres.MascotaMapper;
import pe.com.pdp.dao.postgres.PersonaMascotaMapper;
import pe.com.pdp.dao.postgres.UbigeoMapper;
import pe.com.pdp.dao.postgres.UsuarioMapper;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.BusquedaCriteria;
import pe.com.pdp.domain.postgres.BusquedaFoto;
import pe.com.pdp.domain.postgres.BusquedaFotoCriteria;
import pe.com.pdp.domain.postgres.Contacto;
import pe.com.pdp.domain.postgres.Email;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.MascotaFoto;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.PersonaMascota;
import pe.com.pdp.domain.postgres.PersonaMascotaCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioCriteria;
import pe.com.pdp.service.BusquedaMascotaService;
import pe.com.pdp.service.MascotaService;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.UsuarioService;
import pe.com.pdp.thread.AdminColaHilos;
import pe.com.pdp.thread.HiloProceso;

@Service
public class BusquedaMascotaServiceImpl implements BusquedaMascotaService {
	
	@Autowired
	private BusquedaMapper busquedaMapper;
	
	@Autowired
	private MascotaMapper mascotaMapper;
	
	@Autowired
	private BusquedaFotoMapper busquedaFotoMapper;
	
	@Autowired
	private ElementoMapper elementoMapper;
	
	@Autowired
	private MascotaService mascotaService;
	
	@Autowired
	private UbigeoMapper ubigeoMapper;
	
	@Autowired
	private UsuarioMapper usuarioMapper;
	
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	private PersonaMascotaMapper personaMascotaMapper;
	
	@Autowired
	private HiloProceso hiloProceso;

	@Autowired
	private AdminColaHilos adminColaHilos;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private ContactoMapper contactoMapper;
	
	public List<Map<String, Object>> findListaMascotaBusqueda(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(busqueda.getMascotaNombre()!=null &&  busqueda.getMascotaNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE", busqueda.getMascotaNombre() );
		}
		
		if(busqueda.getMascotaRaza()!=null  && busqueda.getMascotaRaza()!=0  ){
			parametros.put("TIPO_RAZA", busqueda.getMascotaRaza() );
		}
		
		if(busqueda.getMascotaTamanio()!=null  && busqueda.getMascotaTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  busqueda.getMascotaTamanio());
		}
		
		if( busqueda.getMascotaGenero()!=null  && busqueda.getMascotaGenero()!=0){
			parametros.put("TIPO_GENERO",  busqueda.getMascotaGenero());
		}
		
		if(busqueda.getMascotaColor()!=null  && busqueda.getMascotaColor()!=0){
			parametros.put("TIPO_COLOR",  busqueda.getMascotaColor() );
		}
		
		
		if(busqueda.getUsuarioRegistro()!=null &&  busqueda.getUsuarioRegistro().trim().length()>0 ){
			parametros.put("BUSQUEDA_USUARIO_REGISTRO", busqueda.getUsuarioRegistro() );
		}
		
		
		if(busqueda.getId()!=null ){
			parametros.put("BUSQUEDA_MASCOTA_ID", busqueda.getId() );
		}
		
		if(busqueda.getDistrito()!=null  && busqueda.getDistrito()!=0){
			parametros.put("UBIGEO_DISTRITO", busqueda.getDistrito() );
		}
		
		if(busqueda.getStart()!=null){
			parametros.put("INICIO_PAG", busqueda.getStart().intValue());
		}
		
		Gson gson = new Gson();
		
		System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		System.out.println(gson.toJson(parametros));
		System.out.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		BusquedaFoto bf = null;
		Usuario usuario = null;
		Persona persona = null;
		Contacto contactoPrincipal = null;
		Email emailPrincipal = null;
		List<Map<String, Object>> list = busquedaMapper.selectByBusquedaMascota(parametros);
		if(list != null && list.size() > 0){
			for (Map<String, Object> map : list) {
				if(map.get("fotopublicacion") != null){
					bf = new BusquedaFoto();
					bf.setFoto(map.get("fotopublicacion").toString());
					map.put("fotoBusqueda", bf);
				}
				
				if(map.get("desParametro1") != null){
					usuario = new Usuario();
					usuario.setUsuario(map.get("desParametro1").toString());
					if(map.get("usuarioRegistro") != null){
						usuario.setId(Integer.parseInt(map.get("usuarioRegistro").toString()));
					}
					
					if(map.get("nombrecompleto") != null){
						persona = new Persona();
						persona.setNombreCompleto(map.get("nombrecompleto").toString());
						
						emailPrincipal = new Email();
						emailPrincipal.setEmail(map.get("desParametro1").toString());
						persona.setEmailPrincipal(emailPrincipal);
						if(map.get("telefono") != null){
							contactoPrincipal = new Contacto();
							contactoPrincipal.setNumero(map.get("telefono").toString());
							persona.setContactoPrincipal(contactoPrincipal);
						}
					}
					usuario.setPersona(persona);
					map.put("usuario" , usuario);
				}
				
//				map.put("fotoBusqueda", this.obtenerFotoByIdBusqueda(Integer.parseInt(map.get("id").toString())));
//				if(StringUtils.isNumeric(map.get("usuarioRegistro").toString())){
//					map.put("usuario", this.obtenerUsuarioID(Integer.parseInt(map.get("usuarioRegistro").toString())));
//				}else{
//					map.put("usuario", this.obtenerUsuario(map.get("usuarioRegistro").toString()));
//				}
			}
		}
		
		return list;
	}
	
	private Usuario obtenerUsuario(String login) throws Exception{
		
		UsuarioCriteria uc = new UsuarioCriteria();
		uc.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO).andUsuarioEqualTo(login);
		
		List<Usuario> usuarios = usuarioMapper.selectByExample(uc);
		
		if(usuarios != null && usuarios.size() > 0){
			Usuario usuario = usuarios.get(0);
			if(usuario != null){
				Persona persona = personaService.obtenerPersonaContactosPorId(usuario.getPersonaId());
				if(persona != null){
					usuario.setPersona(persona);
				}
			}
			return usuario;
		}
		return null;
		
	}
	
	private Usuario obtenerUsuarioID(Integer id) throws Exception{
			Usuario usuario = usuarioMapper.selectByPrimaryKey(id);
			if(usuario != null){
				Persona persona = personaService.obtenerPersonaContactosPorId(usuario.getPersonaId());
				if(persona != null){
					usuario.setPersona(persona);
				}
			}
			return usuario;
	}

	
	public int countMascotaBusquedas(Busqueda busqueda) throws Exception {
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(busqueda.getMascotaNombre()!=null &&  busqueda.getMascotaNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE", busqueda.getMascotaNombre() );
		}
		
		if(busqueda.getMascotaRaza()!=null  && busqueda.getMascotaRaza()!=0  ){
			parametros.put("TIPO_RAZA", busqueda.getMascotaRaza() );
		}
		
		if(busqueda.getMascotaTamanio()!=null  && busqueda.getMascotaTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  busqueda.getMascotaTamanio());
		}
		
		if( busqueda.getMascotaGenero()!=null  && busqueda.getMascotaGenero()!=0){
			parametros.put("TIPO_GENERO",  busqueda.getMascotaGenero());
		}
		
		if(busqueda.getMascotaColor()!=null  && busqueda.getMascotaColor()!=0){
			parametros.put("TIPO_COLOR",  busqueda.getMascotaColor() );
		}
		
		
		if(busqueda.getUsuarioRegistro()!=null &&  busqueda.getUsuarioRegistro().trim().length()>0 ){
			parametros.put("BUSQUEDA_USUARIO_REGISTRO", busqueda.getUsuarioRegistro() );
		}
		
		if(busqueda.getId()!=null ){
			parametros.put("BUSQUEDA_MASCOTA_ID", busqueda.getId() );
		}
		
		if(busqueda.getDistrito()!=null  && busqueda.getDistrito()!=0){
			parametros.put("UBIGEO_DISTRITO", busqueda.getDistrito() );
		}
		
		
		
		
		return busquedaMapper.countBusquedaMascotas(parametros);
	}

	
	public int countTotalMascotaBusquedas() throws Exception {
		// TODO Auto-generated method stub
		BusquedaCriteria busquedaCriteria=new BusquedaCriteria();
		busquedaCriteria.createCriteria().andEstadoBusquedaEqualTo(Constante.ESTADO_ACTIVO);
		Integer cant= busquedaMapper.countByExample(busquedaCriteria);
		return cant;
	}
	
	
	//@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void saveBusquedaMascota(Busqueda busqueda, Usuario usuario) throws Exception{
		// TODO Auto-generated method stub
		Mascota mascota=new Mascota();
		
		Integer idMascota = null;
		BusquedaFoto bf = null;
		List<Mascota> list = null;
		if(busqueda.getMascotaId()!=null){
			
			idMascota = busqueda.getMascotaId();
		
			busqueda.getMascota().setFechaModifico(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				busqueda.getMascota().setUsuarioModifico(usuario.getUsuario());
			}
			mascota=busqueda.getMascota();
			mascotaMapper.updateByPrimaryKeySelective(mascota);
			
		}else{
			busqueda.getMascota().setFechaRegistro(new Date());
			
			if(usuario != null && usuario.getUsuario() != null){
				busqueda.getMascota().setUsuarioRegistro(usuario.getUsuario());
			}
			
			mascota=busqueda.getMascota();
			mascota.setEstado(Constante.ESTADO_ACTIVO);
			mascotaMapper.insertSelective(mascota);
			
		}
		
		
		if(busqueda.getId()!=null){
			busqueda.setMascotaId(mascota.getId());
			busqueda.setFechaModifico(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				busqueda.setUsuarioModifico(usuario.getUsuario());
			}
			busquedaMapper.updateByPrimaryKeySelective(busqueda);
		}else{
			busqueda.setEstado(Constante.ESTADO_ACTIVO);
			busqueda.setMascotaId(mascota.getId());
			busqueda.setFechaRegistro(new Date());
			busqueda.setFechaPerdida(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				busqueda.setUsuarioRegistro(usuario.getUsuario());
			}else{
				
				if(busqueda.getUsuarioRegistro() != null){
					try{
						Integer idUsuario = Integer.parseInt(busqueda.getUsuarioRegistro().toString());
						
						Usuario usuarioUpdate = usuarioService.obtenerUsuarioAll(idUsuario);
						
						if(usuarioUpdate!= null &&
								usuarioUpdate.getPersona() != null &&
								usuarioUpdate.getPersona().getContactoPrincipal() != null &&
								usuarioUpdate.getPersona().getContactoPrincipal().getNumero() == null){
							usuarioUpdate.getPersona().getContactoPrincipal().setNumero(busqueda.getTelefono());
							contactoMapper.updateByPrimaryKeySelective(usuarioUpdate.getPersona().getContactoPrincipal());
						}
						
						
					}catch (Exception e) {}
				}
				
			}
			
			busquedaMapper.insertSelective(busqueda);
			
			
			
			//Generacion de QR
			String pathQR = Constante.PATH_QR;

			String urlTargeQR = "";
			
			try {
				urlTargeQR = elementoMapper.selectByPrimaryKey(Constante.ELEMENTO_QR_BUSQUEDA).getDesNombre()+"?id="+busqueda.getId();
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println("URL QR DE PARAMETRO("+Constante.ELEMENTO_QR_ENCONTRE+") NO ENCONTRADO.");
			}
			
			GenerateQRCode.execute(urlTargeQR, pathQR, busqueda.getId().toString()+"_qr.png");
			busqueda.setFotoQr("images/qr/"+busqueda.getId().toString()+"_qr.png");
			busquedaMapper.updateByPrimaryKeySelective(busqueda);
			
			//Invocar al hilo
			HashMap<String, Object> parametros = new HashMap<String, Object>();
			parametros.put("proceso", Constante.PROCESO_NOTIFICACION_BUSQUEDA);
			parametros.put("idBusqueda", busqueda.getId());
			getHiloProceso().setParametros(parametros);
			adminColaHilos.executeThread(getHiloProceso());
			
		}
		
		
		String imgResponse = "";
		MascotaFoto mf = new MascotaFoto(); 
		
		if(busqueda.getFileFoto() != null){
			
			String node = "busqueda/mascota/"+mascota.getId();
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			MultipartFile fileFoto = busqueda.getFileFoto();
			
			String fileName = fileFoto.getOriginalFilename();
			
			try{
			 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			
			bf = new BusquedaFoto();
			bf.setBusquedaId(busqueda.getId());
			imgResponse = "images/"+node+"/"+fileName;
			bf.setFoto(imgResponse);
			
			busquedaFotoMapper.insertSelective(bf);
			mf.setFoto(imgResponse);
			busqueda.getMascota().setFotoPrincipal(mf);
			busqueda.setFileFoto(null);
			
			Busqueda bt = new Busqueda();
			bt.setId(busqueda.getId());
			bt.setFotopublicacion(imgResponse);
			busquedaMapper.updateByPrimaryKeySelective(bt);
			
		}else{
			if(idMascota!=null){
				
				Mascota m = new Mascota();
				m.setId(idMascota);
				list = mascotaService.listarMascota(m);
				if(list != null && list.size() > 0){
					m = list.get(0);
					bf = new BusquedaFoto();
					bf.setBusquedaId(busqueda.getId());
					imgResponse = m.getFotoPrincipal().getFoto();
					bf.setFoto(imgResponse);
					busquedaFotoMapper.insertSelective(bf);
					
					mf.setFoto(imgResponse);
					busqueda.getMascota().setFotoPrincipal(mf);
					
					Busqueda bt = new Busqueda();
					bt.setId(busqueda.getId());
					bt.setFotopublicacion(imgResponse);
					busquedaMapper.updateByPrimaryKeySelective(bt);
				}
				
			}
		}
 		
	}
	
	private BusquedaFoto obtenerFotoByIdBusqueda(Integer idBusqueda)throws Exception {
		Busqueda busqueda = new Busqueda();
		busqueda.setId(idBusqueda);
		List<BusquedaFoto> list = this.listFotoMascotaBusqueda(busqueda);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	
	public List<BusquedaFoto> listFotoMascotaBusqueda(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		
		BusquedaFotoCriteria criteriaBusqFoto=new BusquedaFotoCriteria();
		criteriaBusqFoto.createCriteria().andBusquedaIdEqualTo(busqueda.getId());
		
		return busquedaFotoMapper.selectByExample(criteriaBusqFoto);
	}

	
	public Busqueda obtenerMascotaBuscada(Integer idBusqueda) throws Exception {
		// TODO Auto-generated method stub
		Busqueda  busqueda=busquedaMapper.selectByPrimaryKey(idBusqueda);
		 List<BusquedaFoto> listBusquedaFoto=this.listFotoMascotaBusqueda(busqueda);
		 if(listBusquedaFoto!=null  &&  listBusquedaFoto.size()==1){
			 busqueda.setBusquedaMascotaFotos(listBusquedaFoto);
		 }
		 PersonaMascotaCriteria personaMascotaCriteria=new PersonaMascotaCriteria();
		 personaMascotaCriteria.createCriteria().andMascotaIdEqualTo(busqueda.getMascotaId());
 		 
		 List<PersonaMascota> listaPersonaMascota=personaMascotaMapper.selectByExample(personaMascotaCriteria);
		 
 		 if(listaPersonaMascota!=null && listaPersonaMascota.size()>0 ){
 			 
 			Persona persona = personaService.obtenerPersonaContactosPorId(listaPersonaMascota.get(0).getPersonaId());
 			 busqueda.setPersona(persona);
 		 }
 		 
 		 
		Mascota mascota=mascotaMapper.selectByPrimaryKey(busqueda.getMascotaId());
		mascota.setDesGenero(elementoMapper.selectByPrimaryKey(mascota.getGenero()).getDesAbreviacion());
		mascota.setDesRaza(elementoMapper.selectByPrimaryKey(mascota.getRaza()).getDesNombre());
		mascota.setDesTamanio(elementoMapper.selectByPrimaryKey(mascota.getTamanio()).getDesNombre());
		mascota.setDesColor(elementoMapper.selectByPrimaryKey(mascota.getColor()).getDesNombre());
		busqueda.setMascota(mascota);
		
		busqueda.setDesDistrito(ubigeoMapper.selectByPrimaryKey(busqueda.getDistrito()).getNombre());
		
		return busqueda;
	}

	
	public String generarPosterHtml(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		
		StringBuilder htmlString = new StringBuilder();
		
		
		String coordenada[]=busqueda.getUbicacionCatastro().split(" "); //40.718217,-73.998284
		String dominio=elementoMapper.selectByPrimaryKey(Constante.ELEMENTO_URL_WEB_BACKEND).getDesNombre();
		String url_foto="";
		if(busqueda.getBusquedaMascotaFotos()!=null && busqueda.getBusquedaMascotaFotos().get(0)!=null){
			url_foto=dominio+busqueda.getBusquedaMascotaFotos().get(0).getFoto();
		}else{
			url_foto=dominio+"imagenes/pata_perro.jpg.jpg";
		}
		
		String url_catastro="https://maps.googleapis.com/maps/api/staticmap?zoom=14&size=380x256&maptype=roadmap&markers=color:red%7Clabel:C%7C"+coordenada[0]+","+coordenada[1]+"&key=AIzaSyCi7kmMyhXzLRRl5DmYPDeGE2Ow5d0bB8c";
		String url_logo=dominio+"imagenes/pata_de_perro_03.jpg";
		String url_logo_iphone=dominio+"imagenes/disponible-appstore.jpg";
		String url_logo_android=dominio+"imagenes/google-play-store.png";
		String url_logo_qr=dominio+busqueda.getFotoQr();
		String url_logo_phone=dominio+"imagenes/img_phone.png";
		String url_logo_perrito=dominio+"imagenes/PERROAMOR.jpg";
		String url_logo_money=dominio+"imagenes/bagofmoney_5108.png";
		
		String valor_Monto="";
		if(busqueda.getMontoRecompensa()!=null){
			valor_Monto=busqueda.getMontoRecompensa()+"";
		}else{
			valor_Monto="0.0";
		}
		String tituloxGenero="";
		if(busqueda.getMascota().getGenero().equals(Constante.GENERO_MASCULINO)){
			tituloxGenero="PERDIDO";
		}else{
			tituloxGenero="PERDIDA";
		}
		
		String nombre="";
		if(busqueda.getPersona()!=null){
			if(busqueda.getPersona().getNombres()!=null && busqueda.getPersona().getNombres().trim().length()>0){
				nombre=busqueda.getPersona().getNombres().trim().toUpperCase();
			}else{
				nombre=busqueda.getPersona().getNombreCompleto();
			}
		}else{
			Usuario usuario=new Usuario();
			
			if(busqueda.getUsuarioRegistro()!=null && busqueda.getUsuarioRegistro().trim().length()>0){
				usuario=obtenerUsuarioID(Integer.parseInt(busqueda.getUsuarioRegistro()));
			}else{
				if(busqueda.getMascota().getUsuarioRegistro()!=null && busqueda.getMascota().getUsuarioRegistro().trim().length()>0){
					usuario=obtenerUsuarioID(Integer.parseInt(busqueda.getMascota().getUsuarioRegistro()));
				}
			}
			
			
			if(usuario!=null){
				busqueda.setPersona(usuario.getPersona());
				
				if(usuario.getPersona().getNombres()!=null && usuario.getPersona().getNombres().trim().length()>0){
					nombre=usuario.getPersona().getNombres();
				}else{
					nombre=usuario.getPersona().getNombreCompleto();
				}
			}
		}
		
		String telefono="";
		if(busqueda.getTelefono()!=null){
			
			telefono=busqueda.getTelefono().toString();
			
		}else if(busqueda.getPersona()!=null && busqueda.getPersona().getContactoPrincipal()!=null){
			
			telefono=busqueda.getPersona().getContactoPrincipal().getNumero();
		}
		String descripcion="";
		String comentario="";
		String nombrePerro="";
		if(busqueda.getMascota().getNombre()!=null){
			nombrePerro=busqueda.getMascota().getNombre().toUpperCase();
		}else{
			nombrePerro="UN PATA DE PERRO";
		}
        
        htmlString.append(new String("\n <html>"));
        htmlString.append(new String("\n <head>"));
        htmlString.append(new String("\n </head>"));
        htmlString.append(new String("\n <body>"));
    	htmlString.append(new String("\n <div style=\"  height: 690px; \">"));

        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table  style=\"  height: 70px;\" cellspacing=\"0\">"));
        htmlString.append(new String("\n <tbody>"));
        htmlString.append(new String("\n <tr> "));
        htmlString.append(new String("\n <td style=\"width: 200px; height: 65px;\"  ></td>"));
        htmlString.append(new String("\n <td style=\"width: 698px;   font-size: 50px; text-align: center; font-weight:bold\"> "+nombrePerro+"  "+tituloxGenero+"</td>"));
        htmlString.append(new String("\n<td style=\"width:  200px;  text-align: center; border:1px solid black;font-size: 12px; font-weight:bold;\">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>"));
        htmlString.append(new String("\n </tr>"));
        htmlString.append(new String("\n </tbody>"));
        htmlString.append(new String("\n </table></p>"));
        
        
        		
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table style=\"  height: 275px;\" cellspacing=\"0\">"));
        htmlString.append(new String("\n 	<tbody> "));
        htmlString.append(new String("\n<tr> "));
        htmlString.append(new String("\n <td  style=\" width: 20px; \" ></td> "));
        htmlString.append(new String("\n <td  style=\" width: 438px;\"><img width=\"430px\" height=\"300px\"  src=\""+url_foto+"\"/></td>  "));
        htmlString.append(new String("\n <td  style=\" width: 438px;\"><img src=\""+url_catastro+"\" /></td> "));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px;font-weight:bold;\">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td> "));
        htmlString.append(new String("\n </tr> "));
        htmlString.append(new String("\n </tbody> "));
        htmlString.append(new String("\n </table></p> "));		 
        		
                
        if(busqueda.getMascota().getCaracteristica()!=null && busqueda.getMascota().getCaracteristica().toUpperCase().trim().length()>0){
        	descripcion=" "+busqueda.getMascota().getCaracteristica().toUpperCase()+", ";
        }
        
        if(busqueda.getMascota().getDesComentario()!=null && busqueda.getMascota().getDesComentario().toUpperCase().trim().length()>0){
        	comentario=" "+busqueda.getMascota().getDesComentario().toUpperCase();
        }
        
        
        
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px;\" ><table style=\"  height: 50px;\" cellspacing=\"0\"> "));
        htmlString.append(new String("\n <tbody>  "));
        htmlString.append(new String("\n <tr>  "));
        htmlString.append(new String("\n <td  style=\" width: 100px; text-align: center;padding-top:1px; \" ><img width=\"70px\" height=\"40px\"  src=\""+url_logo_perrito+"\" /> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 798px; padding-top:1px; font-family: Arial, Tahoma, sans-serif; font-size: 22px;\"><p> "+busqueda.getMascota().getDesRaza().toUpperCase()+",  "+busqueda.getMascota().getDesGenero().toUpperCase()+", "+busqueda.getMascota().getDesTamanio().toUpperCase()+" PERDIDO EN "+busqueda.getDesDistrito().toUpperCase()+" <br/> "+descripcion+" "+comentario+" </p> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 200px; padding-top:0px; text-align: center; border:1px solid black;font-size: 12px; font-weight:bold; !important\" >"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>  "));
        htmlString.append(new String("\n </tr>  "));
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p>  "));
        		
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table style=\"  height: 40px;\" cellspacing=\"0\">  "));
        htmlString.append(new String("\n <tbody>  "));
        htmlString.append(new String("\n <tr>   "));
        htmlString.append(new String("\n <td  style=\" width: 100px; text-align: center;\" ><img width=\"70px\" height=\"40px\"  src=\""+url_logo_phone+"\"/> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 798px;  font-family: Arial, Tahoma, sans-serif; font-size: 22px;\"><p> POR FAVOR CONTACTAR A: "+busqueda.getPersona().getNombreCompleto().toUpperCase()+" "+telefono+"</p></td>"));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px;font-weight:bold; !important \" >"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>  "));
        htmlString.append(new String("\n</tr>  "));
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p> "));
        
        		        		        
        
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table style=\" height: 40px;\" cellspacing=\"0\">"));
        htmlString.append(new String("\n <tbody>"));
        htmlString.append(new String("\n <tr>"));
        htmlString.append(new String("\n <td style=\" width: 100px; text-align: center;\"  ><img width=\"70px\" height=\"40px\" src=\""+url_logo_money+"\" /> </td> "));
        htmlString.append(new String("\n <td style=\" width: 798px;  font-family: Arial, Tahoma, sans-serif; font-size: 22px;\"><p><strong> RECOMPENSA: S/. "+valor_Monto+" </strong></p></td>"));
        htmlString.append(new String("\n <td style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px;font-weight:bold; !important\" >"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>"));
		htmlString.append(new String("\n   </tr>"));
		htmlString.append(new String("\n </tbody>"));
		htmlString.append(new String("\n </table> </p>"));
        		 									
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px;\"><table style=\" height: 120px;\" cellspacing=\"0\"> "));
        htmlString.append(new String("\n <tbody>"));
        htmlString.append(new String("\n <tr> "));
        htmlString.append(new String("\n <td  style=\" width: 100px; text-align: center;\"  ><img width=\"96px\" height=\"90px\"  src=\""+url_logo_qr+"\"/> </td>"));
        htmlString.append(new String("\n  <td  style=\" width: 516px;  font-family: Arial, Tahoma, sans-serif; font-size: 12px; margin-top:4px;margin-bottom:4px;\">")); 
        htmlString.append(new String("\n  <table style=\" height: 120px;\" cellspacing=\"0\" cellpadding=\"0\" > ")); 
        htmlString.append(new String("\n  <tbody>"));
        htmlString.append(new String("\n  <tr> "));
        htmlString.append(new String("\n  <td  style=\" width: 516px; text-align: right;\"  > "));
        htmlString.append(new String("\n <img width=\"110px\" height=\"40px\" src=\""+url_logo_iphone+"\"/> ")); 
       	htmlString.append(new String("\n <img width=\"110px\" height=\"40px\" src=\""+url_logo_android+"\" />   "));
       	htmlString.append(new String("\n </td>"));
       	htmlString.append(new String("\n </tr> "));
        htmlString.append(new String("\n <tr> "));
        htmlString.append(new String("\n <td  style=\" width: 518px; text-align: right; font-size: 22px; !important\"  >"));
        htmlString.append(new String("\n Descargando la app estás ayudando, únete a: "));
       	htmlString.append(new String("\n </td> "));
       	htmlString.append(new String("\n   </tr> "));
        htmlString.append(new String("\n </tbody> "));
        htmlString.append(new String("\n   </table>  "));
        htmlString.append(new String("\n   </td> "));
        htmlString.append(new String("\n   <td  style=\" width: 280px;  text-align:left;  font-family: Arial, Tahoma, sans-serif; font-size: 12px; margin-top:4px;margin-bottom:4px;\"> ")); 
        htmlString.append(new String("\n   <img width=\"240px\" height=\"120px\"  src=\""+url_logo+"\" />  "));
        htmlString.append(new String("\n  </td> "));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center;  border:1px solid black; font-size: 12px;font-weight:bold; !important\">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>"));
        htmlString.append(new String("\n </tr> ")); 
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p>  "));

 		htmlString.append(new String("\n </div>  "));
 		htmlString.append(new String("\n </body>  "));
        htmlString.append(new String("\n </html>  "));
        
        		
		System.out.println(htmlString);
		return htmlString.toString();
	}

	
	public Integer countNuevasPublicacion(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		BusquedaCriteria bc = new BusquedaCriteria();
		bc.createCriteria()
							.andEstadoEqualTo(Constante.ESTADO_ACTIVO)
							.andDistritoEqualTo(busqueda.getDistrito())
							.andEstadoBusquedaIsNull();
		return busquedaMapper.countByExample(bc);
	}

	public HiloProceso getHiloProceso() {
		return hiloProceso;
	}

	public void setHiloProceso(HiloProceso hiloProceso) {
		this.hiloProceso = hiloProceso;
	}

	@Override
	public Map<String, Object> getBusquedaVigencia(String idUsuario) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		String strMaxMeses = elementoMapper.selectByPrimaryKey(Constante.ID_PARAMETRO_MAX_MESES_VIGENCIA).getDesNombre();
		param.put("maxMes", Integer.parseInt(strMaxMeses));
		return busquedaMapper.getBusquedaVigencia(param);
	}

	@Override
	public void updateBusquedaMapper(Busqueda b) {
		busquedaMapper.updateByPrimaryKeySelective(b);
	}
	
	
}
