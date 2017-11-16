package pe.com.pdp.controller;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.cliente.Cliente;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AppService;

@Controller
@RequestMapping(value="/oauth2/")
public class AccessTokenController {
	
	@Autowired
	private AppService appService;

	@RequestMapping(value = "/token" , method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> token(String usuario , String password) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", Cliente.getToken(usuario, password));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al obtener el token.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> login(Usuario usuario) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("usuario" , appService.login(usuario));
			data.put("success", Boolean.TRUE);
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al obtener el token.");
			e.printStackTrace();
		}
		return data;
	}
	
	
}
