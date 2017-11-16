package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.service.UbigeoService;

@Controller
public class UbigeoController {
	
	@Autowired
	private UbigeoService ubigeoService;
	
	@RequestMapping(value = "/ubigeo/listar")
	public @ResponseBody Map<String, ? extends Object> ubigeoListar(Ubigeo ubigeo,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			//Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaUbigeo=ubigeoService.selectByUbigeo(ubigeo);
			data.put("data", listaUbigeo);
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}

}
