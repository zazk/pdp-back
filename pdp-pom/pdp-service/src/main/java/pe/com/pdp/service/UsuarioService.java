package pe.com.pdp.service;

import java.util.List;
import java.util.Map;

import pe.com.pdp.domain.postgres.Usuario;

public interface UsuarioService {

	public Usuario login(String userName,String password)throws Exception;
	public Usuario findUsuarioByUserName(String userName)throws Exception;
	public Usuario findUsuarioByPk(Integer idUsuario) throws Exception;
	public Usuario save(Usuario usuario, Usuario usuarioSession, Integer indRegistroMobil ) throws Exception;
	public void deleteByPk(Integer idUsuario);
	public Usuario updateByPk(Usuario usuario) throws Exception;
	public List<Map<String, Object>> findListaUsuario(Usuario usuario) throws Exception ;
	public int countUsuarios(Usuario usuario) throws Exception ;
	public int countTotalUsuarios() throws Exception ;
	
	public Usuario findUsuarioByPersonaId(Integer idPersona) throws Exception;
	public Usuario findUsuarioCompleto(String userName, Integer idUsuario, Integer idPersona ) throws Exception;
	public void cambiarClave(Usuario usuario) throws Exception;
	public void cambiarEstadoUsuario(Usuario usuario) throws Exception;
	public Usuario generateUpdatePassword(Usuario usuario) throws Exception;
	public Usuario obtenerUsuarioAll(Integer idUsuario) throws Exception ;
	
	public Usuario obtenerUsuarioFB(String fbUsuarioId) throws Exception ;
	
	public Usuario obtenerUsuarioRS(String idRs , Usuario usuario) throws Exception ;
	
}
