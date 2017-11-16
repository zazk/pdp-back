package pe.com.pdp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/")
public class HomeController {
	
	@RequestMapping
	public ModelAndView index(){
		
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "test-upload" , method = RequestMethod.POST)
    public @ResponseBody Map<String, ? extends Object>  convertToPdf(MultipartFile file , String nombres) throws Exception {

		Map<String, Object> data = new HashMap<String,Object>();
		try {
			
		   	data.put("success", true);
		    data.put("nombres", nombres);
		    data.put("fileSize", file.getSize());
		    data.put("originalName", file.getOriginalFilename());
		    data.put("contentType", file.getContentType());
		    
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			data.put("message", e.getMessage());
		 	data.put("success", false);
		
		}
		
		return data;
	   
    }

	
}
