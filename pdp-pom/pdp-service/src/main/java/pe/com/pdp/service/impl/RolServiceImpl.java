package pe.com.pdp.service.impl;

import java.util.ArrayList;
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
import pe.com.pdp.dao.postgres.RolMapper;
import pe.com.pdp.dao.postgres.UsuarioRolMapper;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.RolCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioRol;
import pe.com.pdp.domain.postgres.UsuarioRolCriteria;
import pe.com.pdp.service.RolService;

@Service
public class RolServiceImpl  implements RolService{
	
	@Autowired
	private RolMapper rolMapper;
	
	@Autowired
	private UsuarioRolMapper usuarioRolMapper;
	
	@Autowired
	private ElementoMapper elementoMapper;
	
	
	public List<Map<String, Object>> findAll(Rol rol,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		

		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(usuario!=null && usuario.getRol().getNombre().equals(Constante.ADMINISTRADOR_MASTER)){
			
			if(rol.getId()!=null){
				parametros.put("OPCION_ID",  rol.getId() );
			}
			
			if(rol.getTipo()!=null && rol.getTipo()!=0){
				parametros.put("ROL_MEDIO",  rol.getTipo() );
			}
			
			if(rol.getNombre()!=null && rol.getNombre().trim().length()>0){
				parametros.put("ROL_NOMBRE", rol.getNombre().toUpperCase());
			}
			
			
			if(rol.getStart()!=null){
				parametros.put("INICIO_PAG", rol.getStart().intValue());
			}else{
				parametros.put("INICIO_PAG", Constante.NUMERO_CERO);
			}
			
			
			
			
		}else{
			
			parametros.put("ROL_ADMIN_NOT",Constante.ADMINISTRADOR_MASTER);
			
			if(rol.getId()!=null){
				parametros.put("OPCION_ID",  rol.getId() );
			}
			
			if(rol.getTipo()!=null && rol.getTipo()!=0){
				parametros.put("ROL_MEDIO",  rol.getTipo() );
			}
			
			if(rol.getNombre()!=null && rol.getNombre().trim().length()>0){
				parametros.put("ROL_NOMBRE", rol.getNombre().toUpperCase());
			}
			
		}
		
		List<Map<String, Object>> list=rolMapper.selectByRol(parametros);
		
		for (int i = 0; i < list.size(); i++) {
			
			list.get(i).put("desTipoRol", elementoMapper.selectByPrimaryKey(Integer.parseInt(list.get(i).get("tipo").toString())).getDesNombre());
			
		}
		
		return list;
	}
	
	public int countRole(Rol rol, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
	Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(usuario!=null && usuario.getRol().getNombre().equals(Constante.ADMINISTRADOR_MASTER)){
			
			if(rol.getId()!=null){
				parametros.put("OPCION_ID",  rol.getId() );
			}
			
			if(rol.getTipo()!=null && rol.getTipo()!=0){
				parametros.put("ROL_MEDIO",  rol.getTipo() );
			}
			
			if(rol.getNombre()!=null && rol.getNombre().trim().length()>0){
				parametros.put("ROL_NOMBRE", rol.getNombre().toUpperCase());
			}
			
			
			
			
		}else{
			parametros.put("ROL_ADMIN_NOT",Constante.ADMINISTRADOR_MASTER);
			
			if(rol.getId()!=null){
				parametros.put("OPCION_ID",  rol.getId() );
			}
			
			if(rol.getTipo()!=null && rol.getTipo()!=0){
				parametros.put("ROL_MEDIO",  rol.getTipo() );
			}
			
			if(rol.getNombre()!=null && rol.getNombre().trim().length()>0){
				parametros.put("ROL_NOMBRE", rol.getNombre().toUpperCase());
			}
			
		}
		
		return rolMapper.selectCountByRol(parametros);
	}

	public Rol findByPk(Integer idRol) throws Exception {
		// TODO Auto-generated method stub
		return rolMapper.selectByPrimaryKey(idRol);
	}

	private void validarRolExistente(Rol rol) throws Exception{
		RolCriteria rc=new RolCriteria();
		rc.createCriteria().andNombreEqualTo(rol.getNombre().toUpperCase().trim())
		.andTipoEqualTo(rol.getTipo())
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		if(rolMapper.countByExample(rc)>0){
			throw new Exception("El nombre del rol ingresado ya existe");
		}
	}
	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Rol save(Rol rol,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		if(rol.getId()==null){
			validarRolExistente(rol);
			rol.setFechaRegistro(new Date());
			rol.setNombre(rol.getNombre().toUpperCase());
			rol.setEstado(Constante.ESTADO_ACTIVO);
			rol.setUsuarioRegistro(usuario.getUsuario());
			rolMapper.insertSelective(rol);
		}else{
			Rol rolActual=rolMapper.selectByPrimaryKey(rol.getId());
			
			if(!rolActual.getNombre().equalsIgnoreCase(rol.getNombre())){
				validarRolExistente(rol);
			}
			rol.setFechaModifico(new Date());
			rol.setUsuarioModifico(usuario.getUsuario());
			rolMapper.updateByPrimaryKeySelective(rol);
		}
		
		return rol;
	}

	public void delete(Rol rol) throws Exception {
		// TODO Auto-generated method stub
		rol.setEstado(Constante.ESTADO_INACTIVO);
		rolMapper.updateByPrimaryKeySelective(rol);
		
	}

	
	public void deleteByPk(Integer idRol) throws Exception {
		
		Rol rol = new Rol();
		rol.setId(idRol);
		rol.setEstado(Constante.ESTADO_INACTIVO);
		rolMapper.updateByPrimaryKeySelective(rol);
		
	}

	
	public List<UsuarioRol> getRolesByIdUsuario(Integer idUsuario)
			throws Exception {
		// TODO Auto-generated method stub

		UsuarioRolCriteria usuarioRolCriteria = new UsuarioRolCriteria();
		usuarioRolCriteria.createCriteria().andUsuarioIdEqualTo(idUsuario);

		List<UsuarioRol> rolesPorUsuario = usuarioRolMapper.selectByExample(usuarioRolCriteria);

		if (rolesPorUsuario == null) {
			rolesPorUsuario = new ArrayList<UsuarioRol>();
		} else {
			if (rolesPorUsuario.size() > 0) {
				for (UsuarioRol usuarioRol : rolesPorUsuario) {
					usuarioRol.setRol(this.findByPk(usuarioRol.getRolId()));
				}
			}
		}
		return rolesPorUsuario;
	}

	

	public int countTotalRoles() throws Exception {
		// TODO Auto-generated method stub
		RolCriteria rolCriteria=new RolCriteria();
		rolCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		Long cantidad=rolMapper.countByExample(rolCriteria);
		return cantidad.intValue();
	}

}
