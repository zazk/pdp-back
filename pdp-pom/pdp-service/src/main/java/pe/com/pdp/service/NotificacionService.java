package pe.com.pdp.service;

import java.util.List;
import java.util.Map;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.Notificacion;



public interface NotificacionService {
	
	public List<Map<String, Object>> findListaNotificacion(Notificacion notificacion, Usuario usuario) throws Exception ;
	public int countNotificaciones(Notificacion notificacion , Usuario usuario)throws Exception;
	public int countTotalNotificaciones(Usuario usuario)throws Exception;
	
	public void disabledNotificacion(Integer idNotificacion,Integer idActivacion)throws Exception;
	public Notificacion findNotificacionByPK(Integer idNotificacion)throws Exception;
	public Notificacion saveAll(Notificacion notificacion,Usuario usuario)throws Exception;
	
	
	/**Notificacion de Publicaciones**/
	public void notficarPublicaBusqueda(int idBusqueda )throws Exception;
	public void notficarPublicaEncontrado(int idEncontrado)throws Exception;
	
	public void checkNotificaciones(Integer idNotificacion) throws Exception;

}
