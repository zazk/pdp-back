package pe.com.pdp.config;


import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@EnableWebMvc
@ComponentScan(basePackages = { "pe.com.pdp" })
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter{

	@Bean
	 public UrlBasedViewResolver setupViewResolver() {
		
		 UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		 resolver.setPrefix("/WEB-INF/views/");
		 resolver.setSuffix(".jsp");
		 resolver.setViewClass(JstlView.class);
		 
		 return resolver;
	 
	 }
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}
	
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {

	   // registry.addResourceHandler("/app/**").addResourceLocations("/librerias/app/");
	    
	}
	

	
}
