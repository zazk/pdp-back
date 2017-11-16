package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.Usuario;

public interface OpcionService {
	
	public List<Opcion> findAll(Opcion opcion) throws Exception;
	public Opcion findByPk(Integer idOpcion) throws Exception;
	public Opcion save(Opcion opcion,Usuario usuario) throws Exception;
	public List<Map<String, Object>> findListaOpcion(Opcion opcion) throws Exception;
	public int countOpciones(Opcion opcion) throws Exception;
	public int countTotalOpciones() throws Exception ;
	public void deleteOpcion(Integer idOpcion) throws Exception;

}
