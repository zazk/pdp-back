package pe.com.pdp.service;

import java.util.List;

import pe.com.pdp.domain.postgres.Email;


public interface EmailService {

	public  List<Email> findEmailActico(String email) throws Exception;
	public void sendMailPersonal(Email email) throws Exception ;
	
}
