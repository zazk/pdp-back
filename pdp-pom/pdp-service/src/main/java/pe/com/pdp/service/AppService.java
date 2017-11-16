package pe.com.pdp.service;

import java.util.List;

import java.util.Map;

import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.domain.postgres.Usuario;

public interface AppService {

	public Usuario registroUsuario(Usuario usuario) throws Exception;
	public Usuario login(Usuario usuario) throws Exception;
	public List<Mascota> listarMascotas(Mascota mascota) throws Exception;
	public Mascota registrarMascota(Mascota mascota) throws Exception;
	public void eliminarMascota(Integer id) throws Exception;
	public Usuario obtenerUsuarioAndPersonaPorID(Integer idUsuario) throws Exception;
	public Anuncio registroAnuncio(Anuncio anuncio) throws Exception;
	public List<Anuncio> listarAnuncios(Anuncio anuncio) throws Exception;
	public List<Map<String, Object>> listarDistritos(Ubigeo ubigeo) throws Exception;
	public List<Elemento> listarCatalogoPorGrupo(Integer idGrupo) throws Exception;
	public Negocio registrarNegocio(Negocio negocio) throws Exception;
	public List<Map<String, Object>> listarNegocios(Negocio negocio) throws Exception;
	public Busqueda registrarBusqueda(Busqueda busqueda) throws Exception;
	public List<Map<String, Object>> listarBusqueda(Busqueda busqueda) throws Exception;
	public Encontrado registrarEncontre(Encontrado encontre) throws Exception;
	public List<Map<String, Object>> listarEncontrado(Encontrado encontre) throws Exception;
	public Notificacion registrarContactenos(Notificacion notificacion) throws Exception;
	
	public Integer nuevasPublicaciones(Busqueda busqueda) throws Exception;
	public Integer nuevosEncontrados(Encontrado encontrado) throws Exception;
	
	public Integer countNotificaciones(Notificacion notificacion ,Usuario usuario) throws Exception;
	public List<Map<String, Object>> bandejaNotificaciones(Notificacion notificacion ,Usuario usuario) throws Exception;
	
	public void checkNotifiaciones(Integer id) throws Exception;
	
	public Usuario obtenerUsuarioFB(String fbUsuarioId) throws Exception ;
	
	public Usuario obtenerUsuarioRS(String idRs , Usuario usuario) throws Exception ;
	
	public Map<String, Object> getVigenciaNotificaction(String idUsuario) throws Exception ;
	
	public void actualizarVigencia(String tipo , Integer id , Integer estado) throws Exception;
	
}
