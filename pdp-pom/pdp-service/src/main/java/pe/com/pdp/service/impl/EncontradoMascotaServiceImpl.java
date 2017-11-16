package pe.com.pdp.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import pe.com.pdp.Constante;
import pe.com.pdp.FileUtil;
import pe.com.pdp.GenerateQRCode;
import pe.com.pdp.dao.postgres.ContactoMapper;
import pe.com.pdp.dao.postgres.ElementoMapper;
import pe.com.pdp.dao.postgres.EncontradoFotoMapper;
import pe.com.pdp.dao.postgres.EncontradoMapper;
import pe.com.pdp.dao.postgres.MascotaMapper;
import pe.com.pdp.dao.postgres.PersonaMascotaMapper;
import pe.com.pdp.dao.postgres.UbigeoMapper;
import pe.com.pdp.dao.postgres.UsuarioMapper;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.BusquedaCriteria;
import pe.com.pdp.domain.postgres.BusquedaFoto;
import pe.com.pdp.domain.postgres.Contacto;
import pe.com.pdp.domain.postgres.Email;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.EncontradoCriteria;
import pe.com.pdp.domain.postgres.EncontradoFoto;
import pe.com.pdp.domain.postgres.EncontradoFotoCriteria;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.MascotaFoto;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.PersonaMascota;
import pe.com.pdp.domain.postgres.PersonaMascotaCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioCriteria;
import pe.com.pdp.service.EncontradoMascotaService;
import pe.com.pdp.service.MascotaService;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.UsuarioService;
import pe.com.pdp.thread.AdminColaHilos;
import pe.com.pdp.thread.HiloProceso;


@Service
public class EncontradoMascotaServiceImpl implements EncontradoMascotaService {

	@Autowired
	private EncontradoMapper encontradoMapper;
	
	@Autowired
	private MascotaMapper mascotaMapper;
	
	@Autowired
	private ElementoMapper elementoMapper;
	
	@Autowired
	private MascotaService mascotaService;
	
	@Autowired
	private UsuarioMapper usuarioMapper;
	
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	private EncontradoFotoMapper encontradoFotoMapper;
	
	@Autowired
	private PersonaMascotaMapper personaMascotaMapper;
	
	@Autowired
	private UbigeoMapper ubigeoMapper;
	
	@Autowired
	private HiloProceso hiloProceso;

	@Autowired
	private AdminColaHilos adminColaHilos;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private ContactoMapper contactoMapper;
	
	 
	
	
	public List<Map<String, Object>> findListaMascotaEncontrado(Encontrado encontrado) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(encontrado.getMascotaNombre()!=null &&  encontrado.getMascotaNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE", encontrado.getMascotaNombre() );
		}
		
		if(encontrado.getMascotaRaza()!=null  && encontrado.getMascotaRaza()!=0  ){
			parametros.put("TIPO_RAZA", encontrado.getMascotaRaza() );
		}
		
		if(encontrado.getMascotaTamanio()!=null  && encontrado.getMascotaTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  encontrado.getMascotaTamanio());
		}
		
		if( encontrado.getMascotaGenero()!=null  && encontrado.getMascotaGenero()!=0){
			parametros.put("TIPO_GENERO",  encontrado.getMascotaGenero());
		}
		
		if(encontrado.getMascotaColor()!=null  && encontrado.getMascotaColor()!=0){
			parametros.put("TIPO_COLOR",  encontrado.getMascotaColor() );
		}
		
		
		if(encontrado.getUsuarioRegistro()!=null &&  encontrado.getUsuarioRegistro().trim().length()>0 ){
			parametros.put("ENCONTRADO_USUARIO_REGISTRO", encontrado.getUsuarioRegistro() );
		}
		
		
		if(encontrado.getId()!=null ){
			parametros.put("ENCONTRADO_MASCOTA_ID", encontrado.getId() );
		}
		
		if(encontrado.getDistrito()!=null  && encontrado.getDistrito()!=0){
			parametros.put("UBIGEO_DISTRITO", encontrado.getDistrito() );
		}
		
		if(encontrado.getStart()!=null){
			parametros.put("INICIO_PAG", encontrado.getStart().intValue());
		}
		
		EncontradoFoto bf = null;
		Usuario usuario = null;
		Persona persona = null;
		Contacto contactoPrincipal = null;
		Email emailPrincipal = null;
		List<Map<String, Object>> list = encontradoMapper.selectByEncontreMascota(parametros);
		if(list != null && list.size() > 0){
			for (Map<String, Object> map : list) {
				

				if(map.get("fotopublicacion") != null){
					bf = new EncontradoFoto();
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
	
	private EncontradoFoto obtenerFotoByIdBusqueda(Integer idEncontrado)throws Exception {
		Encontrado e = new Encontrado();
		e.setId(idEncontrado);
		List<EncontradoFoto> list = this.listFotoMascotaEncontrado(e);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	
	
	public int countMascotaEncontradas(Encontrado encontrado) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(encontrado.getMascotaNombre()!=null &&  encontrado.getMascotaNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE", encontrado.getMascotaNombre() );
		}
		
		if(encontrado.getMascotaRaza()!=null  && encontrado.getMascotaRaza()!=0  ){
			parametros.put("TIPO_RAZA", encontrado.getMascotaRaza() );
		}
		
		if(encontrado.getMascotaTamanio()!=null  && encontrado.getMascotaTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  encontrado.getMascotaTamanio());
		}
		
		if( encontrado.getMascotaGenero()!=null  && encontrado.getMascotaGenero()!=0){
			parametros.put("TIPO_GENERO",  encontrado.getMascotaGenero());
		}
		
		if(encontrado.getMascotaColor()!=null  && encontrado.getMascotaColor()!=0){
			parametros.put("TIPO_COLOR",  encontrado.getMascotaColor() );
		}
		
		
		if(encontrado.getUsuarioRegistro()!=null &&  encontrado.getUsuarioRegistro().trim().length()>0 ){
			parametros.put("encontrado_USUARIO_REGISTRO", encontrado.getUsuarioRegistro() );
		}
		
		
		if(encontrado.getId()!=null ){
			parametros.put("encontrado_MASCOTA_ID", encontrado.getId() );
		}
		
		if(encontrado.getDistrito()!=null  && encontrado.getDistrito()!=0){
			parametros.put("UBIGEO_DISTRITO", encontrado.getDistrito() );
		}
		
		return encontradoMapper.countEncontreMascotas(parametros);
	}

	
	public int countTotalMascotaEncontradas() throws Exception {
		// TODO Auto-generated method stub
		EncontradoCriteria criteriaEcontrado=new EncontradoCriteria();
		criteriaEcontrado.createCriteria().andEstadoEncontradoEqualTo(Constante.ESTADO_ACTIVO);
		
		return encontradoMapper.countByExample(criteriaEcontrado);
	}

	
	public Encontrado obtenerMascotaEncontrada(Integer idEncontrado) throws Exception {
		// TODO Auto-generated method stub
			
		 Encontrado  encontrado=encontradoMapper.selectByPrimaryKey(idEncontrado);
		 System.out.println("idEncontrado: "+idEncontrado+" encontrado: "+encontrado);
		 List<EncontradoFoto> listEncontradoFoto=this.listFotoMascotaEncontrado(encontrado);
		 if(listEncontradoFoto!=null  &&  listEncontradoFoto.size()==1){
			 encontrado.setEncontradoMascotaFotos(listEncontradoFoto);
		 }
		 PersonaMascotaCriteria personaMascotaCriteria=new PersonaMascotaCriteria();
		 personaMascotaCriteria.createCriteria().andMascotaIdEqualTo(encontrado.getMascotaId());
		 
		 List<PersonaMascota> listaPersonaMascota=personaMascotaMapper.selectByExample(personaMascotaCriteria);
		 
		 if(listaPersonaMascota!=null && listaPersonaMascota.size()>0 ){
			 
			Persona persona = personaService.obtenerPersonaContactosPorId(listaPersonaMascota.get(0).getPersonaId());
			encontrado.setPersona(persona);
		 }
		 
		 
		Mascota mascota=mascotaMapper.selectByPrimaryKey(encontrado.getMascotaId());
		mascota.setDesGenero(elementoMapper.selectByPrimaryKey(mascota.getGenero()).getDesAbreviacion());
		if(mascota.getRaza()!=null){
			mascota.setDesRaza(elementoMapper.selectByPrimaryKey(mascota.getRaza()).getDesNombre());	
		}
		mascota.setDesTamanio(elementoMapper.selectByPrimaryKey(mascota.getTamanio()).getDesNombre());
		mascota.setDesColor(elementoMapper.selectByPrimaryKey(mascota.getColor()).getDesNombre());
		encontrado.setMascota(mascota);
		
		encontrado.setDesDistrito(ubigeoMapper.selectByPrimaryKey(encontrado.getDistrito()).getNombre());
		
		return encontrado;
	}

	
	//@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void saveEncontradoMascota(Encontrado encontrado, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub

		Mascota mascota=new Mascota();
		
		Integer idMascota = null;
		EncontradoFoto ef = null;
		List<Mascota> list = null;
		if(encontrado.getMascotaId()!=null){
			
			idMascota = encontrado.getMascotaId();
		
			encontrado.getMascota().setFechaModifico(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				encontrado.getMascota().setUsuarioModifico(usuario.getUsuario());
			}
			mascota=encontrado.getMascota();
			mascotaMapper.updateByPrimaryKeySelective(mascota);
			
		}else{
			encontrado.getMascota().setFechaRegistro(new Date());
			
			if(usuario != null && usuario.getUsuario() != null){
				encontrado.getMascota().setUsuarioRegistro(usuario.getUsuario());
			}
			
			mascota=encontrado.getMascota();
			mascota.setEstado(Constante.ESTADO_ACTIVO);
			encontrado.setFechaEncontrado(new Date());
			mascotaMapper.insertSelective(mascota);
			
		}
		
		
		System.out.println("MIRAR ID MASCOTA===========>>"+mascota.getId());
		
		if(encontrado.getId()!=null){
			encontrado.setMascotaId(mascota.getId());
			encontrado.setFechaModifico(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				encontrado.setUsuarioModifico(usuario.getUsuario());
			}
			encontradoMapper.updateByPrimaryKeySelective(encontrado);
		}else{
			encontrado.setEstado(Constante.ESTADO_ACTIVO);
			encontrado.setMascotaId(mascota.getId());
			encontrado.setFechaRegistro(new Date());
			encontrado.setFechaEncontrado(new Date());
			if(usuario != null && usuario.getUsuario() != null){
				encontrado.setUsuarioRegistro(usuario.getUsuario());
			}else{
				
				if(encontrado.getUsuarioRegistro() != null){
					try{
						Integer idUsuario = Integer.parseInt(encontrado.getUsuarioRegistro().toString());
						
						Usuario usuarioUpdate = usuarioService.obtenerUsuarioAll(idUsuario);
						
						if(usuarioUpdate!= null &&
								usuarioUpdate.getPersona() != null &&
								usuarioUpdate.getPersona().getContactoPrincipal() != null &&
								usuarioUpdate.getPersona().getContactoPrincipal().getNumero() == null){
							usuarioUpdate.getPersona().getContactoPrincipal().setNumero(encontrado.getTelefono());
							contactoMapper.updateByPrimaryKeySelective(usuarioUpdate.getPersona().getContactoPrincipal());
						}
						
					}catch (Exception e) {}
				}
				
			}
			encontradoMapper.insertSelective(encontrado);
			
			//Generacion de QR
			String pathQR = Constante.PATH_QR+"encontrado/";
			String urlTargeQR = "";
			
			try {
				urlTargeQR = elementoMapper.selectByPrimaryKey(Constante.ELEMENTO_QR_ENCONTRE).getDesNombre();
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println("URL QR DE PARAMETRO("+Constante.ELEMENTO_QR_ENCONTRE+") NO ENCONTRADO.");
			}
			
			GenerateQRCode.execute(urlTargeQR, pathQR, encontrado.getId().toString()+"_qr.png");
			encontrado.setFotoQr("images/qr/encontrado/"+encontrado.getId().toString()+"_qr.png");
			encontradoMapper.updateByPrimaryKeySelective(encontrado);
			
			//Invocar al hilo
			HashMap<String, Object> parametros = new HashMap<String, Object>();
			parametros.put("proceso", Constante.PROCESO_NOTIFICACION_ENCONTRADO);
			parametros.put("idEncontrado", encontrado.getId());
			getHiloProceso().setParametros(parametros);
			adminColaHilos.executeThread(getHiloProceso());
			
			
		}
		
		String imgResponse = "";
		MascotaFoto mf = new MascotaFoto(); 
		if(encontrado.getFileFoto() != null){
			
			String node = "encontrado/mascota/"+mascota.getId();
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			MultipartFile fileFoto = encontrado.getFileFoto();
			
			String fileName = fileFoto.getOriginalFilename();
			
			try{
			 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			
			ef = new EncontradoFoto();
			ef.setEncontradoId(encontrado.getId());
			imgResponse = "images/"+node+"/"+fileName;
			ef.setFoto(imgResponse);
			encontradoFotoMapper.insertSelective(ef);
			mf.setFoto(imgResponse);
			encontrado.getMascota().setFotoPrincipal(mf);
			encontrado.setFileFoto(null);
			
			Encontrado bt = new Encontrado();
			bt.setId(encontrado.getId());
			bt.setFotopublicacion(imgResponse);
			encontradoMapper.updateByPrimaryKeySelective(bt);
			
		}else{
			if(idMascota!=null){
				
				Mascota m = new Mascota();
				m.setId(idMascota);
				list = mascotaService.listarMascota(m);
				if(list != null && list.size() > 0){
					m = list.get(0);
					ef = new EncontradoFoto();
					ef.setEncontradoId(encontrado.getId());
					imgResponse = m.getFotoPrincipal().getFoto();
					ef.setFoto(imgResponse);
					encontradoFotoMapper.insertSelective(ef);
					mf.setFoto(imgResponse);
					encontrado.getMascota().setFotoPrincipal(mf);
					
					Encontrado bt = new Encontrado();
					bt.setId(encontrado.getId());
					bt.setFotopublicacion(imgResponse);
					encontradoMapper.updateByPrimaryKeySelective(bt);
				}
				
			}
		}
 		
	
		
	}

	
	public List<EncontradoFoto> listFotoMascotaEncontrado(Encontrado e) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("valor ID:"+e.getId());
		EncontradoFotoCriteria criteriaBusqFoto=new EncontradoFotoCriteria();
		criteriaBusqFoto.createCriteria().andEncontradoIdEqualTo(e.getId());
		
		return encontradoFotoMapper.selectByExample(criteriaBusqFoto);
	}

	
	public String generarPosterHtml(Encontrado encontrado) throws Exception {
		// TODO Auto-generated method stub
		
		
		StringBuilder htmlString = new StringBuilder();
		System.out.println("ubicacion_catastro"+encontrado.getUbicacionCatastro());
		
		String coordenada[]=encontrado.getUbicacionCatastro().split(" "); //40.718217,-73.998284
		
		String dominio=elementoMapper.selectByPrimaryKey(Constante.ELEMENTO_URL_WEB_BACKEND).getDesNombre();
		
		
		String url_foto="";
		if(encontrado.getEncontradoMascotaFotos()!=null && encontrado.getEncontradoMascotaFotos().get(0)!=null){
			url_foto=dominio+encontrado.getEncontradoMascotaFotos().get(0).getFoto();
		}else{
			url_foto=dominio+"imagenes/pata_perro.jpg.jpg";
		}
		
		
		String url_catastro="https://maps.googleapis.com/maps/api/staticmap?zoom=14&size=380x286&maptype=roadmap&markers=color:red%7Clabel:C%7C"+coordenada[0]+","+coordenada[1]+"&key=AIzaSyCi7kmMyhXzLRRl5DmYPDeGE2Ow5d0bB8c";
		String url_logo=dominio+"imagenes/pata_de_perro_03.jpg";
		String url_logo_iphone=dominio+"imagenes/disponible-appstore.jpg";
		String url_logo_android=dominio+"imagenes/google-play-store.png";
		String url_logo_qr=dominio+encontrado.getFotoQr();
		String url_logo_phone=dominio+"imagenes/img_phone.png";
		String url_logo_perrito=dominio+"imagenes/PERROAMOR.jpg";
		
		
		String accion="";
		if(encontrado.getTipoEncuentro().equals(Constante.ACCION_LO_VI)){
			accion="VI";
		}else{
			accion="TENGO";
		}
		
		String nombre="";
		if(encontrado.getPersona()!=null){
			if(encontrado.getPersona().getNombres()!=null && encontrado.getPersona().getNombres().trim().length()>0){
				nombre=encontrado.getPersona().getNombres().trim().toUpperCase();
			}else{
				nombre=encontrado.getPersona().getNombreCompleto();
			}
		}else{
			Usuario usuario=new Usuario();
			
			if(encontrado.getUsuarioRegistro()!=null && encontrado.getUsuarioRegistro().trim().length()>0){
				usuario=obtenerUsuarioID(Integer.parseInt(encontrado.getUsuarioRegistro()));
			}else{
				if(encontrado.getMascota().getUsuarioRegistro()!=null && encontrado.getMascota().getUsuarioRegistro().trim().length()>0){
					usuario=obtenerUsuarioID(Integer.parseInt(encontrado.getMascota().getUsuarioRegistro()));
				}
			}
			
			
			if(usuario!=null){
				encontrado.setPersona(usuario.getPersona());
				
				if(usuario.getPersona().getNombres()!=null && usuario.getPersona().getNombres().trim().length()>0){
					nombre=usuario.getPersona().getNombres().toUpperCase();
				}else{
					nombre=usuario.getPersona().getNombreCompleto().toUpperCase();
				}
			}
		}
		
		String raza="";
		if(encontrado.getMascota()!=null && encontrado.getMascota().getDesRaza()!=null){
			raza=encontrado.getMascota().getDesRaza().toUpperCase()+",";
		}
		
		String telefono="";
		if(encontrado.getTelefono()!=null){
			telefono=encontrado.getTelefono().toString();
		}else
			if	(encontrado.getPersona().getContactoPrincipal()!=null){
			telefono=encontrado.getPersona().getContactoPrincipal().getNumero();
		}
		String descripcion="";
		String comentario="";
		String nombrePerro="";
		if(encontrado.getMascota().getNombre()!=null){
			nombrePerro=encontrado.getMascota().getNombre().toUpperCase();
		}else{
			nombrePerro="UN PATA DE PERRO";
		}
    	
    	
    	htmlString.append(new String("\n <html>"));
        htmlString.append(new String("\n <body>"));
        htmlString.append(new String("\n <div style=\" height: 690px; \">"));
        
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table  style=\"  height: 80px;\" cellspacing=\"0\">"));
        htmlString.append(new String("\n <tbody>"));
        htmlString.append(new String("\n <tr> "));
        htmlString.append(new String("\n <td style=\"width: 200px; height: 70px;\"  ></td>"));
        htmlString.append(new String("\n <td style=\"width: 698px;   font-size: 50px; text-align: center; font-weight:bold\"> "+accion+" A "+nombrePerro+"</td>"));
        htmlString.append(new String("\n <td style=\"width: 200px;  text-align: center; border:1px solid black;font-size: 12px; font-weight:bold;  !important \">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>"));
        htmlString.append(new String("\n </tr>"));
        htmlString.append(new String("\n </tbody>"));
        htmlString.append(new String("\n </table></p>"));
        
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table style=\"  height: 280px;\" cellspacing=\"0\">"));
        htmlString.append(new String("\n 	<tbody> "));
        htmlString.append(new String("\n<tr> "));
        htmlString.append(new String("\n <td  style=\" width: 20px; \" ></td> "));
        htmlString.append(new String("\n <td  style=\" width: 438px;\"><img width=\"430\" height=\"330px\"  src=\""+url_foto+"\"/></td>  "));
        htmlString.append(new String("\n <td  style=\" width: 438px;\"><img   src=\""+url_catastro+"\" /></td> "));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px;font-weight:bold;  !important\">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com<hr style=\"height: 3px; background-color: black;\"/>"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td> "));
        htmlString.append(new String("\n </tr> "));
        htmlString.append(new String("\n </tbody> "));
        htmlString.append(new String("\n </table></p> "));	  


        
        if(encontrado.getMascota().getCaracteristica()!=null && encontrado.getMascota().getCaracteristica().toUpperCase().trim().length()>0){
        	descripcion=" "+encontrado.getMascota().getCaracteristica().toUpperCase()+", ";
        }
        
        if(encontrado.getMascota().getDesComentario()!=null && encontrado.getMascota().getDesComentario().toUpperCase().trim().length()>0){
        	comentario=""+encontrado.getMascota().getDesComentario().toUpperCase();
        }
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px;\" ><table style=\"  height: 50px;\" cellspacing=\"0\"> "));
        htmlString.append(new String("\n <tbody>  "));
        htmlString.append(new String("\n <tr>  "));
        htmlString.append(new String("\n <td  style=\" width: 100px; text-align: center; \" ><img width=\"70px\" height=\"40px\"  src=\""+url_logo_perrito+"\" /> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 798px;  font-family: Arial, Tahoma, sans-serif; font-size: 22px;\"><p> "+raza+"  "+encontrado.getMascota().getDesGenero().toUpperCase()+", "+encontrado.getMascota().getDesTamanio().toUpperCase()+" PERDIDO EN "+encontrado.getDesDistrito().toUpperCase()+" <br/> "+descripcion+" "+comentario+" </p> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px; font-weight:bold;  !important\" >"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>  "));
        htmlString.append(new String("\n </tr>  "));
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p>  "));
        
        
        htmlString.append(new String("\n <p style=\"margin-left:0px;margin-bottom:0px;margin-right:0px;margin-top:0px; \"><table style=\"  height: 40px;\" cellspacing=\"0\">  "));
        htmlString.append(new String("\n <tbody>  "));
        htmlString.append(new String("\n <tr>   "));
        htmlString.append(new String("\n <td  style=\" width: 100px; text-align: center;\" ><img width=\"70px\" height=\"40px\"  src=\""+url_logo_phone+"\"/> </td>  "));
        htmlString.append(new String("\n <td  style=\" width: 798px;  font-family: Arial, Tahoma, sans-serif; font-size: 22px;\"><p> POR FAVOR CONTACTAR A: "+encontrado.getPersona().getNombreCompleto()+" "+telefono+"</p></td>"));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center; border:1px solid black;font-size: 12px;font-weight:bold; !important \" >"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>  "));
        htmlString.append(new String("\n</tr>  "));
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p> "));
    


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
        htmlString.append(new String("\n   <td  style=\" width: 280px;text-align:left;  font-family: Arial, Tahoma, sans-serif; font-size: 12px; margin-top:4px;margin-bottom:4px;\"> ")); 
        htmlString.append(new String("\n   <img width=\"240px\" height=\"120px\"  src=\""+url_logo+"\" />  "));
        htmlString.append(new String("\n  </td> "));
        htmlString.append(new String("\n <td  style=\" width: 200px; text-align: center;  border:1px solid black; font-size: 12px;font-weight:bold; !important\">"+nombre+"<br/>"+telefono+"<br/>pataperroapp.com</td>"));
        htmlString.append(new String("\n </tr> ")); 
        htmlString.append(new String("\n </tbody>  "));
        htmlString.append(new String("\n </table></p>  "));


 		htmlString.append(new String("\n </div>  "));
 		htmlString.append(new String("\n </body>  "));
        htmlString.append(new String("\n </html>  "));
        
        System.out.println(htmlString);
    	return htmlString.toString();
	}

	
	public Integer countNuevosEncontrados(Encontrado encontrado) throws Exception {
		// TODO Auto-generated method stub
		EncontradoCriteria ec = new EncontradoCriteria();
		ec.createCriteria()
							.andEstadoEncontradoIsNull()
							.andDistritoEqualTo(encontrado.getDistrito())
							.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		return encontradoMapper.countByExample(ec);
	}
	
	public HiloProceso getHiloProceso() {
		return hiloProceso;
	}

	public void setHiloProceso(HiloProceso hiloProceso) {
		this.hiloProceso = hiloProceso;
	}

	@Override
	public Map<String, Object> getEncontradoVigencia(String idUsuario) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idUsuario", idUsuario);
		String strMaxMeses = elementoMapper.selectByPrimaryKey(Constante.ID_PARAMETRO_MAX_MESES_VIGENCIA).getDesNombre();
		param.put("maxMes", Integer.parseInt(strMaxMeses));
		return encontradoMapper.getEncontradoVigencia(param);
	}

	@Override
	public void updateEncontreMapper(Encontrado e) {
		encontradoMapper.updateByPrimaryKeySelective(e);
	}

}
