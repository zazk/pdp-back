package pe.com.pdp;


import java.awt.image.BufferedImage;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import com.lowagie.text.DocumentException;


import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;


public class GenerateQRCode {

	public static void main(String[] args) throws DocumentException, MalformedURLException, IOException {
		 String urlQrCode="www.miraflores.gob.pe";
		 String urlFileImage="D:/arturo/test/qr/qr_prueba/";
		 String nameArchive="05212331";
		 String name = execute(urlQrCode,urlFileImage,nameArchive);
		 System.out.println(name);
	}

	/**
	 * @param 	urlQrCode : Url del link que abrira el QR,
	 * 			urlFileImage : donde ira almacenada la imagen QR generada
	 * 			nameArchive : nombre de la imagen QR. 
	 */
	public static String execute(String urlQrCode, String path, String nameArchive){
		
		File fQR = new File(path);
		
		System.out.println("el path para el QR->"+path);
		
		if(!fQR.exists()){fQR.mkdirs();}
		
		String nameConcat = path+nameArchive;
		ByteArrayOutputStream out = QRCode.from(urlQrCode).to(ImageType.PNG).stream();
		
		try {
			FileOutputStream fout = new FileOutputStream(new File(nameConcat));
			fout.write(out.toByteArray());
			fout.flush();
			fout.close();
			
		} catch (FileNotFoundException e) {e.printStackTrace();
		} catch (IOException e) {e.printStackTrace();}
		return nameConcat;
	}
	
	
}

