package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;

public interface SeguridadService {
	
	public Usuario autenticar(String username , String password) throws Exception;
	public Usuario olvideContrasena(String  emailRecuperar) throws Exception;
	/**Usuario**/
	public List<Map<String, Object>> listarUsuarios(Usuario usuario)throws Exception;
	public int countUsuarios(Usuario usuario)throws Exception;
	public int countTotalUsuarios() throws Exception ;
	public Usuario getUsuarioByPk(Integer idUsuario) throws Exception;
	public Usuario saveUsuario(Usuario usuario, Usuario usuarioSession)throws Exception;
	public void deleteUsuario(Integer idUsuario) throws Exception;
	
	/**Rol**/
	public List<Map<String, Object>>  listarRoles(Rol rol,Usuario usuario) throws Exception;
	public Rol getRolByPk(Integer idRol) throws Exception;
	public int countRoles(Rol rol, Usuario usuario) throws Exception;
	public int countTotalRoles() throws Exception ;
	public Rol saveRol(Rol rol, Usuario usuario) throws Exception;
	public void deleteRol(Integer idRol) throws Exception;
	
	/**Opcion**/
	public List<Map<String, Object>>  listarOpciones(Opcion opcion) throws Exception ;
	public int countOpciones(Opcion opcion) throws Exception ;
	public List<Opcion> findAll(Opcion opcion) throws Exception;
	public Opcion saveopcion(Opcion opcion, Usuario usuario)  throws Exception ;
	public Opcion getOpcionByPk(Integer idOpcion) throws Exception;
	public int countTotalOpciones() throws Exception ;
	public void deleteOpcion(Integer idOpcion) throws Exception;
	
	/**Opcion Rol**/
	public String obtenerTreeOpcionesPorRol(Integer idRol) throws Exception;
	public String strTreeRecursivo(List<Map<String, Object>> opcionesPorRol) throws Exception;
	public Map<String, Object> insertOpcionPorRol(Rol rol) throws Exception;
	public String obtenerOpcionesPorRol(Integer idRol) throws Exception;
	
}
