package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Usuario;

public interface PersonaService {

	
	public List<Map<String, Object>> findAllPersonas(Persona persona,Usuario usuario) throws Exception;
	public int countPersona(Persona persona, Usuario usuario) throws Exception ;
	public int countTotalPersona() throws Exception ;
	
	public Persona findPersonaByPk(Integer idPersona) throws Exception;
	public Persona save(Persona persona) throws Exception;
	public Persona obtenerPersonaContactosPorId(Integer idPersona);
	public Persona saveAll(Persona persona, Usuario usuario) throws Exception;
	public Persona obtenerPersonaContactosAllPorId(Integer idPersona);
	public void deleteByPk(Integer idPersona) throws Exception;
	
}
