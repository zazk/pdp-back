package pe.com.pdp.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import pe.com.pdp.Constante;
import pe.com.pdp.FileUtil;
import pe.com.pdp.dao.postgres.ElementoMapper;
import pe.com.pdp.dao.postgres.MascotaFotoMapper;
import pe.com.pdp.dao.postgres.MascotaMapper;
import pe.com.pdp.dao.postgres.PersonaMapper;
import pe.com.pdp.dao.postgres.PersonaMascotaMapper;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.MascotaCriteria;
import pe.com.pdp.domain.postgres.MascotaFoto;
import pe.com.pdp.domain.postgres.MascotaFotoCriteria;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.PersonaMascota;
import pe.com.pdp.domain.postgres.PersonaMascotaCriteria;
import pe.com.pdp.service.MascotaService;

@Service
public class MascotaServiceImpl implements MascotaService {

	@Autowired
	private MascotaMapper mascotaMapper;
	
	@Autowired
	private MascotaFotoMapper mascotaFotoMapper;
	
	@Autowired
	private PersonaMascotaMapper personaMascotaMapper;
	
	@Autowired
	private PersonaMapper personaMapper;
	
	@Autowired
	private ElementoMapper elementoMapper;
	
	public Mascota obtenerPotID(Integer id) {
		
		Mascota m = new Mascota();
		m.setId(id);
		
		List<Mascota> list = this.listarMascota(m);
		
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		
		return null;
		
//		Mascota mascota=mascotaMapper.selectByPrimaryKey(id);
//		
//		PersonaMascotaCriteria criteria=new PersonaMascotaCriteria();
//		criteria.createCriteria().andMascotaIdEqualTo(mascota.getId());
//
//		List<PersonaMascota> listPerMascota =personaMascotaMapper.selectByExample(criteria);
//		Persona persona=new Persona();
//		if(listPerMascota!=null && listPerMascota.size()>0){
//			persona=personaMapper.selectByPrimaryKey(listPerMascota.get(0).getPersonaId());
//			mascota.setPersona(persona);		
//		}
//		
//		MascotaFotoCriteria criteriaMascFoto=new  MascotaFotoCriteria();
//		criteriaMascFoto.createCriteria().andMascotaIdEqualTo(mascota.getId());
//		
//		List<MascotaFoto> listMascotaFoto=mascotaFotoMapper.selectByExample(criteriaMascFoto);
//		
//		mascota.setGaleriaFotos(listMascotaFoto);
//		
//		return mascota;
	}

	public List<Mascota> listarMascota(Mascota mascota) {
		// TODO Auto-generated method stub
		
		List<Mascota> mascotas = mascotaMapper.listarMascotasPersona(mascota);
		
		if(mascotas != null && mascotas.size() > 0){
			
			MascotaFotoCriteria mfc = null;
			MascotaFoto fotoPrincipal = null;
			List<MascotaFoto> galeria = null;
			for (Mascota m : mascotas) {
				mfc = new MascotaFotoCriteria();
				mfc.createCriteria().andMascotaIdEqualTo(m.getId());
				galeria = mascotaFotoMapper.selectByExample(mfc);
				m.setGaleriaFotos(galeria);
				if(galeria != null){
					for (MascotaFoto mascotaFoto : galeria) {
						if(Constante.ESTADO_ACTIVO == mascotaFoto.getIndPrincipal()){
							fotoPrincipal = mascotaFoto;
							m.setFotoPrincipal(fotoPrincipal);
							break;
						}
						
					}
				}
				
				
			}
		}
		
		return mascotas;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Mascota save(Mascota mascota) throws Exception {
		// TODO Auto-generated method stub
		
		PersonaMascota perMascota = null;
		
		if(mascota.getId() == null){
			mascota.setEstado(Constante.ESTADO_ACTIVO);
			mascota.setFechaRegistro(new Date());
			mascotaMapper.insertSelective(mascota);
			
			perMascota = new PersonaMascota();
			perMascota.setMascotaId(mascota.getId());
			perMascota.setPersonaId(mascota.getPersonaId());
			
			personaMascotaMapper.insertSelective(perMascota);
			
		}else{
			mascota.setFechaModifico(new Date());
			mascotaMapper.updateByPrimaryKeySelective(mascota);
		}
		
		if(mascota.getFileFoto() != null){
			
			String node = "mascotas/"+mascota.getId();
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			MultipartFile fileFoto = mascota.getFileFoto();
			
			String fileName = fileFoto.getOriginalFilename();
			
			if(fileName.trim().length()>1){
				
				try{
					 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
					}catch (Exception e) {
						// TODO: handle exception
					}
					
					MascotaFotoCriteria mfc = new MascotaFotoCriteria();
					mfc.createCriteria()
										.andMascotaIdEqualTo(mascota.getId())
										.andIndPrincipalEqualTo(Constante.ESTADO_ACTIVO);
					
					mascotaFotoMapper.deleteByExample(mfc);
					
					MascotaFoto fotoPrincipal = new MascotaFoto();
					fotoPrincipal.setMascotaId(mascota.getId());
					fotoPrincipal.setFoto("images/"+node+"/"+fileName);
					fotoPrincipal.setIndPrincipal(Constante.ESTADO_ACTIVO);
					
					mascotaFotoMapper.insertSelective(fotoPrincipal);
					mascota.setFotoPrincipal(fotoPrincipal);
			}
			
			
			
			mascota.setFileFoto(null);
			
		}
		
		
	
		
		if(mascota.getFilesFoto() != null && mascota.getFilesFoto().size()>0 ){
			
			String node = "mascotas/"+mascota.getId()+"/extra";
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			for (int i = 0; i < mascota.getFilesFoto().size(); i++) {
				
				MultipartFile fileFoto = mascota.getFilesFoto().get(i);
				
				String fileName = fileFoto.getOriginalFilename();
				
				if(fileName.trim().length()>1){
					
					try{
						 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
						}catch (Exception e) {
							// TODO: handle exception
						}
						
						MascotaFotoCriteria mfc = new MascotaFotoCriteria();
						mfc.createCriteria().andMascotaIdEqualTo(mascota.getId())
						.andIndPrincipalEqualTo(Constante.ESTADO_INACTIVO);
						
						mascotaFotoMapper.deleteByExample(mfc);
						
						MascotaFoto fotoSecundaria= new MascotaFoto();
						fotoSecundaria.setMascotaId(mascota.getId());
						fotoSecundaria.setFoto("images/"+node+"/"+fileName);
						fotoSecundaria.setIndPrincipal(Constante.ESTADO_INACTIVO);
						
						mascotaFotoMapper.insertSelective(fotoSecundaria);
				}
				
				
				
			}
			
			
			mascota.setFilesFoto(null);
			
			
		}
		mascota.setPersonaId(null);
		
		
		
		List<Mascota> list = this.listarMascota(mascota);
		if(list != null && list.size() > 0){
			mascota = list.get(0);
		}
		
		
		
		return mascota;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		Mascota mascota = new Mascota();
		mascota.setId(id);
		mascota.setEstado(Constante.ESTADO_INACTIVO);
		mascota.setFechaModifico(new Date());
		mascotaMapper.updateByPrimaryKeySelective(mascota);
	}

	
	public List<Map<String, Object>> findListaMascota(Mascota mascota) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(mascota.getId()!=null ){
			parametros.put("MASCOTA_ID",  mascota.getId() );
		}
		
		if(mascota.getNombre()!=null &&   mascota.getNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE",  mascota.getNombre() );
		}
		
		if(mascota.getRaza()!=null && mascota.getRaza()!=0  ){
			parametros.put("TIPO_RAZA",  mascota.getRaza() );
		}
		
		if(mascota.getTamanio()!=null && mascota.getTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  mascota.getTamanio() );
		}
		
		if(mascota.getGenero()!=null && mascota.getGenero()!=0){
			parametros.put("TIPO_GENERO",  mascota.getGenero() );
		}
		
		
		if(mascota.getPersona()!=null && mascota.getPersona().getNombreCompleto()!=null &&  mascota.getPersona().getNombreCompleto().trim().length()>0){
			parametros.put("NOMBRE_COMPLETO",  mascota.getPersona().getNombreCompleto().toUpperCase().trim());
		}
		
		if(mascota.getPersona()!=null && mascota.getPersona().getTipoDocumento()!=null ){
			parametros.put("TIPO_DOCUMENTO",  mascota.getPersona().getTipoDocumento());
		}
		
		if(mascota.getPersona()!=null && mascota.getPersona().getNroDocumento()!=null && mascota.getPersona().getNroDocumento().trim().length()>0){
			parametros.put("NRO_DOCUMENTO",  mascota.getPersona().getNroDocumento().trim());
		}
		
		if(mascota.getStart()!=null){
			parametros.put("INICIO_PAG", mascota.getStart().intValue());
		}
		
		
		return mascotaMapper.selectByMascota(parametros);
	}

	
	public int countMascotas(Mascota mascota) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		
		if(mascota.getId()!=null ){
			parametros.put("MASCOTA_ID",  mascota.getId() );
		}
		
		if(mascota.getNombre()!=null  &&   mascota.getNombre().trim().length()>0){
			parametros.put("MASCOTA_NOMBRE",  mascota.getNombre() );
		}
		
		if(mascota.getRaza()!=null && mascota.getRaza()!=0  ){
			parametros.put("TIPO_RAZA",  mascota.getRaza() );
		}
		
		if(mascota.getTamanio()!=null  && mascota.getTamanio()!=0 ){
			parametros.put("TIPO_TAMANIO",  mascota.getTamanio() );
		}
		
		if(mascota.getGenero()!=null && mascota.getGenero()!=0){
			parametros.put("TIPO_GENERO",  mascota.getGenero() );
		}
		
		if(mascota.getPersona()!=null && mascota.getPersona().getNombreCompleto()!=null &&  mascota.getPersona().getNombreCompleto().trim().length()>0){
			parametros.put("NOMBRE_COMPLETO",  mascota.getPersona().getNombreCompleto().toUpperCase().trim());
		}
		
		if(mascota.getPersona()!=null && mascota.getPersona().getTipoDocumento()!=null ){
			parametros.put("TIPO_DOCUMENTO",  mascota.getPersona().getTipoDocumento());
		}
		
		if(mascota.getPersona()!=null && mascota.getPersona().getNroDocumento()!=null && mascota.getPersona().getNroDocumento().trim().length()>0){
			parametros.put("NRO_DOCUMENTO",  mascota.getPersona().getNroDocumento().trim());
		}
		
		return mascotaMapper.countMascotas(parametros);
	}

	public int countTotalMascotas() throws Exception {
		// TODO Auto-generated method stub
		MascotaCriteria mascotaCriteria=new MascotaCriteria();
		mascotaCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		Long cantidad=mascotaMapper.countByExample(mascotaCriteria);
		return cantidad.intValue();
		
	}
	
	
	public String generateHtmlPosterRegMascota(){
		String ruta="";
		StringBuilder htmlString = new StringBuilder();
		String dominio=elementoMapper.selectByPrimaryKey(Constante.ELEMENTO_URL_WEB_BACKEND).getDesNombre();
		String url_foto="";
				
			
	 
	 htmlString.append(new String("\n  <%@ page language=\"java\" contentType=\"text/html; charset=ISO-8859-1\" pageEncoding=\"ISO-8859-1\"%> "));
	 htmlString.append(new String("\n  <html> "));
	 htmlString.append(new String("\n		<head>"));
	 htmlString.append(new String("\n		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">"));
	 htmlString.append(new String("\n		<title>Poster Busqueda</title>"));
	 htmlString.append(new String("\n			<jsp:include page=\"include/includescripts.jsp\"></jsp:include> "));
	 htmlString.append(new String("\n		<style> "));
	 htmlString.append(new String("\n		@font-face { "));
	 htmlString.append(new String("\n			font-family: segoePrint; "));
	 htmlString.append(new String("\n			src: url(plugins/bootstrap/fonts/fonts.com_SegoePrint.ttf) "));
	 htmlString.append(new String("\n				format('truetype'); "));
	 htmlString.append(new String("\n		} "));
	 htmlString.append(new String("\n			@font-face { "));
	 htmlString.append(new String("\n font-family: segoeUI; "));
	 htmlString.append(new String("\n src: url(plugins/bootstrap/fonts/segoe-ui.ttf) format('truetype'); "));
	 htmlString.append(new String("\n } "));
	 htmlString.append(new String("\n body{ "));
	 htmlString.append(new String("\n font-family: segoePrint; !important; "));
     htmlString.append(new String("\n background-image: url('imagenes/fondo_morado.jpg'); no-repeat; "));
				
     htmlString.append(new String("\n		} "));


     htmlString.append(new String("\n		.color-texto-bienvenido{ "));
     htmlString.append(new String("\n			color:#EDB63B; "));
     htmlString.append(new String("\n		} "));

     htmlString.append(new String("\n		.color-texto-bienvenido h4{ "));
     htmlString.append(new String("\n				text-align:center; "));
     htmlString.append(new String("\n		} "));

     htmlString.append(new String("\n		.color-texto-bienvenido h4>span{ "));
     htmlString.append(new String("\n text-transform: uppercase; "));
     htmlString.append(new String("\n } "));

     htmlString.append(new String("\n			</style> "));

     htmlString.append(new String("\n </head> "));
     htmlString.append(new String("\n <body class=\"theme-purple bg-purple\" > "));

    	htmlString.append(new String("\n		<div class = \"container\"> "));
				
    	htmlString.append(new String("\n <div class =\"row\" > "));
    	htmlString.append(new String("\n <div class =\"col s12 color-texto color-texto-bienvenido\"> "));
        htmlString.append(new String("\n <h4><span>${objectMascota.nombre}</span> es ahora parte de la comunidad mas grande de doglovers.</h4> "));
        htmlString.append(new String("\n <h4 >¡¡BIENVENIDO <span>${objectMascota.nombre}</span>!!</h4> "));
    	htmlString.append(new String("\n					</div> "));
    	 htmlString.append(new String("\n </div>"));
				
    	 htmlString.append(new String("\n <div class =\"row center\">"));
    	 htmlString.append(new String("\n <img id=\"fotoMascota\" class=\"responsive-img\"  src=\"http://138.197.88.11:8080/pdp/${objectMascota.fotoPrincipal.foto}\"/>"));	
    	 htmlString.append(new String("\n </div> "));
					
    	 htmlString.append(new String("\n <div class =\"row\">"));
				
    	 htmlString.append(new String("\n <div class=\"col s12 m6 l6 center\"> "));
    	htmlString.append(new String("\n <img id=\"logo\" class=\"responsive-img\"   src=\"imagenes/pata_perro_logo_poster.jpg\"/> "));	
        htmlString.append(new String("\n </div> "));
					
    	htmlString.append(new String("\n	<div class=\"col s12 m6 l6 center\"> "));
    	htmlString.append(new String("\n <h5 style=\"color:#EDB63B !important;\">Descargala ya!!</h5> "));
    	htmlString.append(new String("\n <div class=\"row clearfix center\"> "));
    	htmlString.append(new String("\n <div class=\"col s12 m12 l12\" > "));
    	htmlString.append(new String("\n <img id=\"appstore\" class=\"responsive-img\" style=\"width: 56%\"  src=\"imagenes/google-play-store.png\"  /> "));
								
    	htmlString.append(new String("\n </div> "));
    	htmlString.append(new String("\n				</div> "));
						
    	htmlString.append(new String("\n <div class=\"row clearfix center\"> "));
    	htmlString.append(new String("\n <div class=\"col s12 m12 l12\" > "));
    	htmlString.append(new String("\n <img id=\"appstore\" class=\"responsive-img\" style=\"width: 56%\"  src=\"imagenes/app-store.png\"  /> "));
    	htmlString.append(new String("\n </div>"));
    	htmlString.append(new String("\n </div> "));
						
    	htmlString.append(new String("\n </div> "));
					
    	htmlString.append(new String("\n </div> "));
		      
    	htmlString.append(new String("\n </div> "));

    	htmlString.append(new String("\n </body> "));
    	htmlString.append(new String("\n </html> "));
				
				
		return ruta;
	}
	
	
	
	
	
	 

}
