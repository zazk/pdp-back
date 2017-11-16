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
import pe.com.pdp.UtilFecha;
import pe.com.pdp.dao.postgres.NotificacionMapper;
import pe.com.pdp.dao.postgres.PersonaMapper;
import pe.com.pdp.dao.postgres.UsuarioMapper;
import pe.com.pdp.dao.postgres.UsuarioRolMapper;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.NotificacionCriteria;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.PersonaCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.domain.postgres.UsuarioRol;
import pe.com.pdp.domain.postgres.UsuarioRolCriteria;
import pe.com.pdp.service.BusquedaMascotaService;
import pe.com.pdp.service.EncontradoMascotaService;
import pe.com.pdp.service.NotificacionService;
import pe.com.pdp.service.UsuarioService;

@Service
public class NotificacionServiceImpl  implements NotificacionService{
	
	@Autowired
	private NotificacionMapper notificacionMapper; 
	
	@Autowired
	private UsuarioRolMapper usuarioRolMapper;
	
	@Autowired
	private UsuarioMapper usuarioMapper;
	
	@Autowired
	private BusquedaMascotaService busquedaMascotaService;
	
	@Autowired
	private EncontradoMascotaService encontradoMascotaService;
	
	@Autowired
	private PersonaMapper personaMapper;
	
	@Autowired
	private UsuarioService usuarioService;

	
	public List<Map<String, Object>> findListaNotificacion(Notificacion notificacion,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		
		if(!usuario.getRol().getNombre().equals(Constante.ADMINISTRADOR_MASTER)){
			parametros.put("USUARIO_RECEPTOR",usuario.getId());
		}
		
		if(notificacion != null){
			
			if(notificacion.getId()!=null ){
				parametros.put("NOTIFICACION_ID",  notificacion.getId() );
			}
			
			
			if(notificacion.getTipoMedio()!=null &&  !notificacion.getTipoMedio().equals(Constante.NUMERO_CERO)){
				parametros.put("TIPO_MEDIO",  notificacion.getTipoMedio());
			 }
			
			if(notificacion.getTipoNotificacion()!=null &&  !notificacion.getTipoNotificacion().equals(Constante.NUMERO_CERO)){
				parametros.put("TIPO_NOTIFICACION",  notificacion.getTipoNotificacion());
			 }
			
	
			if(notificacion.getUsuarioEmisorId()!=null ){
				parametros.put("EMISOR_ID",  notificacion.getUsuarioEmisorId() );
			}
			
			if(notificacion.getUsuarioDestinoId()!=null ){
				parametros.put("RECEPTOR_ID",  notificacion.getUsuarioDestinoId() );
			}
	
			
			if(notificacion.getEstado()!=null ){
				parametros.put("ESTADO",  notificacion.getEstado() );
			}
			
			
			if(notificacion.getStart()!=null){
				parametros.put("INICIO_PAG", notificacion.getStart().intValue());
			}
			
			if(notificacion.getIndLeido()!=null){
				parametros.put("IND_LEIDO", notificacion.getIndLeido());
			}
		
		}
		
		return notificacionMapper.selectByNotificacion(parametros);
	}


	public int countNotificaciones(Notificacion notificacion,Usuario usuario) throws Exception {
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(!usuario.getRol().getNombre().equals(Constante.ADMINISTRADOR_MASTER)){
			parametros.put("USUARIO_RECEPTOR",usuario.getId());
		}
		
		if(notificacion != null){
			
			if(notificacion.getId()!=null ){
				parametros.put("NOTIFICACION_ID",  notificacion.getId() );
			}
			
			
			if(notificacion.getTipoMedio()!=null &&  !notificacion.getTipoMedio().equals(Constante.NUMERO_CERO)){
				parametros.put("TIPO_MEDIO",  notificacion.getTipoMedio());
			 }
			
			if(notificacion.getTipoNotificacion()!=null &&  !notificacion.getTipoNotificacion().equals(Constante.NUMERO_CERO)){
				parametros.put("TIPO_NOTIFICACION",  notificacion.getTipoNotificacion());
			 }
			
	
			if(notificacion.getUsuarioEmisorId()!=null ){
				parametros.put("EMISOR_ID",  notificacion.getUsuarioEmisorId() );
			}
			
			if(notificacion.getUsuarioDestinoId()!=null ){
				parametros.put("RECEPTOR_ID",  notificacion.getUsuarioDestinoId() );
			}
	
			
			if(notificacion.getEstado()!=null ){
				parametros.put("ESTADO",  notificacion.getEstado() );
			}
			
			
			if(notificacion.getStart()!=null){
				parametros.put("INICIO_PAG", notificacion.getStart().intValue());
			}
			
			if(notificacion.getIndLeido()!=null){
				parametros.put("IND_LEIDO", notificacion.getIndLeido());
			}
		
		}
		
		return notificacionMapper.countNotificaciones(parametros);
	}

	
	public int countTotalNotificaciones(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		NotificacionCriteria notificacionCriteria=new NotificacionCriteria();
		
		if(!usuario.getRol().getNombre().equals(Constante.ADMINISTRADOR_MASTER)){
			notificacionCriteria.createCriteria().andUsuarioDestinoIdEqualTo(usuario.getId());
		}
		
		Long cantidad=notificacionMapper.countByExample(notificacionCriteria);
		return cantidad.intValue();
	}

	
	

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Notificacion saveAll(Notificacion notificacion, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		
		if(notificacion.getId()!=null){
			notificacion.setFechaModifico(new Date());
			notificacion.setUsuarioModifico(usuario.getUsuario());
			notificacionMapper.updateByPrimaryKeySelective(notificacion);
			
		}else{
			notificacion.setFechaRegistro(new Date());
			if(usuario != null){
				notificacion.setUsuarioRegistro(usuario.getUsuario());
				notificacion.setUsuarioEmisor(usuario.getUsuario());
				notificacion.setUsuarioEmisorId(usuario.getId());
			}
			notificacion.setEstado(Constante.ESTADO_ACTIVO);
			if(notificacion.getRolId()!=null && !notificacion.getRolId().equals(Constante.NUMERO_CERO)){
				
				UsuarioRolCriteria usuRolCriteria=new UsuarioRolCriteria();
				usuRolCriteria.createCriteria().andRolIdEqualTo(notificacion.getRolId());
				List<UsuarioRol> listUusarioRol=usuarioRolMapper.selectByExample(usuRolCriteria);
				
				
				if(listUusarioRol!=null && listUusarioRol.size()>0){
					Usuario usuarioDestino=null;
					for (int i = 0; i < listUusarioRol.size(); i++) {
						notificacion.setId(null);
						usuarioDestino=new Usuario();
						usuarioDestino=usuarioMapper.selectByPrimaryKey(listUusarioRol.get(i).getUsuarioId());
						notificacion.setUsuarioDestino(usuarioDestino.getUsuario());
						notificacion.setUsuarioDestinoId(usuarioDestino.getId());
						
						notificacionMapper.insertSelective(notificacion);
					}
				}
				
			}else{
				notificacionMapper.insertSelective(notificacion);
			}
			
			
		}
		
		return notificacion;
	}

	
	public void disabledNotificacion(Integer idNotificacion, Integer idActivacion) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	public Notificacion findNotificacionByPK(Integer idNotificacion) throws Exception {
		// TODO Auto-generated method stub
		return notificacionMapper.selectByPrimaryKey(idNotificacion);
	}

	
	public void notficarPublicaBusqueda(int idBusqueda) throws Exception {
		// TODO Auto-generated method stub
		
		Busqueda busqueda= busquedaMascotaService.obtenerMascotaBuscada(idBusqueda);
		
		PersonaCriteria personaCriteria=new PersonaCriteria();
		personaCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO)
		.andDistritoEqualTo(busqueda.getDistrito());
		
		List<Persona> listPersona= personaMapper.selectByExample(personaCriteria);
		
		Notificacion notificacion=null;
		Usuario usuario=null;
		for (Persona persona : listPersona) {
			
			usuario=usuarioService.findUsuarioByPersonaId(persona.getId());
			if(usuario!=null && usuario.getUsuario()!=null && usuario.getIndAlerta().equals(Constante.ESTADO_ACTIVO)){
				notificacion=new Notificacion();
				notificacion.setUsuarioEmisor(Constante.USUARIO_ADMIN);
				notificacion.setUsuarioEmisorId(Constante.USUARIO_ADMIN_ID);
				notificacion.setUsuarioDestino(usuario.getUsuario());
				notificacion.setUsuarioDestinoId(usuario.getId());
				notificacion.setTipoMedio(Constante.TIPO_MEDIO_MOBIL);
				notificacion.setTipoNotificacion(Constante.TIPO_NOTIFICACION_BUSQUEDA);
				notificacion.setEstado(Constante.ESTADO_ACTIVO);
				notificacion.setFechaRegistro(new Date());
				notificacion.setUsuarioRegistro(Constante.USUARIO_ADMIN);
				notificacion.setFechaEmision(new Date());
				
				String contenido="Se perdio el perro "+busqueda.getMascota().getNombre().toLowerCase()
						+" de raza  "+ busqueda.getMascota().getDesRaza().toLowerCase()
						+" cerca de ti el "+UtilFecha.getDay(busqueda.getFechaPerdida())+"/"+UtilFecha.getMonth(busqueda.getFechaPerdida())+"/"+UtilFecha.getYear(busqueda.getFechaPerdida())
						+", de color "+busqueda.getMascota().getDesColor().toLowerCase()+", tamaño "
						+busqueda.getMascota().getDesTamanio().toLowerCase();
				
				if(busqueda.getDescripcion()!=null && busqueda.getDescripcion().trim().length()>0){
					contenido+=" y caracteristica "+busqueda.getDescripcion().trim();
				}
						
				
				if(busqueda.getIndRecompensa().equals(Constante.ESTADO_ACTIVO)){
					contenido=contenido+" con la recompesa S/."+busqueda.getMontoRecompensa()+".<br/>";
				}else{
					contenido=contenido+".<br/>";
				}
				if(busqueda.getComentarioAdicional()!=null && busqueda.getComentarioAdicional().trim().length()>1){
					contenido=contenido+"Datos adicionales:"+busqueda.getComentarioAdicional().trim();
				}
				notificacion.setDescripcion(contenido);
				
				notificacionMapper.insertSelective(notificacion);
			}
			
		}
		
	}

	
	public void notficarPublicaEncontrado(int idEncontrado) throws Exception {
		// TODO Auto-generated method stub
		try{
			
		
		Encontrado encontrado=encontradoMascotaService.obtenerMascotaEncontrada(idEncontrado);
		
		PersonaCriteria personaCriteria=new PersonaCriteria();
		personaCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO)
		.andDistritoEqualTo(encontrado.getDistrito());
		
		List<Persona> listPersona= personaMapper.selectByExample(personaCriteria);
		
		Notificacion notificacion=null;
		Usuario usuario=null;
		for (Persona persona : listPersona) {
			
			usuario=usuarioService.findUsuarioByPersonaId(persona.getId());
			if(usuario!=null && usuario.getUsuario()!=null && usuario.getIndAlerta().equals(Constante.ESTADO_ACTIVO)){
				notificacion=new Notificacion();
				notificacion.setUsuarioEmisor(Constante.USUARIO_ADMIN);
				notificacion.setUsuarioEmisorId(Constante.USUARIO_ADMIN_ID);
				notificacion.setUsuarioDestino(usuario.getUsuario());
				notificacion.setUsuarioDestinoId(usuario.getId());
				notificacion.setTipoMedio(Constante.TIPO_MEDIO_MOBIL);
				notificacion.setTipoNotificacion(Constante.TIPO_NOTIFICACION_ENCONTRADO);
				notificacion.setEstado(Constante.ESTADO_ACTIVO);
				notificacion.setFechaRegistro(new Date());
				notificacion.setUsuarioRegistro(Constante.USUARIO_ADMIN);
				notificacion.setFechaEmision(new Date());
				
				String contenido="";
				if(encontrado.getTipoEncuentro().equals(Constante.ESTADO_ACTIVO)){
					contenido=contenido+"Se vio";
				}else{
					contenido=contenido+"Se encontró";
				}
				
				
				contenido=contenido+" al engreído "+encontrado.getMascota().getNombre().toLowerCase()
						+" de raza "+encontrado.getMascota().getDesRaza().toLowerCase()
						+" ceerca de ti el "+UtilFecha.getDay(encontrado.getFechaEncontrado())+"/"+UtilFecha.getMonth(encontrado.getFechaEncontrado()) +"/"+ UtilFecha.getYear(encontrado.getFechaEncontrado())
						+", de color "+encontrado.getMascota().getDesColor().toLowerCase()+", tamaño "
						+encontrado.getMascota().getDesTamanio().toLowerCase();
				
						
				if(encontrado.getDescripcion()!=null && encontrado.getDescripcion().trim().length()>0){
					contenido=contenido+" y caracteristica "+encontrado.getDescripcion().trim()+".<br/>";
				}
				
				if(encontrado.getComentario()!=null && encontrado.getComentario().trim().length()>1){
					contenido=contenido+"Datos adicionales:"+encontrado.getComentario().trim();
				}
				
				notificacion.setDescripcion(contenido);
				notificacionMapper.insertSelective(notificacion);
			}
			
		}
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	
	public void checkNotificaciones(Integer idNotificacion) throws Exception {
		// TODO Auto-generated method stub
		Notificacion n = new Notificacion();
		n.setId(idNotificacion);
		n.setIndLeido(Constante.ESTADO_ACTIVO);
		notificacionMapper.updateByPrimaryKeySelective(n);
	}
  
}
