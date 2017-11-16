package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.Usuario;


public interface NegocioService {

	public List<Map<String, Object>> findListaNegocio(Negocio negocio) throws Exception ;
	public int countNegocios(Negocio negocio)throws Exception;
	public int countTotalNegocios()throws Exception;
	
	public void disabledNegocio(Integer idNegocio,Integer idActivacion)throws Exception;
	public Negocio findNegocioByPK(Integer idNegocio)throws Exception;
	public Negocio save(Negocio negocio,Usuario usuario)throws Exception;
	
	
}
