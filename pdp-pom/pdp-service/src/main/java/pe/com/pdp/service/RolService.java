package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioRol;

public interface RolService {

	public List<Map<String, Object>> findAll(Rol rol, Usuario usuario) throws Exception;
	public Rol findByPk(Integer idRol) throws Exception;
	public int countRole(Rol rol,Usuario usuario) throws Exception ;
	public int countTotalRoles() throws Exception ;
	
	public Rol save(Rol rol, Usuario usuario) throws Exception;
	public void delete(Rol rol) throws Exception;
	public void deleteByPk(Integer idRol) throws Exception;
	public List<UsuarioRol> getRolesByIdUsuario(Integer idUsuario) throws Exception;
}
