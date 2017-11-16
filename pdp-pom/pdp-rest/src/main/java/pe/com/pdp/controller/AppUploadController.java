package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.service.AppService;

@Controller
@RequestMapping(value = "/app/f")
public class AppUploadController {
	
	private static final String CONTEXT_USUARIO = "/usuario";
	
	private static final String CONTEXT_ANUNCIO = "/anuncio";
	
	private static final String CONTEXT_MASCOTA = "/mascota";
	
	private static final String CONTEXT_DIRECCION = "/direccion";
	
	private static final String CONTEXT_CATALOGO = "/catalogo";
	
	private static final String CONTEXT_NEGOCIO = "/negocio";
	
	private static final String CONTEXT_BUSQUEDA = "/busqueda";
	
	private static final String CONTEXT_ENCONTRE = "/encontre";
	
	
	@Autowired
	private  AppService appService;
	
	
	@RequestMapping(value = CONTEXT_MASCOTA  , method = RequestMethod.POST)
    public @ResponseBody Map<String, ? extends Object>  createMascota(Mascota mascota) throws Exception {

		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("mascota", appService.registrarMascota(mascota));
			data.put("success", Boolean.TRUE);
			
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}
		
		return data;
	   
    }
	
	@RequestMapping(value = CONTEXT_NEGOCIO+"/registro"  , method = RequestMethod.POST)
    public @ResponseBody Map<String, ? extends Object>  registrarNegocio(Negocio negocio) throws Exception {

		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("negocio", appService.registrarNegocio(negocio));
			data.put("success", Boolean.TRUE);
			
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}
		
		return data;
	   
    }
	
	@RequestMapping(value = CONTEXT_BUSQUEDA+"/registro"  , method = RequestMethod.POST)
    public @ResponseBody Map<String, ? extends Object>  registrarBusqueda(Busqueda busqueda) throws Exception {

		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("busqueda", appService.registrarBusqueda(busqueda));
			data.put("success", Boolean.TRUE);
			
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}
		
		return data;
	   
    }
	
	@RequestMapping(value = CONTEXT_ENCONTRE+"/registro"  , method = RequestMethod.POST)
    public @ResponseBody Map<String, ? extends Object>  registrarEncontre(Encontrado encontrado) throws Exception {

		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("busqueda", appService.registrarEncontre(encontrado));
			data.put("success", Boolean.TRUE);
			
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			data.put("success", Boolean.FALSE);
		}
		
		return data;
	   
    }

}
