package pe.com.pdp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.com.pdp.Constante;
import pe.com.pdp.dao.postgres.ContactoMapper;
import pe.com.pdp.dao.postgres.EmailMapper;
import pe.com.pdp.dao.postgres.PersonaMapper;
import pe.com.pdp.dao.postgres.UbigeoMapper;
import pe.com.pdp.domain.postgres.Contacto;
import pe.com.pdp.domain.postgres.ContactoCriteria;
import pe.com.pdp.domain.postgres.Email;
import pe.com.pdp.domain.postgres.EmailCriteria;
import pe.com.pdp.domain.postgres.Persona;
import pe.com.pdp.domain.postgres.PersonaCriteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.PersonaService;
import pe.com.pdp.service.UbigeoService;

@Service
public class PersonaServiceImpl implements PersonaService {
	
	private static Logger logger = Logger.getLogger(PersonaServiceImpl.class);
	
	@Autowired
	private PersonaMapper personaMapper;
	
	@Autowired
	private ContactoMapper contactoMapper;
	
	@Autowired
	private EmailMapper emailMapper;
	
	@Autowired
	private UbigeoMapper UbigeoMapper;

	
	
	public List<Map<String, Object>> findAllPersonas(Persona persona,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		

		Map<String, Object>parametros=new HashMap<String, Object>();
		
	
			if(persona.getId()!=null){
				parametros.put("PERSONA_ID",  persona.getId() );
			}
			
			if(persona.getTipoDocumento()!=null && persona.getTipoDocumento()!=0){
				parametros.put("TIPO_DOCUMENTO",  persona.getTipoDocumento() );
			}
			
			if(persona.getNroDocumento()!=null && persona.getNroDocumento().trim().length()>0){
				parametros.put("NRO_DOCUMENTO",  persona.getNroDocumento() );
			}
		
			
			if(persona.getTipoPersona()!=null && persona.getTipoPersona()!=0){
				parametros.put("TIPO_PERSONA",  persona.getTipoPersona() );
			}
			
			if(persona.getNombreCompleto()!=null && persona.getNombreCompleto().trim().length()>0){
				parametros.put("NOMBRE_COMPLETO", persona.getNombreCompleto().toUpperCase());
			}
			
			
			if(persona.getStart()!=null){
				parametros.put("INICIO_PAG", persona.getStart().intValue());
			}else{
				parametros.put("INICIO_PAG", Constante.NUMERO_CERO);
			}
			
		
		List<Map<String, Object>> list=personaMapper.selectByPersona(parametros);
		
		return list;
	}
	
	public int countPersona(Persona persona, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
	Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(persona.getId()!=null){
			parametros.put("PERSONA_ID",  persona.getId() );
		}
		
		if(persona.getTipoDocumento()!=null && persona.getTipoDocumento()!=0){
			parametros.put("TIPO_DOCUMENTO",  persona.getTipoDocumento() );
		}
		
		if(persona.getTipoPersona()!=null && persona.getTipoPersona()!=0){
			parametros.put("TIPO_PERSONA",  persona.getTipoPersona() );
		}
		
		if(persona.getNroDocumento()!=null && persona.getNroDocumento().trim().length()>0){
			parametros.put("NRO_DOCUMENTO",  persona.getNroDocumento() );
		}
		
		if(persona.getNombreCompleto()!=null && persona.getNombreCompleto().trim().length()>0){
			parametros.put("NOMBRE_COMPLETO", persona.getNombreCompleto().toUpperCase());
		}
		
		return personaMapper.selectCountByPersona(parametros);
	}
	
	public int countTotalPersona() throws Exception {
		// TODO Auto-generated method stub
		PersonaCriteria personaCriteria=new PersonaCriteria();
		personaCriteria.createCriteria().andEstadoEqualTo(Constante.ESTADO_ACTIVO);
		Long cantidad=personaMapper.countByExample(personaCriteria);
		return cantidad.intValue();
	}
	

	public Persona findPersonaByPk(Integer idPersona) throws Exception {
		// TODO Auto-generated method stub
		logger.info("Ingreso PersonaSevice : findPersonaByPk()  ");
		return personaMapper.selectByPrimaryKey(idPersona);
	}
	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Persona save(Persona persona) throws Exception {
		// TODO Auto-generated method stub
		logger.info("PersonaSevice : save() ");
		Integer personaId = null;
		if(persona.getId() == null){
			
			personaMapper.insertSelective(persona);
			personaId = persona.getId();
			
			if(persona.getContactoPrincipal() != null){
				persona.getContactoPrincipal().setPersonaId(personaId);
				contactoMapper.insertSelective(persona.getContactoPrincipal());
			}

			if(persona.getEmailPrincipal() != null){
				persona.getEmailPrincipal().setPersonaId(personaId);
				emailMapper.insertSelective(persona.getEmailPrincipal());
			}
			
		}else{
			personaMapper.updateByPrimaryKeySelective(persona);
			
			Persona temp = null; 
			
			if(persona.getContactoPrincipal() != null){
				
				temp = this.obtenerPersonaContactosPorId(persona.getId());
				
				if(temp.getContactoPrincipal() != null &&temp.getContactoPrincipal().getId()!= null){
					persona.getContactoPrincipal().setId(temp.getContactoPrincipal().getId());
					contactoMapper.updateByPrimaryKeySelective(persona.getContactoPrincipal());
				}
			}
			
			if(persona.getEmailPrincipal() != null){
				if(temp == null){
					temp = this.obtenerPersonaContactosPorId(persona.getId());
				}
				
				if(temp.getEmailPrincipal() != null && temp.getEmailPrincipal().getId()!= null){
					persona.getEmailPrincipal().setId(temp.getEmailPrincipal().getId());
					emailMapper.updateByPrimaryKeySelective(persona.getEmailPrincipal());
				}
			}
			
		}
		
		return persona;
	}

	public Persona obtenerPersonaContactosPorId(Integer idPersona) {
		// TODO Auto-generated method stub
		Persona persona = personaMapper.selectByPrimaryKey(idPersona);
		
		if(persona != null){
			
			ContactoCriteria cc = new ContactoCriteria();
			cc.createCriteria()
								.andEstadoEqualTo(Constante.ESTADO_ACTIVO)
								.andPersonaIdEqualTo(persona.getId());
			
			List<Contacto> listContactos = contactoMapper.selectByExample(cc);
			
			if(listContactos != null && listContactos.size() > 0){
				persona.setContactoPrincipal(listContactos.get(0));
			}
			
			EmailCriteria ec = new EmailCriteria();
			ec.createCriteria()
								.andEstadoEqualTo(Constante.ESTADO_ACTIVO)
								.andPersonaIdEqualTo(persona.getId())
								.andIndPrincipalEqualTo(Constante.ESTADO_ACTIVO);
			
			List<Email> listEmails = emailMapper.selectByExample(ec);
			
			if(listEmails != null && listEmails.size() > 0){
				persona.setEmailPrincipal(listEmails.get(0));
			}
			
		}
		
		return persona;
	}
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Persona saveAll(Persona persona, Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		logger.info("PersonaSevice : save() ");
		
		if(persona.getId() == null){
			
			persona.setUsuarioRegistro(usuario.getUsuario());
			persona.setFechaRegistro(new Date());
			personaMapper.insertSelective(persona);
			
		}else{
			persona.setUsuarioModifico(usuario.getUsuario());
			persona.setFechaModifico(new Date());
			personaMapper.updateByPrimaryKeySelective(persona);
		}
		
		
		if(persona.getListContacto() != null && persona.getListContacto().size()>0){
			
			ContactoCriteria contactoCriteria=new ContactoCriteria();
			contactoCriteria.createCriteria().andPersonaIdEqualTo(persona.getId());
			contactoMapper.deleteByExample(contactoCriteria);
			
			for (Contacto contacto : persona.getListContacto()) {
				
				contacto.setEstado(Constante.ESTADO_ACTIVO);
				contacto.setPersonaId(persona.getId());
				contactoMapper.insertSelective(contacto);
			}
			
		}

		if(persona.getListEmail() != null && persona.getListEmail().size()>0){
			
			EmailCriteria emailCriteria=new EmailCriteria();
			emailCriteria.createCriteria().andPersonaIdEqualTo(persona.getId());
			emailMapper.deleteByExample(emailCriteria);
			
			for (Email email : persona.getListEmail()) {
				
				email.setEstado(Constante.ESTADO_ACTIVO);
				email.setPersonaId(persona.getId());
				emailMapper.insertSelective(email);
			}

		}
		
		return persona;
	}
	
	
	public Persona obtenerPersonaContactosAllPorId(Integer idPersona) {
		// TODO Auto-generated method stub
		Persona persona = personaMapper.selectByPrimaryKey(idPersona);
		
		if(persona != null){
			
			ContactoCriteria cc = new ContactoCriteria();
			cc.createCriteria()
								.andEstadoEqualTo(Constante.ESTADO_ACTIVO)
								.andPersonaIdEqualTo(persona.getId());
			
			List<Contacto> listContactos = contactoMapper.selectByExample(cc);
			
			persona.setListContacto(listContactos);
			
			EmailCriteria ec = new EmailCriteria();
			ec.createCriteria()
								.andEstadoEqualTo(Constante.ESTADO_ACTIVO)
								.andPersonaIdEqualTo(persona.getId());
								
			
			List<Email> listEmails = emailMapper.selectByExample(ec);
			
			persona.setListEmail(listEmails);
			
			if(persona.getDistrito()!=null){
				persona.setUbigeo(UbigeoMapper.selectByPrimaryKey(persona.getDistrito()));
			}
		
		}
		
		return persona;
	}

	
	public void deleteByPk(Integer idPersona) throws Exception {
		// TODO Auto-generated method stub
		Persona persona=new Persona();
		persona.setId(idPersona);
		persona.setEstado(Constante.ESTADO_INACTIVO);
		personaMapper.updateByPrimaryKeySelective(persona);
		
	}
	
	
	

}
