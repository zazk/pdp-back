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

import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AnuncioService;

@Controller
public class AnuncioController {
	
	@Autowired
	private AnuncioService anuncioService;
	
	
	@RequestMapping(value = "/anuncio/anuncio")
	public ModelAndView anuncio() {
		ModelAndView modelAndView = new ModelAndView("private/anuncio/anuncio/anuncio");
		return modelAndView;
	}
	
	@RequestMapping(value = "/anuncio/anuncio/anuncio_form")
	public ModelAndView anuncioForm(Integer idAnuncio) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/anuncio/anuncio/anuncio_form");
	     Gson gson = new Gson();
		if(idAnuncio!=null){
			Anuncio anuncio=anuncioService.findAnuncioByPK(idAnuncio);
			modelAndView.addObject("dataAnuncio",gson.toJson(anuncio));
			modelAndView.addObject("tituloAnuncio","Actualizar Anuncio");
		}else{
			modelAndView.addObject("dataAnuncio",null);
			modelAndView.addObject("tituloAnuncio","Nuevo Anuncio");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/anuncio/anuncio/listar")
	public @ResponseBody Map<String, ? extends Object> anunciosListar(Anuncio anuncio,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaAnuncios=anuncioService.findListaAnuncion(anuncio);
			data.put("data", listaAnuncios);
			data.put("recordsFiltered",anuncioService.countAnuncios(anuncio));
			data.put("recordsTotal",anuncioService.countTotalAnuncios());
			data.put("draw",anuncio.getDraw());
			
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}

	@RequestMapping(value = "/anuncio/anuncio/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarAnuncio(Anuncio anuncio,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", anuncioService.save(anuncio,usuario));
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
