package pe.com.pdp.service;

import java.util.List;

import java.util.Map;

import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.EncontradoFoto;
import pe.com.pdp.domain.postgres.Usuario;


public interface EncontradoMascotaService {
	
	public List<Map<String, Object>> findListaMascotaEncontrado(Encontrado encontrado) throws Exception ;
	public int countMascotaEncontradas(Encontrado encontrado)throws Exception;
	public int countTotalMascotaEncontradas()throws Exception;

	
	public Encontrado obtenerMascotaEncontrada(Integer idEncontrado)throws Exception;
	public void saveEncontradoMascota(Encontrado busqueda, Usuario usuario) throws Exception;
	public List<EncontradoFoto> listFotoMascotaEncontrado(Encontrado encontrado) throws Exception ;
	public String generarPosterHtml(Encontrado encontrado)throws Exception;
	public Integer countNuevosEncontrados(Encontrado encontrado) throws Exception;
	
	public Map<String, Object> getEncontradoVigencia(String idUsuario);
	
	public void updateEncontreMapper(Encontrado e);
	
}
