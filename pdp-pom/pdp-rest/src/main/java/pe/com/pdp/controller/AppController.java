package pe.com.pdp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AppService;
import pe.com.pdp.service.MascotaService;
import pe.com.pdp.service.UsuarioService;

@RestController
@RequestMapping(value = "/api/private/app")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class AppController {

	private static final String CONTEXT_USUARIO = "/usuario";
	
	private static final String CONTEXT_ANUNCIO = "/anuncio";
	
	private static final String CONTEXT_MASCOTA = "/mascota";
	
	private static final String CONTEXT_DIRECCION = "/direccion";
	
	private static final String CONTEXT_CATALOGO = "/catalogo";
	
	private static final String CONTEXT_BUSQUEDA = "/busqueda";
	
	private static final String CONTEXT_ENCONTRE = "/encontre";
	
	private static final String CONTEXT_NEGOCIO = "/negocio";
	
	private static final String CONTEXT_NOTIFICACION = "/notificacion";
	
	@Autowired
	private AppService appService;
	
	@PostMapping(value = CONTEXT_USUARIO)
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
	
	@PostMapping(value = CONTEXT_USUARIO+"/update" )
    public ResponseEntity  usuarioUpdate(Usuario usuario) throws Exception {

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
	
	@GetMapping(value = CONTEXT_USUARIO+"/{id}")
	public ResponseEntity  obtenerUsuarioAndPersonaPorID(@PathVariable(value = "id") Integer id){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("usuario", appService.obtenerUsuarioAndPersonaPorID(id));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@PostMapping(value = CONTEXT_ANUNCIO)
	public ResponseEntity  registrarAnuncioApp(Anuncio anuncio){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			anuncio.setEstaoo(1);
			anuncio.setFechaRegistro(new Date());
			data.put("anuncio", appService.registroAnuncio(anuncio));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_ANUNCIO)
	public ResponseEntity  listarAnunciosApp(Anuncio anuncio){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.listarAnuncios(anuncio));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	@GetMapping(value = CONTEXT_MASCOTA)
	public ResponseEntity  listarMascotas(Mascota mascota){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			data.put("data", appService.listarMascotas(mascota));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@PostMapping(value = CONTEXT_MASCOTA+"/delete/{id}")
	public ResponseEntity  eliminarMascota(@PathVariable(value = "id") Integer id){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			appService.eliminarMascota(id);
			data.put("success", Boolean.TRUE);
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	
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
	
	
	@GetMapping(value = CONTEXT_CATALOGO+"/{idGrupo}/listar")
	public ResponseEntity  listarDistritos(@PathVariable(value = "idGrupo") Integer idGrupo){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			data.put("data", appService.listarCatalogoPorGrupo(idGrupo));
			return new ResponseEntity(data,HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	@GetMapping(value = CONTEXT_BUSQUEDA)
	public ResponseEntity  listarBusqueda(Busqueda busqueda){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.listarBusqueda(busqueda));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_ENCONTRE)
	public ResponseEntity  listarEncontre(Encontrado encontrado){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.listarEncontrado(encontrado));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	@GetMapping(value = CONTEXT_NEGOCIO)
	public ResponseEntity  listarNegocios(Negocio negocio){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.listarNegocios(negocio));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@PostMapping(value = CONTEXT_NOTIFICACION)
	public ResponseEntity  registrarContactenos(Notificacion notificacion){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			appService.registrarContactenos(notificacion);
			data.put("success", Boolean.TRUE);
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	@GetMapping(value = CONTEXT_BUSQUEDA+"/news")
	public ResponseEntity  nuevasPublicaciones(Busqueda busqueda){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("count", appService.nuevasPublicaciones(busqueda));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_ENCONTRE+"/news")
	public ResponseEntity  nuevosencontrados(Encontrado encontrado){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("count", appService.nuevosEncontrados(encontrado));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	
	@GetMapping(value = CONTEXT_NOTIFICACION+"/bandeja")
	public ResponseEntity  bandejaNotificaciones(Notificacion notificacion){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.bandejaNotificaciones(notificacion,notificacion.getUsuario()));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}

	@GetMapping(value = CONTEXT_NOTIFICACION+"/count")
	public ResponseEntity  countNotificaciones(Notificacion notificacion){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
			data.put("data", appService.countNotificaciones(notificacion,notificacion.getUsuario()));
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
	@GetMapping(value = CONTEXT_NOTIFICACION+"/check/{id}")
	public ResponseEntity  checkNotificaciones(@PathVariable(value = "id") Integer id){
		
		Map<String, Object> data = new HashMap<String,Object>();
		try {
			appService.checkNotifiaciones(id);
			data.put("success" , Boolean.TRUE);
			return new ResponseEntity(data,HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("success", Boolean.FALSE);
			return new ResponseEntity(data,HttpStatus.EXPECTATION_FAILED);
		
		}
		
	}
	
}
