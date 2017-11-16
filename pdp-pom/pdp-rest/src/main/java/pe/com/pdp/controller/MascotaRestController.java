package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pe.com.pdp.service.MascotaService;

@RestController
@RequestMapping(value = "/api/private/mascota")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class MascotaRestController {

	
	@Autowired
	private MascotaService mascotaService;
	
	@GetMapping(value="/{id}")
	public ResponseEntity  listarFeedReach(@PathVariable(value = "id") Integer id){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("mascota", mascotaService.obtenerPotID(id));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
}
