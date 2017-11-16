package pe.com.pdp;


import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilFecha {
	
	
	public static String toStringDateWithFormat(Date fecha, String format)
	{
		String strFecha="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		strFecha = sdf.format(fecha);
		return strFecha;
		
	}

	 	 	 
	 public Date fechaActual(){
		 java.util.Date fecha = new Date();		 
		 return fecha;
	 }
	 
	 
		public String getNombreMes(Date fecha){
			Integer mes = null; 
			String nombre="";
			if(fecha != null){
				Date dt = new UtilFecha().fechaActual();
			    String formato="MM";		    		    
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    mes =Integer.parseInt(dateFormat.format(dt));
			    
			    if(mes==1)nombre="Enero";
			    if(mes==2)nombre="Febrero";
			    if(mes==3)nombre="Marzo";
			    if(mes==4)nombre="Abril";
			    if(mes==5)nombre="Mayo";
			    if(mes==6)nombre="Junio";
			    if(mes==7)nombre="Julio";
			    if(mes==8)nombre="Agosto";
			    if(mes==9)nombre="Septiembre";
			    if(mes==10)nombre="Octubre";
			    if(mes==11)nombre="Noviembre";
			    if(mes==12)nombre="Diciembre";
			}
			return nombre;
		}
		public static String getNombreMesPorNumeroMes(Integer mes){
			String nombre="";
			
			if(mes==1)nombre="Enero";
		    if(mes==2)nombre="Febrero";
		    if(mes==3)nombre="Marzo";
		    if(mes==4)nombre="Abril";
		    if(mes==5)nombre="Mayo";
		    if(mes==6)nombre="Junio";
		    if(mes==7)nombre="Julio";
		    if(mes==8)nombre="Agosto";
		    if(mes==9)nombre="Septiembre";
		    if(mes==10)nombre="Octubre";
		    if(mes==11)nombre="Noviembre";
		    if(mes==12)nombre="Diciembre";
			
			return nombre;
		}
		public static String getNombreMesPorNumeroMes_corto(Integer mes){
			String nombre="";
			
			if(mes==1)nombre="ENE";
		    if(mes==2)nombre="FEB";
		    if(mes==3)nombre="MAR";
		    if(mes==4)nombre="ABR";
		    if(mes==5)nombre="MAY";
		    if(mes==6)nombre="JUN";
		    if(mes==7)nombre="JUL";
		    if(mes==8)nombre="AGO";
		    if(mes==9)nombre="SEP";
		    if(mes==10)nombre="OCT";
		    if(mes==11)nombre="NOV";
		    if(mes==12)nombre="DIC";
			
			return nombre;
		}
	 
		
		
		 public static Integer getYear(Date date){
				String formato="yyyy";
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    return Integer.parseInt(dateFormat.format(date));
		    
		 }
		 
		 public static String getMonth(Date date){
			 	int mes=0;
			 	String mm="";
				String formato="MM";
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    mes=Integer.parseInt(dateFormat.format(date));	
			    if (mes <= 9) {
			 		mm="0"+mes;
			 	}else{
			 		mm=mes+"";
			 	}
			     return mm;
		 }
		 
		 public static String getHour(Date date){
			 	String hour="";
				String formato="HH:mm:ss";
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    hour = dateFormat.format(date);
			    return hour;
		 }
		 
		 public static String getDay(Date date){
			 	int dia=0;
			 	String dd="";
				String formato="dd";
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    dia= Integer.parseInt(dateFormat.format(date));
			  	if (dia <= 9) {
			 		dd="0"+dia;
			 	}else{
			 		dd=dia+"";
			 	}
			    return dd;
		 }
		 
		 public static String getDateHMTurno(Date fecha) {
		    	//Date fecha = fecha;
		    	int hora = fecha.getHours();
		    	String horaFinal="";
		    	String minutoFinal="";
		    	String postFijo="AM";
		    	if(hora>11){
		    		postFijo="PM";
		    	}
		    	
			 	String hour="";
				String formato="HH:mm";
			    SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
			    hour = dateFormat.format(fecha);

		    	String factual = hour+' '+ postFijo + "";
		    	return factual;
		    }

}
