package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Usuario;

public interface AnuncioService {

	public List<Anuncio> listarAnuncios(Anuncio anuncio);
	public List<Map<String, Object>> findListaAnuncion(Anuncio anuncio) throws Exception;
	public int countAnuncios(Anuncio anuncio)throws Exception;
	public int countTotalAnuncios()throws Exception;
	public void disabledAnuncio(Integer idAnuncio,Integer idActivacion)throws Exception;
	public Anuncio findAnuncioByPK(Integer idAnuncio)throws Exception;
	public Anuncio save(Anuncio anuncio, Usuario usuario)throws Exception;

	
	
}
