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
import pe.com.pdp.dao.postgres.OpcionMapper;
import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.OpcionCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.OpcionService;

@Service
public class OpcionServiceImpl implements OpcionService{

	
	@Autowired
	private OpcionMapper opcionMapper;

	
	public List<Opcion> findAll(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		
		OpcionCriteria opcionCriteria=new OpcionCriteria();
		
		if(opcion.getIndJerarquia().equals(Constante.IND_PADRE_SUPERIOR)){
			opcionCriteria.createCriteria().andIndPadreEqualTo(Constante.VALOR_PADRE_SUPERIOR)
			.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		}
		
		if(opcion.getIndJerarquia().equals(Constante.IND_PADRE_HIJO)){
			
			opcionCriteria.createCriteria().andIndPadreNotEqualTo(Constante.VALOR_PADRE_SUPERIOR)
			.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		}
		
		
		return opcionMapper.selectByExample(opcionCriteria);
	}

	
	public Opcion findByPk(Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		
		
		Opcion opcion=opcionMapper.selectByPrimaryKey(idOpcion);
		Opcion opcionPadre=new Opcion();
		if(opcion.getIndPadre().equals(Constante.NUMERO_CERO)){
			opcion.setIndJerarquia(Constante.NUMERO_UNO);	
		}
		
		if(opcion.getIndPadre()>0){
			
			opcionPadre=opcionMapper.selectByPrimaryKey(opcion.getIndPadre());
			
			if(opcionPadre.getIndPadre().equals(Constante.NUMERO_CERO)){
				opcion.setIndJerarquia(Constante.NUMERO_DOS);
				opcion.setPadreId(opcionPadre.getId());
			}else{
				opcion.setIndJerarquia(Constante.NUMERO_TRES);
				opcion.setHijoId(opcionPadre.getId());
			}
			
		}
		
		return opcion;
	}

	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Opcion save(Opcion opcion,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub

		
		Map<String, Object> parametros=null;
		if(opcion.getIndJerarquia().equals(Constante.IND_PADRE_SUPERIOR)){
			opcion.setIndPadre(opcion.getPadreId());
			
			parametros=new HashMap<String, Object>();
			parametros.put("OPCION_ID",opcion.getPadreId() );
			opcion.setOrden(opcionMapper.nroMaxOpcion(parametros));
			
			
		}else
		
		if(opcion.getIndJerarquia().equals(Constante.IND_PADRE_HIJO)){
			opcion.setIndPadre(opcion.getHijoId());
			

			parametros=new HashMap<String, Object>();
			parametros.put("OPCION_ID",opcion.getHijoId() );
			opcion.setOrden(opcionMapper.nroMaxOpcion(parametros));
			
		}else{
			opcion.setIndPadre(Constante.VALOR_PADRE_SUPERIOR);
			opcion.setOrden(Constante.NUMERO_UNO);
		}

		
		if(opcion.getId()!=null){
			opcion.setFechaModifico(new Date());
			opcion.setUsuarioModifico(usuario.getUsuario());
			opcionMapper.updateByPrimaryKeySelective(opcion);
		}else{
			opcion.setFechaRegistro(new Date());
			opcion.setIndTipoMenu(Constante.CATALOGO_ID_TIPO_APPWEB);
			opcion.setUsuarioRegistro(usuario.getUsuario());
			opcion.setEstado(Constante.ESTADO_ACTIVO);
			opcionMapper.insertSelective(opcion);
		}
		
		
		
		
		return opcion;
	}

	
	public List<Map<String, Object>> findListaOpcion(Opcion opcion) throws Exception{
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		
		if(opcion.getId()!=null){
			parametros.put("OPCION_ID",  opcion.getId() );
		}
		if(opcion.getNombre()!=null && opcion.getNombre().trim().length()>0){
			parametros.put("OPCION_NOMBRE", opcion.getNombre().toUpperCase());
		}
		
		if(opcion.getStart()!=null){
			parametros.put("INICIO_PAG", opcion.getStart().intValue());
		}else{
			parametros.put("INICIO_PAG", Constante.NUMERO_CERO);
		}
		return opcionMapper.selectByOpcion(parametros);
	}


	public int countTotalOpciones() throws Exception {
		// TODO Auto-generated method stub
		OpcionCriteria opcionCriteria=new OpcionCriteria();
		opcionCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		Long cantidad=opcionMapper.countByExample(opcionCriteria);
		
		return cantidad.intValue();
	}



	public int countOpciones(Opcion opcion) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		
		if(opcion.getId()!=null){
			parametros.put("OPCION_ID",  opcion.getId() );
		}
		if(opcion.getNombre()!=null && opcion.getNombre().trim().length()>0){
			parametros.put("OPCION_NOMBRE", opcion.getNombre().toUpperCase());
		}
		
		if(opcion.getStart()!=null){
			parametros.put("INICIO_PAG", opcion.getStart().intValue());
		}
		return opcionMapper.selectCountByOpcion(parametros);
	}


	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void deleteOpcion(Integer idOpcion) throws Exception {
		// TODO Auto-generated method stub
		
		if(idOpcion!=null){
			
			Opcion opcionBean=opcionMapper.selectByPrimaryKey(idOpcion);
			
			OpcionCriteria opcionCriteria=new OpcionCriteria();
			opcionCriteria.createCriteria().andIndPadreEqualTo(opcionBean.getId())
			.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
			List<Opcion> listOpcionHijas=opcionMapper.selectByExample(opcionCriteria);
			
			if(listOpcionHijas.size()>0){
				throw new Exception("No se puede eliminar por que cuenta con opciones Asociadas a el.");
			}else{
				opcionBean.setEstado(Constante.ESTADO_INACTIVO);
				opcionMapper.updateByPrimaryKey(opcionBean);
			}
					
		}
		
	}
	
	
}
