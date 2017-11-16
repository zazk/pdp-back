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

import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.NegocioService;

@Controller
public class NegocioController {
	
	@Autowired
	private NegocioService negocioService;
	
	@RequestMapping(value = "/negocio/negocio")
	public ModelAndView negocio() {
		ModelAndView modelAndView = new ModelAndView("private/negocio/negocio/negocio");
		return modelAndView;
	}
	
	@RequestMapping(value = "/negocio/negocio/negocio_form")
	public ModelAndView negocioForm(Integer idNegocio) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/negocio/negocio/negocio_form");
	     Gson gson = new Gson();
		if(idNegocio!=null){
			Negocio negocio=negocioService.findNegocioByPK(idNegocio);
			modelAndView.addObject("dataNegocio",gson.toJson(negocio));
			modelAndView.addObject("tituloNegocio","Actualizar Negocio");
		}else{
			modelAndView.addObject("dataNegocio",null);
			modelAndView.addObject("tituloNegocio","Nuevo Negocio");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/negocio/negocio/listar")
	public @ResponseBody Map<String, ? extends Object> negociosListar(Negocio negocio,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaNegocios=negocioService.findListaNegocio(negocio);
			data.put("data", listaNegocios);
			data.put("recordsFiltered",negocioService.countNegocios(negocio));
			data.put("recordsTotal",negocioService.countTotalNegocios());
			data.put("draw",negocio.getDraw());
			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/negocio/negocio/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarNegocio(Negocio negocio,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", negocioService.save(negocio,usuario));
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
