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

import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.GrupoElemento;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.CatalogoService;

@Controller
public class CatalogoController {
	@Autowired
	private CatalogoService catalogoService;
	
	
	/**Elemento**/
	
	@RequestMapping(value = "/catalogo/elemento")
	public ModelAndView elemento() {
		ModelAndView modelAndView = new ModelAndView("private/catalogo/elemento/elemento");
		return modelAndView;
	}
	
	@RequestMapping(value = "/catalogo/elemento/elemento_form")
	public ModelAndView elementoForm(Integer idElemento) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/catalogo/elemento/elemento_form");
	     Gson gson = new Gson();
		if(idElemento!=null){
			Elemento elemento=catalogoService.findElementoByPk(idElemento);
			modelAndView.addObject("dataElemento",gson.toJson(elemento));
			modelAndView.addObject("tituloElemento","Actualizar Elemento");
		}else{
			modelAndView.addObject("dataElemento",null);
			modelAndView.addObject("tituloElemento","Nuevo Elemento");
		}
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "/catalogo/elemento/listar")
	public @ResponseBody Map<String, ? extends Object> elmentoListar(Elemento elemento,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
//			HttpSession sesion = request.getSession();
//			Usuario usuarioSession = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");

			//List<Elemento> listElemento=catalogoService.findListElemento(elemento);
			List<Map<String, Object>> listElemento=catalogoService.findListaElemento(elemento);
			data.put("data", listElemento);
			data.put("recordsFiltered",catalogoService.countElementos(elemento));
			data.put("recordsTotal",catalogoService.countTotalElementos());
			data.put("draw",elemento.getDraw());
			data.put("success", Boolean.TRUE);
		}catch (Exception e) { 
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/catalogo/elemento/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarElemento(Elemento elemento,
			HttpServletRequest request,HttpServletResponse response, HttpSession sesion) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", catalogoService.save(elemento, usuario));
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
	
	
	@RequestMapping(value = "/catalogo/elemento/eliminar")
	public @ResponseBody Map<String, ? extends Object> eliminarElemento(Integer id) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			Elemento elemento=new Elemento();
			elemento.setId(id);
			catalogoService.delete(elemento);
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
	
	
	
	
	
	
	/**Grupo Elemento**/
	@RequestMapping(value = "/catalogo/grupo")
	public ModelAndView grupoElemento() {
		ModelAndView modelAndView = new ModelAndView("private/catalogo/grupo/grupo");
		return modelAndView;
	}
	
	@RequestMapping(value = "/catalogo/grupo/grupo_form")
	public ModelAndView grupoElementoForm(Integer idGrupoElemento) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/catalogo/grupo/grupo_form");
	     Gson gson = new Gson();
		if(idGrupoElemento!=null){
			GrupoElemento grupoElemento=catalogoService.findGrupoElementoByPk(idGrupoElemento);
			modelAndView.addObject("dataGrupoElemento",gson.toJson(grupoElemento));
			modelAndView.addObject("tituloGrupoElemento","Actualizar Grupo Elemento");
		}else{
			modelAndView.addObject("dataGrupoElemento",null);
			modelAndView.addObject("tituloGrupoElemento","Nuevo Grupo Elemento");
		}
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "/catalogo/grupo/listar")
	public @ResponseBody Map<String, ? extends Object> grupoListar(GrupoElemento grupoElemento,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			
//			HttpSession sesion = request.getSession();
//			Usuario usuarioSession = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");

			//List<Elemento> listElemento=catalogoService.findListElemento(elemento);
			List<Map<String, Object>> listGrupoElemento=catalogoService.findListaGrupoElemento(grupoElemento);
			data.put("data", listGrupoElemento);
			data.put("recordsFiltered",catalogoService.countGrupoElementos(grupoElemento));
			data.put("recordsTotal",catalogoService.countTotalGrupoElementos());
			data.put("draw",grupoElemento.getDraw());
			data.put("success", Boolean.TRUE);
		}catch (Exception e) { 
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/catalogo/grupo/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarGrupoElemento(GrupoElemento grupoElemento,
			HttpServletRequest request,HttpServletResponse response, HttpSession sesion) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", catalogoService.save(grupoElemento, usuario));
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
	
	
	@RequestMapping(value = "/catalogo/grupo/eliminar")
	public @ResponseBody Map<String, ? extends Object> eliminarGrupoElemento(Integer id) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			GrupoElemento grupoElemento=new GrupoElemento();
			grupoElemento.setId(id);
			catalogoService.delete(grupoElemento);
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
