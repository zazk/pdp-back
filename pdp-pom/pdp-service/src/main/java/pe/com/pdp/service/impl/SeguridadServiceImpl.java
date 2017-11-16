package pe.com.pdp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.UtilMD5;
import pe.com.pdp.dao.postgres.RolOpcionMapper;
import pe.com.pdp.domain.postgres.Email;
import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.RolOpcion;
import pe.com.pdp.domain.postgres.RolOpcionCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.EmailService;
import pe.com.pdp.service.OpcionService;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.RolService;
import pe.com.pdp.service.SeguridadService;
import pe.com.pdp.service.UsuarioService;

@Service
public class SeguridadServiceImpl implements SeguridadService {
	
	private static Logger logger = Logger.getLogger(SeguridadServiceImpl.class);
	
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private PersonaService personaService;
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private OpcionService opcionService;
	
	@Autowired
	private RolOpcionMapper  rolOpcionMapper;

	public Usuario autenticar(String username, String password) throws Exception {
		logger.info("Ingreso SeguridadSevice : autenticar()  ");
		Usuario usuario = usuarioService.findUsuarioByUserName(username);
		
		if(usuario == null){
			throw new GenericExcepcion("El usuario ingresado no existe.");
		}
		
		String newPasswordMD5 = UtilMD5.getMD5Spring(password);
		
		if(!usuario.getPass().equals(newPasswordMD5)){
			throw new GenericExcepcion("La contraseña es incorrecta.");
		}
		
		return usuario;
		
	}
	
//	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	 public Usuario olvideContrasena(String  emailRecuperar) throws Exception{
		 logger.info("Ingreso SeguridadSevice : olvideContrasena()  ");
		List<Email>  listEmail=emailService.findEmailActico(emailRecuperar);
		Usuario usuario=null; 		 
		if(listEmail!=null && listEmail.size()>0 ){
			
			Persona persona=null;
			Email emailEnvio=null;
			for (Email email : listEmail) {
				usuario=new Usuario();
				persona=new Persona();
				persona=personaService.findPersonaByPk(email.getPersonaId());
				usuario=usuarioService.findUsuarioByPersonaId(email.getPersonaId());
			
				
				usuario=usuarioService.generateUpdatePassword(usuario);
				usuario.setPersona(persona);
				
				emailEnvio=new Email();
				emailEnvio.setTo(emailRecuperar);
				emailEnvio.setTextHtml(true);
				emailEnvio.setText("Buenas Tardes, Su nueva contraseña de nuesta Apicación PataPerro es <b>"+usuario.getPaswordSinMd5()+" </b>");
				emailEnvio.setSubject("Recuperación de Contraseña");
				emailService.sendMailPersonal(emailEnvio);
			}
			
		}else{
			throw new GenericExcepcion("El email no se encuentra registrado.");
		}
	  return usuario;
		 
	 }

	 
	 /**USUARIO**/

	public List<Map<String, Object>>  listarUsuarios(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return usuarioService.findListaUsuario(usuario);
	}
	public Usuario getUsuarioByPk(Integer idUsuario) throws Exception{
		return usuarioService.findUsuarioByPk(idUsuario);
	}
	
	 
	public int countUsuarios(Usuario usuario)throws Exception{
		return usuarioService.countUsuarios(usuario);
	}
	
	public int countTotalUsuarios() throws Exception{
		return usuarioService.countTotalUsuarios();
	}
	
	
	public Usuario saveUsuario(Usuario usuario, Usuario usuarioSession) throws Exception {
		// TODO Auto-generated method stub
			Persona persona=personaService.findPersonaByPk(usuario.getPersonaId());
			usuario.setPersona(persona);
		return usuarioService.save(usuario, usuarioSession, null);
	}
	
	public void deleteUsuario(Integer idUsuario) throws Exception{
		 usuarioService.deleteByPk(idUsuario);
	}
	
	
	 
	 /**ROL**/
	 public List<Map<String, Object>>  listarRoles(Rol rol, Usuario usuario) throws Exception {
			// TODO Auto-generated method stub
	  return rolService.findAll(rol, usuario);
	}
	 
	public int countRoles(Rol rol, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return rolService.countRole(rol,  usuario);
	}
	
	public int countTotalRoles() throws Exception {
		return rolService.countTotalRoles();
	}

	public Rol getRolByPk(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		return rolService.findByPk(idRol);
	}

	public Rol saveRol(Rol rol, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return rolService.save(rol, usuario);
	}

	public void deleteRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		rolService.deleteByPk(idRol);
	}
	
	
	/**OPCION**/
	public List<Map<String, Object>>  listarOpciones(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		return opcionService.findListaOpcion(opcion);
	}

	public int countOpciones(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		return opcionService.countOpciones(opcion);
	}
	
	public List<Opcion> findAll(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		return opcionService.findAll(opcion);
	}

	public Opcion saveopcion(Opcion opcion, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return opcionService.save(opcion,usuario);
	}
	
	public Opcion getOpcionByPk(Integer idOpcion) throws Exception{
		return opcionService.findByPk(idOpcion);
	}

	public int countTotalOpciones() throws Exception {
		// TODO Auto-generated method stub
		return opcionService.countTotalOpciones();
	}
	
	public void deleteOpcion(Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		opcionService.deleteOpcion(idOpcion);;
	}

	/**OPCION - ROL**/
	
	public String obtenerTreeOpcionesPorRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("IDROL", idRol);
		params.put("IND_TIPO_MENU", Constante.CATALOGO_ID_TIPO_APPWEB);
		List<Map<String, Object>> opcionesPorRol=rolOpcionMapper.selectTreeRolOpcion(params);
		return this.strTreeRecursivo(opcionesPorRol);
	}


	public String strTreeRecursivo(List<Map<String, Object>> opcionesPorRol) throws Exception {
		// TODO Auto-generated method stub
		String strMenu="";
		String cadena="";
		Integer idPadre=null;
		List<Map<String, Object>> roots=new ArrayList<Map<String,Object>>();
		if(opcionesPorRol!=null && opcionesPorRol.size()>0){
			for (Map<String, Object> a : opcionesPorRol) {
				if(a.get("indPadre")!=null){
					if(a.get("indPadre").toString().equals("0")){
						roots.add(a);
					}
					
				}
			}
		}

		int c = 0;
		
		for (Map<String, Object> root : roots) {
			idPadre = Integer.parseInt(root.get("idOpcion").toString());
			
			
			if(root.get("nombreOpcion").toString().trim().equals(Constante.MODULO_INICIO)){
				
				strMenu = strMenu
						.concat("{\n")
						.concat("\"text\": \""+root.get("nombreOpcion").toString()+"\",\n")
						.concat("\"cls\": \"folder\",\n")
						.concat("\"expanded\": true,\n")
						.concat("\"idOpcion\": "+root.get("idOpcion").toString()+",\n")
						.concat("\"checked\": "+(root.get("idRolOpcion")==null?true:true)+",\n")
						.concat("\"state\": { \"selected\": "+(root.get("idRolOpcion")==null?false:true)+"},\n")
						.concat("\"children\": [\n");
			}else{
				strMenu = strMenu
						.concat("{\n")
						.concat("\"text\": \""+root.get("nombreOpcion").toString()+"\",\n")
						.concat("\"cls\": \"folder\",\n")
						.concat("\"expanded\": true,\n")
						.concat("\"idOpcion\": "+root.get("idOpcion").toString()+",\n")
						.concat("\"checked\": "+(root.get("idRolOpcion")==null?false:true)+",\n")
						.concat("\"state\": { \"selected\": "+(root.get("idRolOpcion")==null?false:true)+"},\n")
						.concat("\"children\": [\n");
			}
			
			
			

			cadena = obtenerChildrensTree(opcionesPorRol, idPadre);
			strMenu = strMenu.concat(cadena);
			strMenu = strMenu.concat("]},");
			
//			if(roots.size() < c){
//				strMenu = strMenu.concat(",");
//			}
//			c++;
		}
		strMenu=strMenu.substring(0, strMenu.length()-1);
		strMenu = strMenu.replaceAll("},]}", "}]}");
		//strMenu = strMenu.replaceAll("},]", "}]");
		return "["+strMenu+"]";
	
	}
	
	private String obtenerChildrensTree(List<Map<String, Object>> opcionesPorRol,Integer padre){
		
		String childrens="",cadena="";
		Boolean isPadre=false;
		Integer indPadre=null;
		Integer countChildren=null;
		Integer idPadre=null;
		for (Map<String, Object> rolOpcion : opcionesPorRol) {
			indPadre=Integer.parseInt(rolOpcion.get("indPadre").toString());
			idPadre=Integer.parseInt(rolOpcion.get("idOpcion").toString());
			if(indPadre==padre){
				countChildren=Integer.parseInt(rolOpcion.get("childrens").toString());
				isPadre=(countChildren>0?true:false);
				
				if(isPadre){
					
					cadena=obtenerChildrensTree(opcionesPorRol,idPadre);
					if(!cadena.equals("")){
					childrens=childrens.concat("{\n");
					childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
					childrens=childrens.concat("\"cls\": \"folder\",\n");
					childrens=childrens.concat("\"expanded\": true,\n");
					childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+",\n");
					childrens=childrens.concat("\"state\": { \"selected\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"},\n");
					childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+"\n");
					childrens=childrens.concat(",\"children\": [\n");
					childrens=childrens.concat(cadena);
					childrens=childrens.concat("]},");
				
					}else{
						childrens=childrens.concat("{\n");
						childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
						childrens=childrens.concat("\"leaf\": true,\n");
						childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+",\n");
						childrens=childrens.concat("\"state\": { \"selected\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"},\n");
						childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"\n},\n");
					}
				}else{
					childrens=childrens.concat("{\n");
					childrens=childrens.concat("\"text\": \""+rolOpcion.get("nombreOpcion").toString()+"\",\n");
					childrens=childrens.concat("\"leaf\": true,\n");
					childrens=childrens.concat("\"idOpcion\": "+rolOpcion.get("idOpcion").toString()+",\n");
					childrens=childrens.concat("\"state\": { \"selected\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"},\n");
					childrens=childrens.concat("\"checked\": "+(rolOpcion.get("idRolOpcion")==null?false:true)+"\n},\n");
				}
			}
		}
		
		if(!childrens.equals("")){
			childrens=childrens.substring(0, childrens.length()-1);
		}
		
		return childrens;
	}
	
   private String obtenerChildrens(List<Map<String, Object>> opcionesPorRol,Integer padre){
	
	String childrens="",cadena="";
	Boolean isPadre=false;
	Integer indPadre=null;
	Integer countChildren=null;
	Integer idPadre=null;
	for (Map<String, Object> rolOpcion : opcionesPorRol) {
		indPadre=Integer.parseInt(rolOpcion.get("indPadre").toString());
		idPadre=Integer.parseInt(rolOpcion.get("idOpcion").toString());
		if(indPadre==padre){
			countChildren=Integer.parseInt(rolOpcion.get("childrens").toString());
			isPadre=(countChildren>0?true:false);
			
			if(isPadre){
				
				cadena=obtenerChildrens(opcionesPorRol,idPadre);
				if(!cadena.equals("")){
					
				childrens=childrens.concat("<li class=\"\">");
				childrens=childrens.concat("<a href=\"#\" onclick=\"Main.goToComponent('"+(rolOpcion.get("action")!=null?rolOpcion.get("action").toString():"")+"','"+rolOpcion.get("nombreOpcion").toString()+"','"+rolOpcion.get("idOpcion").toString()+"',1)\">"+rolOpcion.get("nombreOpcion").toString()+"</a>");
				//childrens=childrens.concat("<a  onclick=\"Main.goToComponent('"+(rolOpcion.get("action")!=null?rolOpcion.get("action").toString():"")+"','"+rolOpcion.get("nombreOpcion").toString()+"','"+rolOpcion.get("idOpcion").toString()+"');\" href=\"#\" class=\"dropdown-toggle\" ><i class=\"menu-icon fa fa-caret-right\"></i>"+rolOpcion.get("nombreOpcion").toString()+" <b class=\"arrow fa fa-angle-down\"></b></a>");
				//childrens=childrens.concat("<b class=\"arrow\"></b>");
				childrens=childrens.concat("<ul class=\"ml-menu\">");
				childrens=childrens.concat(cadena);
				childrens=childrens.concat("</ul>");
				childrens=childrens.concat("</li>");
				}else{
					childrens=childrens.concat("");
				}
			}else{
				childrens=childrens.concat("<a href=\"#\" onclick=\"Main.goToComponent('"+(rolOpcion.get("action")!=null?rolOpcion.get("action").toString():"")+"','"+rolOpcion.get("nombreOpcion").toString()+"','"+rolOpcion.get("idOpcion").toString()+"',1)\">"+rolOpcion.get("nombreOpcion").toString()+"</a>");
				}
			}
		}
		
		return childrens;
	}
   
	public String obtenerOpcionesPorRol(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("IDROL", idRol);
		List<Map<String, Object>> opcionesPorRol=rolOpcionMapper.selectMenu(params);
		return this.strMenuRecursivo(opcionesPorRol);
	}
   
	public String strMenuRecursivo(List<Map<String, Object>> opcionesPorRol) throws Exception {
		String strMenu="";
		String cadena="";
		Integer idPadre=null;
		List<Map<String, Object>> roots=new ArrayList<Map<String,Object>>();
		if(opcionesPorRol!=null && opcionesPorRol.size()>0){
			for (Map<String, Object> a : opcionesPorRol) {
				if(a.get("indPadre")!=null){
					if(a.get("indPadre").toString().equals("0")){
						roots.add(a);
					}
					
				}
			}
		}

		for (Map<String, Object> root : roots) {
			idPadre = Integer.parseInt(root.get("idOpcion").toString());
			strMenu = strMenu;
					
					if(root.get("nombreOpcion").toString().equals(Constante.MODULO_INICIO)){
						strMenu=strMenu
						.concat("<li class=\"active\">")
						.concat(" <a href=\"#\">")
						.concat("<i class=\"material-icons\">"+root.get("imagen_icon").toString()+"</i>")
						.concat("<span>"+root.get("nombreOpcion").toString()+"</span>")
						.concat(" </a>")
						.concat("</li>");
					}else{
						strMenu=strMenu
						.concat("<li class=\"\">")
						.concat(" <a href=\"javascript:void(0);\"   class=\"menu-toggle\" >")
						.concat("<i class=\"material-icons\">"+root.get("imagen_icon").toString()+"</i>")
						.concat("<span>"+root.get("nombreOpcion").toString()+"</span>")
						.concat(" </a>")
						.concat("<ul class=\"ml-menu\">");
						cadena = obtenerChildrens(opcionesPorRol, idPadre);
						strMenu = strMenu.concat(cadena);
						strMenu = strMenu.concat("</ul>")
						.concat("</li>");
					}
					
					
					System.out.println(strMenu);
					
		
			//strMenu = strMenu.concat("</li>");

		}
		
		return strMenu;
	}
	
	
	
   @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	public Map<String, Object> insertOpcionPorRol(Rol rol) throws Exception {
		// TODO Auto-generated method stub
		List<RolOpcion> opcionesPorRol = rol.getOpcionesPorRol(); 
		Integer idRol = rol.getId();

		RolOpcionCriteria rxocri = new RolOpcionCriteria();
		rxocri.createCriteria().andRolIdEqualTo(idRol);
		rolOpcionMapper.deleteByExample(rxocri);

		if (opcionesPorRol != null) {
			for (RolOpcion rolOpcion : opcionesPorRol) {
				rolOpcion.setRolId(idRol);
				rolOpcionMapper.insertSelective(rolOpcion);
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("opcionesPorRol", opcionesPorRol);
		return result;
	}

}
