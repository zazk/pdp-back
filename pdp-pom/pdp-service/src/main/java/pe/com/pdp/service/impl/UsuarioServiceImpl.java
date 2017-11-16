package pe.com.pdp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.Util;
import pe.com.pdp.UtilMD5;
import pe.com.pdp.dao.postgres.UsuarioMapper;
import pe.com.pdp.dao.postgres.UsuarioRolMapper;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.Rol;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioCriteria;
import pe.com.pdp.domain.postgres.UsuarioRol;
import pe.com.pdp.domain.postgres.UsuarioRolCriteria;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.RolService;
import pe.com.pdp.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioMapper usuarioMapper;
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private UsuarioRolMapper usuarioRolMapper;
	
	@Autowired
	private PersonaService personaService;
	
	
	public Usuario login(String userName, String password)throws Exception{
		// TODO Auto-generated method stub
		Usuario user=this.findUsuarioByUserName(userName);
		return user;
	}

	
	public Usuario findUsuarioByUserName(String userName) throws Exception{
		// TODO Auto-generated method stub
		UsuarioCriteria uc=new UsuarioCriteria();
		uc.createCriteria().andUsuarioEqualTo(userName);
		
		Usuario user=null;
		List<UsuarioRol> listUsuarioRol=null;

		List<Usuario> result=usuarioMapper.selectByExample(uc);
		
		Rol rol = null;
		Persona persona=null;
		
		if(result!=null && result.size()>0){
			user=result.get(0);
			persona=personaService.findPersonaByPk(user.getPersonaId());
			
			UsuarioRolCriteria urc=new UsuarioRolCriteria();
			urc.createCriteria().andUsuarioIdEqualTo(user.getId());
			listUsuarioRol = usuarioRolMapper.selectByExample(urc);
			
			if(listUsuarioRol!=null){
				for (UsuarioRol ur : listUsuarioRol) {
					try {
						rol = rolService.findByPk(ur.getRolId());
						ur.setRol(rol);
						user.setPersona(persona);
						user.setRol(rol);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			

			
		}
		
		return user;
	}


	@Transactional(propagation = Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Usuario save(Usuario usuario,Usuario usuarioSession, Integer indRegistroMobil) throws Exception {
		
		Usuario usuarioFinal=new Usuario();
		Persona persona=new Persona();
		
		
		if(usuario.getId()!=null){
			Usuario usuarioInicial=usuarioMapper.selectByPrimaryKey(usuario.getId());
			System.out.println("Password Inicial "+usuarioInicial.getPass()+" Password Final "+usuario.getPass());
			if(StringUtils.isNotBlank(usuario.getPass()) && !usuario.getPass().equals(usuarioInicial.getPass())){
				System.out.println("Actualiza la clave");
				String newPasswordMD5 = UtilMD5.getMD5Spring(usuario.getPass());
				usuario.setPass(newPasswordMD5);
			}
			
			usuario.setFechaModifico(new Date());
			if(usuarioSession != null){
				usuario.setUsuarioModifico(usuarioSession.getUsuario());
			}
			
			usuarioMapper.updateByPrimaryKeySelective(usuario);
			
			usuarioFinal = usuario;
			
			persona = usuario.getPersona();
			
			if(persona != null){
				persona = personaService.save(persona);
				usuarioFinal.setPersona(persona);
			}
			
			if(indRegistroMobil==null){
				UsuarioRol usuRol=new UsuarioRol();
				usuRol.setUsuarioId(usuario.getId());
				usuRol.setRolId(Integer.parseInt(usuario.getRolid()));
				usuarioRolMapper.updateByPrimaryKeySelective(usuRol);
			}
			
			
			
		}else{
			
			usuarioFinal.setEstado(Constante.ESTADO_ACTIVO);
			
			usuarioFinal=usuario;
			
			UsuarioCriteria uc=new UsuarioCriteria();
			uc.createCriteria().andUsuarioEqualTo(usuarioFinal.getUsuario());
			
			List<Usuario> list = usuarioMapper.selectByExample(uc);
			
			if(indRegistroMobil != null && indRegistroMobil == 1 && list != null && list.size() > 0){
				Usuario uValida = list.get(0); 
				boolean actualizarIdRs = false;
				if(usuarioFinal.getIdUsuarioFb() != null){
					uValida.setIdUsuarioFb(usuarioFinal.getIdUsuarioFb());
					actualizarIdRs = true;
				}
				
				if(usuarioFinal.getIdUsuarioGo() != null){
					uValida.setIdUsuarioGo(usuarioFinal.getIdUsuarioGo());
					actualizarIdRs = true;
				}
				
				if(actualizarIdRs){
					usuarioMapper.updateByPrimaryKeySelective(uValida);
				}
				
				return this.obtenerUsuarioAll(uValida.getId());
			}
			
			
			if(list != null && list.size() > 0){
				throw new GenericExcepcion("El usuario ingresado ya existe.");
			}else{
				
				
				if(usuarioFinal.getPersona() != null){
					persona = personaService.save(usuarioFinal.getPersona());
					usuarioFinal.setPersona(persona);
				}
				
				usuarioFinal.setEstado(Constante.ESTADO_ACTIVO);
				usuarioFinal.setFechaRegistro(new Date());
				usuarioFinal.setPersonaId(persona.getId());
				
				if(usuarioSession != null){
					usuarioFinal.setUsuarioRegistro(usuarioSession.getUsuario());
				}
			
				String newPasswordMD5 = UtilMD5.getMD5Spring(usuarioFinal.getPass());
				usuarioFinal.setPass(newPasswordMD5);
				
				usuarioMapper.insertSelective(usuarioFinal);
				
				if(indRegistroMobil!=null){
					UsuarioRol usuRol=new UsuarioRol();
					usuRol.setUsuarioId(usuarioFinal.getId());
					usuRol.setRolId(Constante.USUARIO_MOBIL);
					
					usuarioRolMapper.insertSelective(usuRol);
				}else{
					
					UsuarioRol usuRol=new UsuarioRol();
					usuRol.setUsuarioId(usuarioFinal.getId());
					usuRol.setRolId(Integer.parseInt(usuarioFinal.getRolid()));
					usuarioRolMapper.insertSelective(usuRol);
				}
				
			}
			 
			
		}
		
		return usuarioFinal;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void deleteByPk(Integer idUsuario) {
		// TODO Auto-generated method stub
		Usuario usuario = new Usuario();
		usuario.setId(idUsuario);
		usuario.setEstado(Constante.ESTADO_INACTIVO);
		usuarioMapper.updateByPrimaryKeySelective(usuario);
		
		
		
		
	}



	
	public Usuario findUsuarioByPk(Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		
		Usuario usuario= usuarioMapper.selectByPrimaryKey(idUsuario);
			
		Persona persona=personaService.findPersonaByPk(usuario.getPersonaId());
		usuario.setPersona(persona);

		UsuarioRolCriteria criteriaUsuarioRol=new UsuarioRolCriteria();
		criteriaUsuarioRol.createCriteria().andUsuarioIdEqualTo(usuario.getId());
		List<UsuarioRol> listusuarioRol=usuarioRolMapper.selectByExample(criteriaUsuarioRol);
		

		if(listusuarioRol!=null ){
			usuario.setRol(rolService.findByPk(listusuarioRol.get(0).getRolId()));
		}
		
		return usuario;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Usuario updateByPk(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		usuarioMapper.updateByPrimaryKeySelective(usuario);
		usuario=this.findUsuarioByPk(usuario.getId());
		return usuario;
	}

	
	public void cambiarClave(Usuario usuario) throws Exception {}

	@Transactional(propagation = Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void cambiarEstadoUsuario(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		this.updateByPk(usuario);
	}
	
	
	
	public List<Map<String, Object>> findListaUsuario(Usuario usuario) throws Exception{
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
	
		if(usuario.getRol()!=null && usuario.getRol().getId()!=null){
			parametros.put("ROL_ID",  usuario.getRol().getId() );
		}
		
		if(usuario.getRolid()!=null && usuario.getRolid().trim().length()>0 && !usuario.getRolid().equals(Constante.NUMERO_CERO.toString()) ){

			parametros.put("ROL_ID",  Integer.parseInt(usuario.getRolid()) );
		 }
			 
		if(usuario.getUsuario()!=null && usuario.getUsuario().trim().length()>0){
			parametros.put("USUARIO_LOGIN", usuario.getUsuario().toUpperCase());
		}
	
		if(usuario.getNombreCompleto()!=null && usuario.getNombreCompleto().trim().length()>0){
			parametros.put("PERSONA_NOMBRE", usuario.getNombreCompleto().toUpperCase());
		}
		
		if(usuario.getStart()!=null){
			parametros.put("INICIO_PAG", usuario.getStart().intValue());
		}
		
		
		return usuarioMapper.selectByUsuario(parametros);
	}


	public Usuario findUsuarioByPersonaId(Integer idPersona) throws Exception {
		// TODO Auto-generated method stub
				
		UsuarioCriteria criterioUsuario=new UsuarioCriteria();
		criterioUsuario.createCriteria().andPersonaIdEqualTo(idPersona)
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		List<Usuario> listUsuario= usuarioMapper.selectByExample(criterioUsuario);
		Usuario usuario=null;
		if(listUsuario!=null && listUsuario.size()==1){
			usuario=listUsuario.get(0);
		}
		else{
			throw new Exception("La persona no cuenta con un Usuario.");
		}
		return usuario;
	}

	public Usuario findUsuarioCompleto(String userName, Integer idUsuario, Integer idPersona ) throws Exception{
		
		return null;
	}

	
	public Usuario generateUpdatePassword(Usuario usuario) throws Exception{
		String nuevaContrasena="";
		String newPasswordMD5="";
		nuevaContrasena=Util.generarPasword(8);
		newPasswordMD5= UtilMD5.getMD5Spring(nuevaContrasena);
		usuario.setPass(newPasswordMD5);
		
		usuarioMapper.updateByPrimaryKeySelective(usuario);
		usuario.setPaswordSinMd5(nuevaContrasena);
		return usuario;
	}


	public int countUsuarios(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		return usuarioMapper.countUsuarios(parametros);
	}
	public int countTotalUsuarios() throws Exception {
		UsuarioCriteria usuCriteria=new UsuarioCriteria();
		usuCriteria.createCriteria()
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		
		int cantidad=usuarioMapper.countByExample(usuCriteria);
		return cantidad;
				
	}


	public Usuario obtenerUsuarioAll(Integer idUsuario) throws Exception {
		// TODO Auto-generated method stub
		Usuario usuario = usuarioMapper.selectByPrimaryKey(idUsuario);
		
		if(usuario == null){
			throw new GenericExcepcion("El usuario no existe.");
		}
		
		Persona persona = personaService.obtenerPersonaContactosPorId(usuario.getPersonaId());
		if(persona != null){
			usuario.setPersona(persona);
		}
		
		return usuario;
	}


	
	public Usuario obtenerUsuarioFB(String fbUsuarioId) throws Exception {
		try {
			UsuarioCriteria uc = new UsuarioCriteria();
			uc.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO).andIdUsuarioFbEqualTo(fbUsuarioId);
			List<Usuario> list = usuarioMapper.selectByExample(uc);
			if(list == null){ return null ;}
			if(list.size() == 0){ return null ;}
			return this.obtenerUsuarioAll(list.get(0).getId());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}


	
	public Usuario obtenerUsuarioRS(String idRs, Usuario usuario) throws Exception {
		String tipoRs = usuario.getTipoRs();
		String emailRS = usuario.getEmailRs();
		Usuario usuarioByEmail = this.findUsuarioByUserName(emailRS);
		Boolean existeEmail = (usuarioByEmail!=null);
		Usuario update = null;
		if(existeEmail){
			if(Constante.TIPO_RS.FACEBOOK.equals(tipoRs)){
				if(usuarioByEmail.getIdUsuarioFb() == null){
					update = new Usuario();
					update.setIdUsuarioFb(idRs);
					update.setId(usuarioByEmail.getId());
					update.setFechaModifico(new Date());
					usuarioMapper.updateByPrimaryKeySelective(update);
					usuarioByEmail.setIdUsuarioFb(idRs);
				}
				return usuarioByEmail;
			}else if(Constante.TIPO_RS.GOOGLE.equals(tipoRs)){
				if(usuarioByEmail.getIdUsuarioGo() == null){
					update = new Usuario();
					update.setIdUsuarioGo(idRs);
					update.setId(usuarioByEmail.getId());
					update.setFechaModifico(new Date());
					usuarioMapper.updateByPrimaryKeySelective(update);
					usuarioByEmail.setIdUsuarioGo(idRs);
				}
				return usuarioByEmail;
			}
		}else{
			UsuarioCriteria uc = new UsuarioCriteria();
			if(Constante.TIPO_RS.FACEBOOK.equals(tipoRs)){
				uc.createCriteria().andIdUsuarioFbEqualTo(idRs).andEstadoEqualTo(Constante.ESTADO_ACTIVO);
				List<Usuario> list = usuarioMapper.selectByExample(uc);
				if(list != null && list.size() > 0){
					usuarioByEmail = this.findUsuarioByUserName(list.get(0).getUsuario());
				}
			}else if(Constante.TIPO_RS.GOOGLE.equals(tipoRs)){
				uc.createCriteria().andIdUsuarioGoEqualTo(idRs).andEstadoEqualTo(Constante.ESTADO_ACTIVO);
				List<Usuario> list = usuarioMapper.selectByExample(uc);
				if(list != null && list.size() > 0){
					usuarioByEmail = this.findUsuarioByUserName(list.get(0).getUsuario());
				}
			}
		}
		return usuarioByEmail;
	}
	
	
}
