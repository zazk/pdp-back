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

import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.UbigeoService;

@Controller
public class PersonaController {

	@Autowired
	private PersonaService personaService;

	
	
	@RequestMapping(value = "/persona/persona")
	public ModelAndView persona(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("private/persona/persona/persona");
		return modelAndView;
	}
	
	@RequestMapping(value = "/persona/persona/persona_form")
	public ModelAndView personaForm(Integer idPersona, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/persona/persona/persona_form");
	     Gson gson = new Gson();
		if(idPersona!=null){
			Persona persona=personaService.obtenerPersonaContactosAllPorId(idPersona);
			modelAndView.addObject("dataPersona",gson.toJson(persona));
			modelAndView.addObject("tituloPersona","Actualizar Persona");
		}else{
			modelAndView.addObject("dataPersona",null);
			modelAndView.addObject("tituloPersona","Nuevo Persona");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/persona/persona/listar")
	public @ResponseBody Map<String, ? extends Object> personaListar(Persona persona,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaPersonas=personaService.findAllPersonas(persona, usuario);
			data.put("data", listaPersonas);
			data.put("recordsFiltered",personaService.countPersona(persona, usuario));//negocioService.countNegocios(persona)
			data.put("recordsTotal",personaService.countTotalPersona());//negocioService.countTotalNegocios()
			data.put("draw",persona.getDraw());
			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/persona/persona/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarPersona(Persona persona,
			HttpServletRequest request,HttpServletResponse response, HttpSession sesion) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", personaService.saveAll(persona, usuario));
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
	
	
	
	
	@RequestMapping(value = "/persona/persona/obtener", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> ObtenerPersona(Integer idPersona,
			HttpServletRequest request,HttpServletResponse response, HttpSession sesion) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", personaService.obtenerPersonaContactosAllPorId(idPersona));
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
	
	
	@RequestMapping(value = "/persona/persona/eliminar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> eliminarPersona(Integer idPersona) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			personaService.deleteByPk(idPersona);
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
	
}
