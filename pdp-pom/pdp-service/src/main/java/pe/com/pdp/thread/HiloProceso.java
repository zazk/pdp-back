package pe.com.pdp.thread;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.docx4j.org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import pe.com.pdp.Constante;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.service.NotificacionService;


@Scope("singleton")
@Component
public class HiloProceso implements Runnable {
	
	Logger logger = Logger.getLogger(this.getClass());
	
	
	@Autowired
	NotificacionService notificacionService;


	/**
	 * El HashMap parametros contiene las variables que necesitara cada metodo
	 * especifico para ser invocado
	 */
	HashMap<String, Object> parametros = new HashMap<String, Object>();


	public synchronized void run() {
		logger.info("INICIO run()  HILOPROCESO: " + this.hashCode());
		try {
			/**
			 * Definir en constantes el numero que identicara cada proceso*
			 */
			
			switch ((Integer) parametros.get("proceso")) {
			case Constante.PROCESO_NOTIFICACION_BUSQUEDA: 
				
				notificacionService.notficarPublicaBusqueda(Integer.parseInt(parametros.get("idBusqueda").toString()));
				
			case Constante.PROCESO_NOTIFICACION_ENCONTRADO:
				
				notificacionService.notficarPublicaEncontrado(Integer.parseInt(parametros.get("idEncontrado").toString()));
	
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("FIN run()  HILOPROCESO this.hashCode():" + this.hashCode());
	}

	public HashMap<String, Object> getParametros() {
		return parametros;
	}

	public void setParametros(HashMap<String, Object> parametros) {
		this.parametros = parametros;
	}

}
