package pe.com.pdp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.com.pdp.Constante;
import pe.com.pdp.dao.postgres.ElementoMapper;
import pe.com.pdp.dao.postgres.GrupoElementoMapper;
import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.ElementoCriteria;
import pe.com.pdp.domain.postgres.ElementoCriteria.Criteria;
import pe.com.pdp.domain.postgres.GrupoElemento;
import pe.com.pdp.domain.postgres.GrupoElementoCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.CatalogoService;

@Service
public class CatalogoServiceImpl implements CatalogoService {

	@Autowired
	private GrupoElementoMapper grupoElementoMapper;
	
	@Autowired
	private ElementoMapper elementoMapper;
	


	//Elemento
	
	public Elemento findElementoByPk(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return elementoMapper.selectByPrimaryKey(id);
	}

	
	public List<Elemento> findListElementoByPkIdGrupo(Integer idGrupo) throws Exception {
		// TODO Auto-generated method stub
		ElementoCriteria criteriaElemento=new ElementoCriteria();
		criteriaElemento.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO)
		.andGrupoElementoIdEqualTo(idGrupo);
		return elementoMapper.selectByExample(criteriaElemento);
	}

	
	
	
	public List<Elemento> findListElemento(Elemento elemento) throws Exception {
		// TODO Auto-generated method stub
		ElementoCriteria criteriaElemento=new ElementoCriteria();
		
		Criteria criteria=criteriaElemento.createCriteria();
		criteria.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		if(elemento.getDesNombre()!=null && elemento.getDesNombre().trim().length()>0){
			criteria.andDesNombreLikeInsensitive(elemento.getDesNombre());
		}
		
		if(elemento.getGrupoElementoId()!=null ){
			criteria.andGrupoElementoIdEqualTo(elemento.getGrupoElementoId());
		}
		
		criteriaElemento.setOrderByClause(" des_codigo asc ");
		
		return elementoMapper.selectByExample(criteriaElemento);
	}
	
	
	
	
	public int countTotalElemento(Elemento elemento) throws Exception {
		ElementoCriteria criteriaElemento=new ElementoCriteria();
		criteriaElemento.createCriteria().andGrupoElementoIdEqualTo(elemento.getGrupoElementoId())
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		Long cantidad=elementoMapper.countByExample(criteriaElemento);
		return cantidad.intValue();
	}
	
	
	
	public List<Map<String, Object>> findListaElemento(Elemento elemento) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(elemento.getId()!=null ){
			parametros.put("ELEMENTO_ID",  elemento.getId() );
		}
		
		if(elemento.getDesNombre()!=null && elemento.getDesNombre().trim().length()>0){
			parametros.put("NOMBRE", elemento.getDesNombre().toUpperCase());
		}	
		
		if(elemento.getGrupoElementoId()!=null && elemento.getGrupoElementoId()!=0 ){
			parametros.put("TIPO_GRUPO",  elemento.getGrupoElementoId() );
		}
		
		if(elemento.getStart()!=null){
			parametros.put("INICIO_PAG", elemento.getStart().intValue());
		}
		
		return elementoMapper.selectByElemento(parametros);
	}





	
	public int countElementos(Elemento elemento) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(elemento.getId()!=null ){
			parametros.put("ELEMENTO_ID",  elemento.getId() );
		}
		
		if(elemento.getDesNombre()!=null && elemento.getDesNombre().trim().length()>0){
			parametros.put("NOMBRE", elemento.getDesNombre().toUpperCase());
		}	
		
		if(elemento.getGrupoElementoId()!=null && elemento.getGrupoElementoId()!=0 ){
			parametros.put("TIPO_GRUPO",  elemento.getGrupoElementoId() );
		}
		return elementoMapper.countElemento(parametros);
	}





	
	public int countTotalElementos() throws Exception {
		// TODO Auto-generated method stub
		ElementoCriteria criteriaElemento=new ElementoCriteria();
		criteriaElemento.createCriteria()
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		Long cantidad=elementoMapper.countByExample(criteriaElemento);
		return cantidad.intValue();
		
	}
	
	

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Elemento save(Elemento elemento, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		if(elemento.getId()==null){
			
			elemento.setFechaRegistro(new Date());
			elemento.setEstado(Constante.ESTADO_ACTIVO);
			elemento.setUsuarioRegistro(usuario.getUsuario());
			elementoMapper.insertSelective(elemento);
		}else{
					
			elemento.setFechaModifico(new Date());
			elemento.setUsuarioModifico(usuario.getUsuario());
			elementoMapper.updateByPrimaryKeySelective(elemento);
		}
		return elemento;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void delete(Elemento elemento) throws Exception {
		// TODO Auto-generated method stub
		
		elemento.setFechaModifico(new Date());
		elemento.setEstado(Constante.ESTADO_INACTIVO);
		elementoMapper.updateByPrimaryKeySelective(elemento);
		
	}
	
	
	

	//GRUPO
	
	public GrupoElemento findGrupoElementoByPk(Integer id) throws Exception {
		// TODO Auto-generated method stub
		
		return grupoElementoMapper.selectByPrimaryKey(id);
	}
	
	
	public List<Map<String, Object>> findListaGrupoElemento(GrupoElemento grupoElemento) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(grupoElemento.getId()!=null ){
			parametros.put("GRUPO_ID",  grupoElemento.getId() );
		}
		
		if(grupoElemento.getNombre()!=null && grupoElemento.getNombre().trim().length()>0){
			parametros.put("NOMBRE", grupoElemento.getNombre().toUpperCase());
		}
		
		if(grupoElemento.getStart()!=null){
			parametros.put("INICIO_PAG", grupoElemento.getStart().intValue());
		}
		
		return grupoElementoMapper.selectByGrupoElemento(parametros);
	}


	
	public int countGrupoElementos(GrupoElemento grupoElemento) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();

		if(grupoElemento.getId()!=null ){
			parametros.put("GRUPO_ID",  grupoElemento.getId() );
		}
		
		if(grupoElemento.getNombre()!=null && grupoElemento.getNombre().trim().length()>0){
			parametros.put("NOMBRE", grupoElemento.getNombre().toUpperCase());
		}
		return grupoElementoMapper.countGrupoElemento(parametros);
	}

	
	public int countTotalGrupoElementos() throws Exception {
		// TODO Auto-generated method stub
		GrupoElementoCriteria grupoCriteria=new GrupoElementoCriteria();
		grupoCriteria.createCriteria()
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		Long cantidad=grupoElementoMapper.countByExample(grupoCriteria);
		return cantidad.intValue();
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public GrupoElemento save(GrupoElemento grupoElemento, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		if(grupoElemento.getId()==null){
			
			grupoElemento.setFechaRegistro(new Date());

			grupoElemento.setEstado(Constante.ESTADO_ACTIVO);
			grupoElemento.setUsuarioRegistro(usuario.getUsuario());
			grupoElementoMapper.insertSelective(grupoElemento);
		}else{
					
			grupoElemento.setFechaModifico(new Date());
			grupoElemento.setUsuarioModifico(usuario.getUsuario());
			grupoElementoMapper.updateByPrimaryKeySelective(grupoElemento);
		}
		return grupoElemento;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void delete(GrupoElemento grupoElemento) throws Exception {
		// TODO Auto-generated method stub
		grupoElemento.setFechaModifico(new Date());
		grupoElemento.setEstado(Constante.ESTADO_INACTIVO);
		grupoElementoMapper.updateByPrimaryKeySelective(grupoElemento);
		
	}

	@Override
	public void updateMapper(Elemento e) throws Exception {
		elementoMapper.updateByPrimaryKeySelective(e);
	}

}
