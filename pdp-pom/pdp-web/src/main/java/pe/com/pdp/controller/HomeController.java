package pe.com.pdp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/")
public class HomeController {
	
	@RequestMapping
	public ModelAndView index(){
		
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}

	
}
