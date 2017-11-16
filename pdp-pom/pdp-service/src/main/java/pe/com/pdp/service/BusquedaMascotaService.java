package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.BusquedaFoto;
import pe.com.pdp.domain.postgres.Usuario;


public interface BusquedaMascotaService {

	public List<Map<String, Object>> findListaMascotaBusqueda(Busqueda busqueda) throws Exception ;
	public int countMascotaBusquedas(Busqueda busqueda)throws Exception;
	public int countTotalMascotaBusquedas()throws Exception;
	
	public Busqueda obtenerMascotaBuscada(Integer idBusqueda)throws Exception;
	public void saveBusquedaMascota(Busqueda busqueda, Usuario usuario) throws Exception;
	public List<BusquedaFoto> listFotoMascotaBusqueda(Busqueda busqueda) throws Exception;
	public String generarPosterHtml(Busqueda busqueda)throws Exception;
	public Integer countNuevasPublicacion(Busqueda busqueda) throws Exception;
	
	public Map<String, Object> getBusquedaVigencia(String idUsuario);
	
	public void updateBusquedaMapper(Busqueda b);
	
}
