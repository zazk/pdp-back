package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.NotificacionService;

@Controller
public class NotificacionController {
	
	@Autowired
	private NotificacionService notificacionService;

	@RequestMapping(value = "/notificacion/notificacion")
	public ModelAndView notificacion() {
		ModelAndView modelAndView = new ModelAndView("private/notificacion/notificacion/notificacion");
		return modelAndView;
	}
	
	@RequestMapping(value = "/notificacion/notificacion/notificacion_form")
	public ModelAndView notificacionForm(Integer idNotificacion) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/notificacion/notificacion/notificacion_form");
	     Gson gson = new Gson();
		if(idNotificacion!=null){
			Notificacion notificacion=notificacionService.findNotificacionByPK(idNotificacion);
			modelAndView.addObject("dataNotificacion",gson.toJson(notificacion));
			modelAndView.addObject("tituloNotificacion","Actualizar Notificaci&oacute;n");
		}else{
			modelAndView.addObject("dataNotificacion",null);
			modelAndView.addObject("tituloNotificacion","Nueva Notificaci&oacute;n");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/notificacion/notificacion/listar")
	public @ResponseBody Map<String, ? extends Object> notificacionesListar(Notificacion notificacion,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaNotificaciones=notificacionService.findListaNotificacion(notificacion,usuario);
			data.put("data", listaNotificaciones);
			data.put("recordsFiltered",notificacionService.countNotificaciones(notificacion,usuario));
			data.put("recordsTotal",notificacionService.countTotalNotificaciones(usuario));
			data.put("draw",notificacion.getDraw());
			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/notificacion/notificacion/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarNotificacion(Notificacion notificacion,
			HttpServletRequest request,HttpServletResponse response, HttpSession sesion) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", notificacionService.saveAll(notificacion, usuario));
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
	
	
}
