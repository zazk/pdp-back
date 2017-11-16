package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.GrupoElemento;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;

public interface CatalogoService {
	
	//Grupo-Elemento
	public GrupoElemento findGrupoElementoByPk(Integer id)throws Exception;
	public List<Map<String, Object>> findListaGrupoElemento(GrupoElemento grupoElemento) throws Exception;
	public int countGrupoElementos(GrupoElemento grupoElemento)throws Exception;
	public int countTotalGrupoElementos()throws Exception;
	public GrupoElemento save(GrupoElemento grupoElemento, Usuario usuario) throws Exception;
	public void delete(GrupoElemento grupoElemento) throws Exception;
	
	
	//Elemento
	public Elemento findElementoByPk(Integer id)throws Exception;
	public List<Elemento> findListElementoByPkIdGrupo(Integer idGrupo )throws Exception;
	public List<Elemento> findListElemento(Elemento elemento )throws Exception;
	
	
	public List<Map<String, Object>> findListaElemento(Elemento elemento) throws Exception;
	public int countElementos(Elemento elemento)throws Exception;
	public int countTotalElementos()throws Exception;
	public Elemento save(Elemento elemento, Usuario usuario) throws Exception;
	public void delete(Elemento elemento) throws Exception;
	
	public void updateMapper(Elemento e) throws Exception;
	
}
