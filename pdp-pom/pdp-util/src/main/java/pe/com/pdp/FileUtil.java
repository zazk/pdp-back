package pe.com.pdp;

import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

public class FileUtil {

	public static void guardarFileInPath(byte[] fileData,String fileName,String path) throws Exception{
		
		File directorio = new File(path);
		if (!directorio.exists()) {
			directorio.mkdirs();
		}
		
		FileOutputStream fileOut = new FileOutputStream(path+fileName);
		BufferedOutputStream buffer = new BufferedOutputStream(fileOut);
		buffer.write(fileData);
		buffer.flush();
		buffer.close();
		
	}
	
	public static void copyFile(File source,File target){
		try {
		    FileUtils.copyDirectory(source, target);
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
	
	public static void moveFile(File afile,File bfile){

	   	InputStream inStream = null;
		OutputStream outStream = null;
			
	    	try{
	    		
	    	    inStream = new FileInputStream(afile);
	    	    outStream = new FileOutputStream(bfile);
	        	
	    	    byte[] buffer = new byte[1024];
	    		
	    	    int length;
	    	    //copy the file content in bytes 
	    	    while ((length = inStream.read(buffer)) > 0){
	    	  
	    	    	outStream.write(buffer, 0, length);
	    	 
	    	    }
	    	 
	    	    inStream.close();
	    	    outStream.close();
	    	    
	    	    if(afile.exists()){
	    	    	afile.delete();
	    	    }
	    	    
	    	}catch(IOException e){
	    	    e.printStackTrace();
	    	}
	}
	
	public static boolean eliminarArchivo(String path) {

		File f = new File(path);

		if (f.delete()) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public static boolean validarNombreDocumentoFirmando(String nombreFile)
	  {
	    if (nombreFile == null) {
	      return false;
	    }
	    if (StringUtils.isEmpty(nombreFile)) {
	      return false;
	    }
	    if (StringUtils.isBlank(nombreFile)) {
	      return false;
	    }
	    nombreFile = nombreFile.toLowerCase();
	    if (nombreFile.indexOf(" ") >= 0) {
	      return false;
	    }
	    if ((nombreFile.indexOf("�") >= 0) || (nombreFile.indexOf("�") >= 0) || 
	      (nombreFile.indexOf("�") >= 0) || (nombreFile.indexOf("�") >= 0) || 
	      (nombreFile.indexOf("�") >= 0) || (nombreFile.indexOf("�") >= 0) || 
	      (nombreFile.indexOf("/") >= 0) || (nombreFile.indexOf("\\") >= 0) || 
	      (nombreFile.indexOf("�") >= 0) || (nombreFile.indexOf("+") >= 0) || 
	      (nombreFile.indexOf("*") >= 0) || (nombreFile.indexOf(",") >= 0)) {
	      return false;
	    }
	    return true;
	  }
	  
	  public static File convertUrlToFile(String url, String pathConvertFile)
	  {
		File f = null;
	    try
	    {
	      URL urlFile = new URL(url);
	      try
	      {
	        ReadableByteChannel rbc = Channels.newChannel(urlFile.openStream());
	        
	        FileOutputStream fos = new FileOutputStream(pathConvertFile);
	        fos.getChannel().transferFrom(rbc, 0L, 16777216L);
	        
	        f = new File(pathConvertFile);
	      }
	      catch (IOException e)
	      {
	        e.printStackTrace();
	      }
	     
	    }
	    catch (MalformedURLException e)
	    {
	      e.printStackTrace();
	    }
	    
	    return f;
	  }
	  
		public static byte[] getBytesFromFile(File file) throws IOException {
			InputStream is = new FileInputStream(file);

			// Get the size of the file
			long length = file.length();

			// You cannot create an array using a long type.
			// It needs to be an int type.
			// Before converting to an int type, check
			// to ensure that file is not larger than Integer.MAX_VALUE.
			if (length > Integer.MAX_VALUE) {
				// File is too large
			}

			// Create the byte array to hold the data
			byte[] bytes = new byte[(int) length];

			// Read in the bytes
			int offset = 0;
			int numRead = 0;
			while (offset < bytes.length
					&& (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
				offset += numRead;
			}

			// Ensure all the bytes have been read in
			if (offset < bytes.length) {
				throw new IOException("Could not completely read file "
						+ file.getName());
			}

			// Close the input stream and return bytes
			is.close();
			return bytes;
		}
		
		public static File convertByteToFile(String filePath,	byte[] fileData) {
			try {
				
				FileOutputStream fileOut = new FileOutputStream(filePath);
				BufferedOutputStream buffer = new BufferedOutputStream(fileOut);
				buffer.write(fileData);
				buffer.flush();
				buffer.close();

				return new File(filePath);
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
	  
	  public static void main(String[] args)
	  {
		  String clave = "22012010Oso";
		  
		  
		  
//	    System.out.println("resultado: " + validarNombreDocumentoFirmando("MANANA.PDF"));
//	    
//	    String url = "adjuntos/temp/test.pdf";
//	    System.out.println(url.substring(url.lastIndexOf("/") + 1));
	  }
	
}
