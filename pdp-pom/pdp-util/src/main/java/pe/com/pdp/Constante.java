package pe.com.pdp;

public class Constante {

	public static final String ESTADO_CREADO = "C";
	
	public static final String TRUSTED_CLIENT ="SERVICIOS_MIRAFLORES";
	public static final String SECRET_CLIENT ="R34CH$3rv1c3_p4ssWord_$s3cr3t";
	
	public static final String OAUTH_USER_WEB ="pdp_web_user";
	public static final String OAUTH_USER_WEB_PASS ="153952ff0ed1fdd851a22c9277af8dd5";
	
	public static final String STR_ESTADO_ENABLE ="1";
	public static final String STR_ESTADO_DISABLE ="2";
	
	public static final String STR_ESTADO_ACTIVO ="1";
	public static final String STR_ESTADO_INACTIVO ="2";
	
	
	
	public static final int ESTADO_ACTIVO = 1;
	public static final int ESTADO_INACTIVO = 2;
	public static final int ESTADO_CERO = 0;
	
	public static final String  USUARIO_ADMIN="ADMIN";
	public static final Integer USUARIO_ADMIN_ID=1;
	public static final String ADMINISTRADOR_MASTER = "ADMINISTRADOR-MASTER";
	public static final Integer IND_PADRE_SUPERIOR=2;
	public static final Integer IND_PADRE_HIJO=3;
	public static final Integer VALOR_PADRE_SUPERIOR=0;
	public static final Integer NUMERO_CERO=0;
	public static final Integer NUMERO_UNO=1;
	public static final Integer NUMERO_DOS=2;
	public static final Integer NUMERO_TRES=3;
	public static final Integer NUMERO_DIEZ=10;
	
	public static final int IND_REGISTRO_MOBIL =1;
	public static final int USUARIO_MOBIL=2;
	
	public static final Integer CATALOGO_ID_TIPO_APPWEB =14;
	
	public static final String PATH_UPLOADS = "/var/files/images/";
	
	public static final String PATH_QR = "/var/files/images/qr/";
	public static final String PATH_BUSQUEDA = "/var/files/pdf/busqueda/";
	public static final String PATH_ENCONTRADA = "/var/files/pdf/encontrada/";
	
	public static int ELEMENTO_QR_BUSQUEDA = 34;
	public static int ELEMENTO_QR_ENCONTRE = 35;
	public static int ELEMENTO_PDF_BUSQUEDA = 39;
	public static int ELEMENTO_PDF_ENCONTRE = 40;
	public static int ELEMENTO_URL_WEB_BACKEND = 354;
	
	public static final int TIPO_MEDIO_MOBIL=14;
	public static final int TIPO_MEDIO_WEB=15;
	
	public static final int TIPO_NOTIFICACION_BUSQUEDA=11;
	public static final int PROCESO_NOTIFICACION_BUSQUEDA=1;
	public static final int PROCESO_NOTIFICACION_ENCONTRADO=2;
	public static final int TIPO_NOTIFICACION_ENCONTRADO=13;
	/**MODULOS-ICONO**/
	public static final String MODULO_INICIO ="INICIO";
	public static final String CONTENT_PDF="application/pdf"; 
	
	public static class TIPO_RS{
		public static final String FACEBOOK  =  "fb";
		public static final String GOOGLE    =  "go";
		public static final String TWITTER   =  "tw";
	}
	
	
	public static int ACCION_LO_VI = 1;
	public static int ACCION_LO_TENGO = 2;
	
	public static final int ID_PARAMETRO_NOTI_VIGENCIA = 357;
	public static final int ID_PARAMETRO_MAX_MESES_VIGENCIA = 358;
	public static final String TIPO_NOTI_VIGENCIA_BUSQUEDA ="B";
	public static final String TIPO_NOTI_VIGENCIA_ENCONTRADO ="E";
	
	public static int GENERO_MASCULINO = 4;
	public static int GENERO_FEMENINO = 5;
	public static int TIPO_TELEFONO_CELULAR = 17;
	public static int AVISO_SERVICIO_NOTIFICACION=12;
	
}
