package pe.com.pdp.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfNumber;
import com.itextpdf.text.pdf.PdfPage;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import pe.com.pdp.Constante;
import pe.com.pdp.domain.postgres.Busqueda;
import pe.com.pdp.domain.postgres.Encontrado;
import pe.com.pdp.domain.postgres.Mascota;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.BusquedaMascotaService;
import pe.com.pdp.service.EncontradoMascotaService;
import pe.com.pdp.service.MascotaService;

@Controller
public class MascotaController {

	//Mascota
	@Autowired
	private MascotaService mascotaService;
	
	@Autowired
	private BusquedaMascotaService busquedaMascotaService;
	
	@Autowired
	private EncontradoMascotaService encontradoMascotaService;

	@RequestMapping(value = "/mascota/mascota")
	public ModelAndView mascota() {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota/mascota");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mascota/mascota/mascota_form")
	public ModelAndView mascotaForm(Integer idMascota) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota/mascota_form");
	     Gson gson = new Gson();
		if(idMascota!=null){
			Mascota mascota=mascotaService.obtenerPotID(idMascota);
			modelAndView.addObject("dataMascota",gson.toJson(mascota));
			modelAndView.addObject("tituloMascota","Actualizar Mascota");
		}else{
			modelAndView.addObject("dataMascota",null);
			modelAndView.addObject("tituloMascota","Nueva Mascota");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/mascota/mascota/listar")
	public @ResponseBody Map<String, ? extends Object> mascotasListar(Mascota mascota,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaMascotas=mascotaService.findListaMascota(mascota);
			data.put("data", listaMascotas);
			data.put("recordsFiltered",mascotaService.countMascotas(mascota));
			data.put("recordsTotal",mascotaService.countTotalMascotas());
			data.put("draw",mascota.getDraw());
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/mascota/mascota/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarMascota(Mascota mascota,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			data.put("data", mascotaService.save(mascota));
			data.put("message", "Se registro Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/mascota/mascota/listarByPersona")
	public @ResponseBody Map<String, ? extends Object> mascotasListarByPersona(Mascota mascota,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Mascota> listaMascotas=mascotaService.listarMascota(mascota);
			data.put("data", listaMascotas);
			data.put("recordsFiltered",mascotaService.countMascotas(mascota));
			data.put("recordsTotal",mascotaService.countTotalMascotas());
			data.put("draw",mascota.getDraw());
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	
	@RequestMapping(value = "/mascota/mascota/obtenerByIdMascota")
	public @ResponseBody Map<String, ? extends Object> obtenerByIdMascota(Integer idMascota,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			HttpSession sesion = request.getSession();
			
			Mascota mascota=mascotaService.obtenerPotID(idMascota);
			
			data.put("data", mascota);
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/posterRegistroMascota" , method = RequestMethod.GET)
	public ModelAndView posterRegistroMascota(Integer id)throws Exception {
	
		ModelAndView modelAndView = new ModelAndView("public/posterRegistroMascota");
		
		 Gson gson = new Gson();
		if(id!=null ){
			Mascota mascota=mascotaService.obtenerPotID(id);
			
			modelAndView.addObject("dataMascota",gson.toJson(mascota));
			modelAndView.addObject("objectMascota",mascota);
			modelAndView.addObject("titulo","Encontro");
		}else{
			modelAndView.addObject("dataMascota",null);
			modelAndView.addObject("titulo","Busco");
		}
		return modelAndView;
	}
	
	
	

	
	
	//Mascota Busqueda
	@RequestMapping(value = "/mascota/mascota_busqueda")
	public ModelAndView BusquedaMascota() {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota_busqueda/mascota_busqueda");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mascota/mascota_busqueda/mascota_busqueda_form")
	public ModelAndView BusquedaMascotaForm(Integer idBusquedaMascota) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota_busqueda/mascota_busqueda_form");
	     Gson gson = new Gson();
		if(idBusquedaMascota!=null){
			Busqueda busquedaMascota=busquedaMascotaService.obtenerMascotaBuscada(idBusquedaMascota);
			modelAndView.addObject("dataBusquedaMascota",gson.toJson(busquedaMascota));
			modelAndView.addObject("tituloBusquedMascota","Actualizar Publicacion - Mascota");
		}else{
			modelAndView.addObject("dataBusquedaMascota",null);
			modelAndView.addObject("tituloBusquedMascota","Publicar Mascota");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/mascota/mascota_busqueda/listar")
	public @ResponseBody Map<String, ? extends Object> BusquedaMascotasListar(Busqueda busqueda,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaMascotas=busquedaMascotaService.findListaMascotaBusqueda(busqueda);
			data.put("data", listaMascotas);
			data.put("recordsFiltered",busquedaMascotaService.countMascotaBusquedas(busqueda));
			data.put("recordsTotal",busquedaMascotaService.countTotalMascotaBusquedas());
			data.put("draw",busqueda.getDraw());
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/mascota/mascota_busqueda/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarBusquedaMascota(Busqueda busqueda,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			busquedaMascotaService.saveBusquedaMascota(busqueda, usuario);
			data.put("data", busqueda);
			data.put("message", "Se registro Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//POSTER
	@RequestMapping(value = "/mostrarPosterBusqueda" , method = RequestMethod.GET)
	public ModelAndView posterMascotaBusqueda(Integer id)throws Exception {
	
		ModelAndView modelAndView = new ModelAndView("public/poster_busqueda");
		
		 Gson gson = new Gson();
		if(id!=null ){
			Busqueda busqueda=busquedaMascotaService.obtenerMascotaBuscada(id);
			modelAndView.addObject("dataBusqueda",gson.toJson(busqueda));
			modelAndView.addObject("titulo","Busco");
		}else{
			modelAndView.addObject("dataBusqueda",null);
			modelAndView.addObject("titulo","Encontro");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/descargarPosterpdfBusqueda", method = RequestMethod.GET, produces = Constante.CONTENT_PDF)
	protected @ResponseBody Resource  pdfPosterMascota(
			HttpServletRequest request, HttpSession httpSession,Integer id,
			HttpServletResponse response)throws FileNotFoundException {
		try {
			
			String rutapdf = Constante.PATH_BUSQUEDA;
			Busqueda busqueda=busquedaMascotaService.obtenerMascotaBuscada(id);
			
			String pdfHtml=busquedaMascotaService.generarPosterHtml(busqueda);
			
			OutputStream file = new FileOutputStream(new File(rutapdf+id+".pdf"));
            Document document = new Document(PageSize.A4.rotate(),10F,0F,0F,0F);
            
            PdfWriter writer = PdfWriter.getInstance(document, file);
            writer.setPdfVersion(PdfWriter.VERSION_1_7);
            
            document.open();
            document.setMarginMirroringTopBottom(true);
            document.setMargins(0,0,0,0);
            
            InputStream is = new ByteArrayInputStream(pdfHtml.toString().getBytes());
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
            
	        document.close();
	        file.close();
	        
	        File posterFile=new File(rutapdf+id+".pdf"); 

	        response.setContentType(Constante.CONTENT_PDF);
	        response.setHeader("Content-Disposition", "inline;filename=\""
					+ "posterMascota.pdf" + "\"");
	        response.setHeader("Content-Length", String.valueOf(posterFile.length()));
	        return new FileSystemResource(posterFile);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
	
	}
	
	
	
	
	//Mascota Encontrada
	@RequestMapping(value = "/mascota/mascota_encontrada")
	public ModelAndView EncontrarMascota() {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota_encontrada/mascota_encontrada");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mascota/mascota_encontrada/mascota_encontrada_form")
	public ModelAndView EcontrarMascotaForm(Integer idEncontrarMascota) throws Exception {
		ModelAndView modelAndView = new ModelAndView("private/mascota/mascota_encontrada/mascota_encontrada_form");
	     Gson gson = new Gson();
		if(idEncontrarMascota!=null){
			Encontrado encontrarMascota=encontradoMascotaService.obtenerMascotaEncontrada(idEncontrarMascota);
			modelAndView.addObject("dataEncontradaMascota",gson.toJson(encontrarMascota));
			modelAndView.addObject("tituloEncontradaMascota","Actualizar Publicacion - Mascota");
		}else{
			modelAndView.addObject("dataEncontradaMascota",null);
			modelAndView.addObject("tituloEncontradaMascota","Publicar Mascota");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/mascota/mascota_encontrada/listar")
	public @ResponseBody Map<String, ? extends Object> MascotasEncontradasListar(Encontrado encontrada,HttpServletRequest request) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			HttpSession sesion = request.getSession();
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			List<Map<String, Object>> listaMascotas=encontradoMascotaService.findListaMascotaEncontrado(encontrada);
			data.put("data", listaMascotas);
			data.put("recordsFiltered",encontradoMascotaService.countMascotaEncontradas(encontrada));
			data.put("recordsTotal",encontradoMascotaService.countTotalMascotaEncontradas());
			data.put("draw",encontrada.getDraw());
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message", "Error al intentar registrar los datos.");
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/mascota/mascota_encontrada/guardar", method = RequestMethod.POST)
	public @ResponseBody Map<String, ? extends Object> guardarMascotaEncontrada(Encontrado encontrado,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession sesion = request.getSession();
		request.setAttribute("messageOpcion", null);
		try {
			
			Usuario usuario = (Usuario) sesion.getAttribute("usuarioLoginAutenticate");
			encontradoMascotaService.saveEncontradoMascota(encontrado, usuario);
			data.put("data", encontrado);
			data.put("message", "Se registro Satisfactoriamente.");
			data.put("success", Boolean.TRUE);
			
		}catch (Exception e) {
			// TODO: handle exception
			data.put("success", Boolean.FALSE);
			data.put("message",e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	
	//POSTER
	@RequestMapping(value = "/mostrarPosterEncontrada" , method = RequestMethod.GET)
	public ModelAndView posterMascotaEncontrada(Integer id)throws Exception {
	
		ModelAndView modelAndView = new ModelAndView("public/poster_encontre");
		
		 Gson gson = new Gson();
		if(id!=null ){
			Encontrado encontrada=encontradoMascotaService.obtenerMascotaEncontrada(id);
			modelAndView.addObject("dataEncontrada",gson.toJson(encontrada));
			modelAndView.addObject("titulo","Encontro");
		}else{
			modelAndView.addObject("dataBusqueda",null);
			modelAndView.addObject("titulo","Busco");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/mostrarPosterPublicacion" , method = RequestMethod.GET)
	public ModelAndView mostrarPosterPublicacion(Integer id , String tipo)throws Exception {
	
		ModelAndView modelAndView = null;
		Gson gson = new Gson();
		Map<String, Object> item = null;
		if(Constante.TIPO_NOTI_VIGENCIA_BUSQUEDA.equals(tipo)){
			modelAndView = new ModelAndView("public/poster_busqueda");
			Busqueda b = new Busqueda();
			b.setId(id);
			item = busquedaMascotaService.findListaMascotaBusqueda(b).get(0);
			modelAndView.addObject("dataJson",gson.toJson(item));
			modelAndView.addObject("item", item);
		}else{
			modelAndView = new ModelAndView("public/poster_encontre");
			Encontrado e = new Encontrado();
			e.setId(id);
			item = encontradoMascotaService.findListaMascotaEncontrado(e).get(0);
			modelAndView.addObject("dataJson",gson.toJson(item));
			modelAndView.addObject("item",item);
		}
		
		modelAndView.addObject("tipo", tipo);

		return modelAndView;
	}
	
	@RequestMapping(value = "/descargarPosterpdfEncontrada", method = RequestMethod.GET, produces = Constante.CONTENT_PDF)
	protected @ResponseBody Resource  pdfPosterMascotaEncontrada(
			HttpServletRequest request, HttpSession httpSession,Integer id,
			HttpServletResponse response) throws FileNotFoundException{
		try {
			
			String rutapdf = Constante.PATH_ENCONTRADA;
			Encontrado encontrada=encontradoMascotaService.obtenerMascotaEncontrada(id);
			
			String pdfHtml=encontradoMascotaService.generarPosterHtml(encontrada );
			
	        
	        OutputStream file = new FileOutputStream(new File(rutapdf+id+".pdf"));
            Document document = new Document();
            document = new Document(PageSize.A4.rotate(),0F,0F,0F,0F);
            PdfWriter writer = PdfWriter.getInstance(document, file);
            document.open();


            InputStream is = new ByteArrayInputStream(pdfHtml.toString().getBytes());
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
	        document.close();
	        
	        file.close();
	        File posterFile=new File(rutapdf+id+".pdf"); 

	        response.setContentType(Constante.CONTENT_PDF);
	        response.setHeader("Content-Disposition", "inline;filename=\""
					+ "posterMascota.pdf" + "\"");
	        response.setHeader("Content-Length", String.valueOf(posterFile.length()));
	        return new FileSystemResource(posterFile);
	        
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		} 
	}
	
	
	
}
