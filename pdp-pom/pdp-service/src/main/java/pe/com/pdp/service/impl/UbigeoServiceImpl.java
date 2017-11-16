package pe.com.pdp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.pdp.dao.postgres.UbigeoMapper;
import pe.com.pdp.domain.postgres.Ubigeo;
import pe.com.pdp.service.UbigeoService;

@Service
public class UbigeoServiceImpl implements UbigeoService {

	@Autowired
	private UbigeoMapper ubigeoMapper;
	
	
	public List<Map<String, Object>> selectByUbigeo(Ubigeo ubigeo) throws Exception {
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(ubigeo.getId()!=null){
			parametros.put("UBIGEO_ID",  ubigeo.getId() );
		}
		
		if(ubigeo.getIndPais()!=null){
			parametros.put("PAIS",  ubigeo.getIndPais() );
		}
		
		if(ubigeo.getIndDepartamento()!=null){
			parametros.put("ID_DEPARTAMENTO",  ubigeo.getIndDepartamento() );
		}
		
		if(ubigeo.getIndProvincia()!=null){
			parametros.put("ID_PROVINCIA",  ubigeo.getIndProvincia() );
		}
		
		
		if(ubigeo.getIndAllDepartamento()!=null){
			parametros.put("TODOS_DEPARTAMENTO",  ubigeo.getIndAllDepartamento() );
		}
		
		if(ubigeo.getIndAllProvincia()!=null){
			parametros.put("TODOS_PROVINCIA",  ubigeo.getIndAllProvincia() );
		}
		
		if(ubigeo.getIndAllDistrito()!=null){
			parametros.put("TODOS_DISTRITO",  ubigeo.getIndAllDistrito() );
		}
		
		if(ubigeo.getNombre()!=null && ubigeo.getNombre().trim().length()>0){
			parametros.put("NOMBRE", ubigeo.getNombre().toUpperCase());
		}
		
		return ubigeoMapper.selectByUbigeo(parametros) ;
	}

	
	public Ubigeo findByPk(Integer idUbigeo) throws Exception {
		// TODO Auto-generated method stub
		return ubigeoMapper.selectByPrimaryKey(idUbigeo);
	}

}
