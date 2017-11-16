package pe.com.pdp.service.impl;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import pe.com.pdp.Constante;
import pe.com.pdp.GenericExcepcion;
import pe.com.pdp.dao.postgres.EmailMapper;
import pe.com.pdp.domain.postgres.Email;
import pe.com.pdp.domain.postgres.EmailCriteria;
import pe.com.pdp.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	private static Logger logger = Logger.getLogger(EmailServiceImpl.class);

	
	@Autowired
	private EmailMapper emailMapper;
	

    @Autowired
    JavaMailSender mailSender;
	
	public List<Email> findEmailActico(String email) throws Exception {
		
		logger.info("Ingreso EmailSevice : findEmailActico()  ");
		// TODO Auto-generated method stub
		EmailCriteria criteriaEmail=new EmailCriteria();
		criteriaEmail.createCriteria().andEmailEqualTo(email.toUpperCase())
		.andEstadoEqualTo(Constante.ESTADO_ACTIVO).andIndPrincipalEqualTo(Constante.ESTADO_ACTIVO);
		
		return	emailMapper.selectByExample(criteriaEmail);
	}

	public void sendMailPersonal(final  Email email) throws Exception {
		
		logger.info("Ingreso EmailSevice : sendMailPersonal()  ");
		// TODO Auto-generated method stub
		 MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			    message.setFrom("sgplprueba@gmail.com ");
			    message.setTo(email.getTo());
			    message.setSubject(email.getSubject());
			    message.setText(email.getText(), true);
			    //message.addAttachment("CoolStuff.doc", new File("CoolStuff.doc"));

			}
		};
	        try {
	            mailSender.send(preparator);
	        	} catch (MailException ex) {
	           
	            logger.error(ex.getMessage());
	            throw new GenericExcepcion("No se puedo enviar el correo en estos momentos.");
	        	}
		
	}
	
	
	

}
