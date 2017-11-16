package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pe.com.pdp.Constante;
import pe.com.pdp.cliente.Cliente;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AppService;

@RestController
@RequestMapping(value = "/api/public/app")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class PublicRestController {
	
	private static final String CONTEXT_DIRECCION = "/direccion";
	
	private static final String CONTEXT_USUARIO = "/usuario";
	
	private static final String CONTEXT_VIGENCIA = "/vigencia";
	
	@Autowired
	private  AppService appService;
	
	@GetMapping(value = CONTEXT_DIRECCION+"/{pais}/{departamento}/{provincia}/distritos")
	public ResponseEntity  listarDistritos(
											@PathVariable(value = "pais") Integer pais,
											@PathVariable(value = "departamento") String departamento,
											@PathVariable(value = "provincia") String provincia,
											Ubigeo ubigeo){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			ubigeo.setIndPais(pais);
			ubigeo.setIndDepartamento(departamento);
			ubigeo.setIndProvincia(provincia);
			ubigeo.setIndAllDistrito(Constante.ESTADO_ACTIVO);
			data.put("data", appService.listarDistritos(ubigeo));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@PostMapping(value = CONTEXT_USUARIO+"/fb")
	public ResponseEntity  registrarUsuarioApp(Usuario usuario){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			data.put("usuario", appService.registroUsuario(usuario));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_USUARIO+"/{idfb}")
	public ResponseEntity  obtenerUsuarioAndPersonaPorID(@PathVariable(value = "idfb") String idfb){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			Usuario result = appService.obtenerUsuarioFB(idfb);
			try{
				result.setAccessToken(Cliente.getToken("pdp_web_user", "153952ff0ed1fdd851a22c9277af8dd5").getAccessToken());
				}catch (Exception e) {
					e.printStackTrace();
				}
			data.put("usuario", result);
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_USUARIO+"/rs/{idRs}")
	public ResponseEntity  obtenerUsuarioRS(@PathVariable(value = "idRs") String idRs , Usuario usuario){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			Usuario result = appService.obtenerUsuarioRS(idRs, usuario);
			try{
				result.setAccessToken(Cliente.getToken("pdp_web_user", "153952ff0ed1fdd851a22c9277af8dd5").getAccessToken());
				}catch (Exception e) {
					e.printStackTrace();
				}
			data.put("usuario", result);
			return new ResponseEntity(data,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		}
		
	}
	
	@GetMapping(value = CONTEXT_VIGENCIA+"/{usuario}")
	public ResponseEntity  vigenciaNotificaction(@PathVariable(value = "usuario") String usuario){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			data.put("data", appService.getVigenciaNotificaction(usuario));
			return new ResponseEntity(data,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		}
		
	}
	
	@PostMapping(value = CONTEXT_VIGENCIA)
	public ResponseEntity  vigenciaNotificaction(String tipo , Integer id , Integer estado){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			appService.actualizarVigencia(tipo, id, estado);
			data.put("success", true);
			return new ResponseEntity(data,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			data.put("success", false);
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		}
		
	}

}
