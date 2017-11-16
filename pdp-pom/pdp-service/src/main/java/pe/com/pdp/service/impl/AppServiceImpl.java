package pe.com.pdp.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.UtilMD5;
import pe.com.pdp.cliente.Cliente;
import pe.com.pdp.cliente.Cliente.AccessToken;
import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AnuncioService;
import pe.com.pdp.service.AppService;
import pe.com.pdp.service.BusquedaMascotaService;
import pe.com.pdp.service.CatalogoService;
import pe.com.pdp.service.EncontradoMascotaService;
import pe.com.pdp.service.MascotaService;
import pe.com.pdp.service.NegocioService;
import pe.com.pdp.service.NotificacionService;
import pe.com.pdp.service.UbigeoService;
import pe.com.pdp.service.UsuarioService;

@Service
public class AppServiceImpl implements AppService {
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private AnuncioService anuncioService;
	
	@Autowired 
	private MascotaService mascotaService;
	
	@Autowired
	private UbigeoService ubigeoService;
	
	@Autowired
	private CatalogoService catalogoService;
	
	@Autowired
	private NegocioService negocioService;
	
	@Autowired
	private BusquedaMascotaService busquedaMascotaService;
	
	@Autowired
	private EncontradoMascotaService encontradoMascotaService;
	
	@Autowired
	private NotificacionService notificacionService; 
	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Usuario registroUsuario(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		Usuario result = usuarioService.save(usuario, null, Constante.IND_REGISTRO_MOBIL);
		try{
		result.setAccessToken(Cliente.getToken("pdp_web_user", "153952ff0ed1fdd851a22c9277af8dd5").getAccessToken());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Usuario login(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		String passwordMD5 = UtilMD5.getMD5Spring(usuario.getPass());
		
		Usuario usuarioLogin = usuarioService.findUsuarioByUserName(usuario.getUsuario());
		
		if(usuarioLogin == null){
			throw new GenericExcepcion("El usuario no existe.");
		}
				
		if(!usuarioLogin.getPass().equals(passwordMD5)){
			throw new GenericExcepcion("Usuario o clave incorrectas.");
		}
		
		try {
			
			AccessToken accessToken = Cliente.getToken(Constante.OAUTH_USER_WEB, Constante.OAUTH_USER_WEB_PASS);
			
			usuarioLogin = this.obtenerUsuarioAndPersonaPorID(usuarioLogin.getId());
			if(accessToken!=null && accessToken.getAccessToken() != null){
				usuarioLogin.setAccessToken(accessToken.getAccessToken()+"");
			}
		 	
			return usuarioLogin;
			
		}catch (Exception e) {
			throw new GenericExcepcion("Error de autenticacion");
		}
	
	}

	public List<Mascota> listarMascotas(Mascota mascota) throws Exception {
		// TODO Auto-generated method stub
		return mascotaService.listarMascota(mascota);
	}
	
	
	public Mascota registrarMascota(Mascota mascota) throws Exception {
		// TODO Auto-generated method stub
		return mascotaService.save(mascota);
	}

	public Usuario obtenerUsuarioAndPersonaPorID(Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		return usuarioService.obtenerUsuarioAll(idUsuario);
	}

	
	public Anuncio registroAnuncio(Anuncio anuncio) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<Anuncio> listarAnuncios(Anuncio anuncio) throws Exception {
		// TODO Auto-generated method stub
		return anuncioService.listarAnuncios(anuncio);
	}

	
	public List<Map<String, Object>>  listarDistritos(Ubigeo ubigeo) throws Exception {
		// TODO Auto-generated method stub
		return ubigeoService.selectByUbigeo(ubigeo);
	}

	
	public List<Elemento> listarCatalogoPorGrupo(Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		Elemento e = new Elemento();
		e.setGrupoElementoId(idGrupo);
		return catalogoService.findListElemento(e);
	}

	
	public void eliminarMascota(Integer id) throws Exception {
		// TODO Auto-generated method stub
		mascotaService.delete(id);
	}

	
	public Negocio registrarNegocio(Negocio negocio) throws Exception {
		// TODO Auto-generated method stub
		negocio.setEstado(Constante.ESTADO_INACTIVO);
		return negocioService.save(negocio, null);
	}

	
	public Busqueda registrarBusqueda(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		busquedaMascotaService.saveBusquedaMascota(busqueda, null);
		return busqueda;
	}

	
	public List<Map<String, Object>> listarBusqueda(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		return busquedaMascotaService.findListaMascotaBusqueda(busqueda);
	}

	
	public Encontrado registrarEncontre(Encontrado encontre) throws Exception {
		// TODO Auto-generated method stub
		encontradoMascotaService.saveEncontradoMascota(encontre, null);
		return encontre;
	}

	
	public List<Map<String, Object>> listarEncontrado(Encontrado encontre) throws Exception {
		// TODO Auto-generated method stub
		return encontradoMascotaService.findListaMascotaEncontrado(encontre);
	}

	
	public List<Map<String, Object>> listarNegocios(Negocio negocio) throws Exception {
		// TODO Auto-generated method stub
		negocio.setEstado(Constante.ESTADO_ACTIVO);
		return negocioService.findListaNegocio(negocio);
	}

	
	public Notificacion registrarContactenos(Notificacion notificacion) throws Exception {
		// TODO Auto-generated method stub
		notificacionService.saveAll(notificacion, null);
		return notificacion;
	}

	
	public Integer nuevasPublicaciones(Busqueda busqueda) throws Exception {
		// TODO Auto-generated method stub
		return busquedaMascotaService.countNuevasPublicacion(busqueda);
	}

	
	public Integer nuevosEncontrados(Encontrado encontrado) throws Exception {
		// TODO Auto-generated method stub
		return encontradoMascotaService.countNuevosEncontrados(encontrado);
	}

	
	public Integer countNotificaciones(Notificacion notificacion , Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return notificacionService.countNotificaciones(notificacion, usuario);
	}

	
	public List<Map<String, Object>> bandejaNotificaciones(Notificacion notificacion , Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return notificacionService.findListaNotificacion(notificacion, usuario);
	}

	
	public void checkNotifiaciones(Integer id) throws Exception {
		// TODO Auto-generated method stub
		notificacionService.checkNotificaciones(id);
		
	}

	
	public Usuario obtenerUsuarioFB(String fbUsuarioId) throws Exception {
		// TODO Auto-generated method stub
		return usuarioService.obtenerUsuarioFB(fbUsuarioId);
	}

	
	public Usuario obtenerUsuarioRS(String idRs, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		return usuarioService.obtenerUsuarioRS(idRs, usuario);
	}

	@Override
	public Map<String, Object> getVigenciaNotificaction(String idUsuario) throws Exception {
		
		Map<String, Object> mapVigencia = null;
		
		String tipoVigencia = catalogoService.findElementoByPk(Constante.ID_PARAMETRO_NOTI_VIGENCIA).getDesNombre().trim();
		
		boolean isBusqueda = false;
		
		if(Constante.TIPO_NOTI_VIGENCIA_BUSQUEDA.equals(tipoVigencia)){
			mapVigencia = busquedaMascotaService.getBusquedaVigencia(idUsuario);
			isBusqueda = true;
		}else{
			mapVigencia = encontradoMascotaService.getEncontradoVigencia(idUsuario);
			isBusqueda = false;
		}
		
		if(mapVigencia != null && !mapVigencia.isEmpty()){
			Integer id = Integer.parseInt(mapVigencia.get("id").toString());
			
			if(isBusqueda){
				Busqueda b = new Busqueda();
				b.setId(id);
				mapVigencia.put("item", this.listarBusqueda(b).get(0));
			}else{
				Encontrado e = new Encontrado();
				e.setId(id);
				mapVigencia.put("item", this.listarEncontrado(e).get(0));
			}
			
			mapVigencia.put("tipo", tipoVigencia);
			
		}
		
		return mapVigencia;
	}

	@Override
	public void actualizarVigencia(String tipo, Integer id, Integer estado) throws Exception{
		Elemento ele = new Elemento();
		ele.setId(Constante.ID_PARAMETRO_NOTI_VIGENCIA);
		if(Constante.TIPO_NOTI_VIGENCIA_BUSQUEDA.equals(tipo)){
			Busqueda b = new Busqueda();
			b.setId(id);
			b.setIndvigencia(estado);
			if(estado == Constante.ESTADO_ACTIVO){
				b.setVigencia(new Date());
			}
			ele.setDesNombre(Constante.TIPO_NOTI_VIGENCIA_ENCONTRADO);
			busquedaMascotaService.updateBusquedaMapper(b);
		}else{
			Encontrado e = new Encontrado();
			e.setId(id);
			e.setIndvigencia(estado);
			if(estado == Constante.ESTADO_ACTIVO){
				e.setVigencia(new Date());
			}
			ele.setDesNombre(Constante.TIPO_NOTI_VIGENCIA_BUSQUEDA);
			encontradoMascotaService.updateEncontreMapper(e);
		}
		catalogoService.updateMapper(ele);
	}

}
