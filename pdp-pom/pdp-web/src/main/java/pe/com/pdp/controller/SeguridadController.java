package pe.com.pdp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.SeguridadService;

@Controller
public class SeguridadController {

	private static final Logger logger = Logger.getLogger(SeguridadController.class);
	
	@Autowired
	private SeguridadService seguridadService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login() {
		logger.info("Ingreso: Login) ");
		ModelAndView modelAndView = new ModelAndView("public/login");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request) {
		logger.info("Ingreso: Principal ");
		ModelAndView modelAndView = new ModelAndView("private/main");
		return modelAndView;
	}
	
	@RequestMapping(value = "/olvide")
	public ModelAndView olvide() {
		logger.info("Ingreso: Olvido Contraseña ");
		ModelAndView modelAndView = new ModelAndView("public/olvidepassword");
		return modelAndView;
	}
	@RequestMapping(value = "/logout")
	public ModelAndView CerrarSesion( HttpServletRequest request) {
		logger.info("Ingreso: Olvido Contraseña ");
		ModelAndView modelAndView = new ModelAndView("public/login");
		HttpSession sesion = request.getSession();
		sesion.invalidate();
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/autenticar" , method = RequestMethod.POST)
	public void autenticar(String username,String password, HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		logger.info("Ingreso: autenticar Usuario ");
		String view = "main";
		
		HttpSession sesion = request.getSession();
		
		Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
		
		if(usuario == null){
			
			if(StringUtils.isBlank(username)){
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.setAttribute("mensajeError", "Debe ingresar el usuario.");
				request.getRequestDispatcher("/login").forward(request, response);
				return;
			}
			
			if(StringUtils.isBlank(password)){
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.setAttribute("mensajeError", "Debe ingresar su contraseña.");
				request.getRequestDispatcher("/login").forward(request, response);
				return;
			}
			
			
			try {
				usuario = seguridadService.autenticar(username, password);
				
				if(usuario == null){
					request.setAttribute("mensajeError", "Los Datos Ingresados son incorrectos.");
					request.setAttribute("username", username);
					request.setAttribute("password", password);
					request.getRequestDispatcher("/login").forward(request, response);
					return;
				}else{
					if(usuario.getEstado().intValue() == Constante.ESTADO_INACTIVO){
						request.setAttribute("mensajeError", "Su cuenta esta pendiente de activación.");
						request.setAttribute("username", username);
						request.setAttribute("password", password);
						request.getRequestDispatcher("/login").forward(request, response);
						return;
					}
					 
					usuario.setStrMenu(seguridadService.obtenerOpcionesPorRol(usuario.getRol().getId()));
					sesion.setAttribute("usuarioLoginAutenticate", usuario);
					response.sendRedirect(view);
				}
				
			}
			catch (GenericExcepcion e) { //
				// TODO Auto-generated catch block
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.setAttribute("mensajeError", e.getMessage());
				request.getRequestDispatcher("/login").forward(request, response);
				return;
			}
			
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.setAttribute("mensajeError", "Ha ocurrido un error al intentar ingresar al sistema.");
				request.getRequestDispatcher("/login").forward(request, response);
				return;
			}
			
		}else{
			request.getRequestDispatcher(view).forward(request, response);
			return;
		}
		
	}
	
	
	@RequestMapping(value = "/olvidecontrasena", method = RequestMethod.POST)
	public void recuperarContrasena(String emailTo,
			HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException  {
		
		Map<String, Object> data = new HashMap<String, Object>();
		
        try{
        	  Usuario usuario=seguridadService.olvideContrasena(emailTo);
        	  
        	  if(usuario!=null){
        		  data.put("data",usuario);
        		  data.put("success", Boolean.TRUE);
	        	  
				request.setAttribute("mensajeSuccess", "Se envio la contraseña a su correo Respectivo.");
				request.getRequestDispatcher("/olvide").forward(request, response);
	        	  
        	  }else{
        		  data.put("data",null);
        		  data.put("success", Boolean.FALSE);
	        	  //data.put("message","No se pudo recuperar la contaseña, comunicarse con nuestras oficinas.");
	        	  request.setAttribute("mensajeError", "Ha ocurrido un error al intentar recuperar la contraseña del sistema.");
				request.getRequestDispatcher("/olvide").forward(request, response);
        	  }
        	 
        }
        catch(GenericExcepcion ge){
            data.put("data", null);
            data.put("message", ge.getMessage());
            logger.error(ge.getMessage());
          
            request.setAttribute("mensajeError", "Ha ocurrido un error al intentar recuperar la contraseña del sistema.");
			request.getRequestDispatcher("/olvide").forward(request, response);
			return;
        }
        catch (Exception e) {
            // TODO: handle exception
            data.put("data", null);
            logger.error(e.getMessage());
            e.printStackTrace();
           
			request.setAttribute("mensajeError", "Ha ocurrido un error al intentar recuperar la contraseña del sistema.");
			request.getRequestDispatcher("/olvide").forward(request, response);
			return;
        }
        return ;
		
	}
	
	/**MODULO SEGURIDAD**/
	/**USUARIO**/
	@RequestMapping(value = "/seguridad/usuario")
	public ModelAndView usuarios() {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/usuario/usuario");
		return modelAndView;
	}
	
	@RequestMapping(value = "/seguridad/usuario/usuario_form")
	public ModelAndView ususarioForm(Integer idUsuario) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/usuario/usuario_form");
	     Gson gson = new Gson();
		if(idUsuario!=null){
			Usuario usuario=seguridadService.getUsuarioByPk(idUsuario);
			modelAndView.addObject("dataUsuario",gson.toJson(usuario));
			modelAndView.addObject("tituloUsuario","Actualizar Usuario");
		}else{
			modelAndView.addObject("dataUsuario",null);
			modelAndView.addObject("tituloUsuario","Nuevo Usuario");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/seguridad/usuario/listar")
	public @ResponseBody Map<String, ? extends Object> usuariosListar(Usuario usuario,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
//			HttpSession sesion = request.getSession();
//			Usuario usuarioSession = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", seguridadService.listarUsuarios(usuario));
			data.put("recordsFiltered",seguridadService.countUsuarios(usuario));
			data.put("recordsTotal",seguridadService.countTotalUsuarios());
			data.put("draw",usuario.getDraw());
			data.put("success", Boolean.TRUE);
		}catch (Exception e) { 
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/usuario/obtener")
	public @ResponseBody Map<String, ? extends Object> obtenerUsuario(Integer idUsuario) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", seguridadService.getUsuarioByPk(idUsuario));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/seguridad/usuario/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarUsuario(Usuario usuario,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuarioSession = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", seguridadService.saveUsuario(usuario,usuarioSession));
			data.put("message", "Se registro Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/usuario/eliminar")
	public @ResponseBody Map<String, ? extends Object> eliminarUsuario(Integer idUsuario) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			seguridadService.deleteUsuario(idUsuario);
			data.put("message", "Se Elimino Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	/**ROL**/
	@RequestMapping(value = "/seguridad/rol")
	public ModelAndView rol() {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/rol/rol");
		return modelAndView;
	}
	
	@RequestMapping(value = "/seguridad/rol/rol_form")
	public ModelAndView RolForm(Integer idRol) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/rol/rol_form");
	     Gson gson = new Gson();
		if(idRol!=null){
			Rol rol=seguridadService.getRolByPk(idRol);
			modelAndView.addObject("dataRol",gson.toJson(rol));
			modelAndView.addObject("tituloRol","Actualizar Rol");
		}else{
			modelAndView.addObject("dataRol",null);
			modelAndView.addObject("tituloRol","Nuevo Rol");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/seguridad/rol/listar")
	public @ResponseBody Map<String, ? extends Object> rolesListar(Rol rol,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaRoles=seguridadService.listarRoles(rol,usuario);
			data.put("data", listaRoles);
			data.put("recordsFiltered",seguridadService.countRoles(rol, usuario));
			data.put("recordsTotal",seguridadService.countTotalRoles());
			data.put("draw",rol.getDraw());
			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/rol/obtener")
	public @ResponseBody Map<String, ? extends Object> obtenerRol(Integer idRol) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", seguridadService.getRolByPk(idRol));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/seguridad/rol/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarRol(Rol rol,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", seguridadService.saveRol(rol,usuario));
			data.put("message", "Se registro Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/rol/eliminar")
	public @ResponseBody Map<String, ? extends Object> eliminarRol(Integer idRol) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			seguridadService.deleteRol(idRol);
			data.put("message", "Se Elimino Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	
	
	
	/**OPCION ROL**/
	@RequestMapping(value = "/seguridad/opcion_rol")
	public ModelAndView OpcionRol() {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/opcionrol/opcionrol");
		return modelAndView;
	}
	
	@RequestMapping(value = "/seguridad/opcionrol/rolopciontree")
	public void testTreeMenu(HttpServletResponse response,HttpSession sesion,Integer idRol) throws Exception {
		Usuario usuario=(Usuario)sesion.getAttribute("usuarioLoginAutenticate");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(usuario!=null){
			if (idRol == null) {
				out.write("[]");
			} else {
				out.write(seguridadService.obtenerTreeOpcionesPorRol(idRol));
			}
			
		}else{
			out.write("[]");
		}
	}
	
	
	@RequestMapping(value = "/seguridad/opcionrol/insert-opcion-rol")
	public @ResponseBody Map<String, ? extends Object>  insertOpcionRol(Rol rol,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		try{
			data.put("data", seguridadService.insertOpcionPorRol(rol));
			data.put("message", "Opciones asignadas de forma correcta.");
			data.put("success", Boolean.TRUE);
		}catch(GenericExcepcion e){
			data.put("data", null);
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("data", null);
			data.put("message", "Error Inesperado");
			data.put("success", Boolean.FALSE);
			e.printStackTrace();
		}
		
		return data;

	}
	
	
	/**OPCION**/
	@RequestMapping(value = "/seguridad/opcion")
	public ModelAndView Opcion() {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/opcion/opcion");
		modelAndView.addObject("dataOpcion",null);
		return modelAndView;
	}
	@RequestMapping(value = "/seguridad/opcion/opcion_form")
	public ModelAndView OpcionForm(Integer idOpcion) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/seguridad/opcion/opcion_form");
	     Gson gson = new Gson();
		if(idOpcion!=null){
			Opcion opcion=seguridadService.getOpcionByPk(idOpcion);
			modelAndView.addObject("dataOpcion",gson.toJson(opcion));
		
			modelAndView.addObject("tituloOpcion","Actualizar Opción");
		}else{
			modelAndView.addObject("dataOpcion",null);
			modelAndView.addObject("tituloOpcion","Nueva Opción");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/seguridad/opcion/listar")
	public @ResponseBody Map<String, ? extends Object> opcionesListar(Opcion opcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<Map<String, Object> > lista=seguridadService.listarOpciones(opcion);
			data.put("data", lista);
			data.put("recordsFiltered",seguridadService.countOpciones(opcion));
			data.put("recordsTotal",seguridadService.countTotalOpciones());
			data.put("draw",opcion.getDraw());
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/opcion/listadobyjerarquia")
	public @ResponseBody Map<String, ? extends Object> listadobyjerarquia(Opcion opcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", seguridadService.findAll(opcion));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/seguridad/opcion/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarOpcion(
			Opcion opcion,HttpServletRequest request,HttpServletResponse response ) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			
			data.put("data",seguridadService.saveopcion(opcion,usuario));
			data.put("success", Boolean.TRUE);
			data.put("message", "Se registro Satisfactoriamente.");

		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",  e.getMessage());
			e.printStackTrace();
		}
		return data;
		
	}
	
	
	
	@RequestMapping(value = "/seguridad/opcion/obtener")
	public @ResponseBody Map<String, ? extends Object> opcionesListar(Integer idOpcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", seguridadService.getOpcionByPk(idOpcion));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/seguridad/opcion/eliminar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> opcionesDelete(Integer idOpcion) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			seguridadService.deleteOpcion(idOpcion);
			data.put("message","Se elemino satisfactoriamente");
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
}
