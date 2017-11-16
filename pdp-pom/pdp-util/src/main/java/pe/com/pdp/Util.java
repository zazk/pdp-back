package pe.com.pdp;


import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {

	public static String replaceCaracterRaro(String cadena,String caracterRaro,String valorRemplazo) {
		if(valorRemplazo!=null){
			String replacement = Matcher.quoteReplacement(valorRemplazo);
			String searchString = Pattern.quote(caracterRaro);
			cadena = cadena.replaceAll(searchString, replacement);	
		}else{
			String replacement = Matcher.quoteReplacement("");
			String searchString = Pattern.quote(caracterRaro);
			cadena = cadena.replaceAll(searchString, replacement);
		}
		
		return cadena;
	}
	
	
	public static String generarPasword(int longitud){
		String cadenaAleatoria = "";
		long milis = new java.util.GregorianCalendar().getTimeInMillis();
		Random r = new Random(milis);
		int i = 0;
			while ( i < longitud){
			char c = (char)r.nextInt(255);
				if ( (c >= '0' && c <='9') || (c >='A' && c <='Z') ){
				cadenaAleatoria += c;
				i ++;
				}
			}
		return cadenaAleatoria;
		
	}
}
