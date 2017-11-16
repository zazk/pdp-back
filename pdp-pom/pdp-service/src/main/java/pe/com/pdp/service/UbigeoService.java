package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Ubigeo;

public interface UbigeoService {
	
    List<Map<String, Object>> selectByUbigeo(Ubigeo ubigeo) throws Exception;
    public Ubigeo findByPk(Integer idUbigeo) throws Exception;

}
