package pe.com.pdp.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import pe.com.pdp.filter.FilterAutenticacion;




public class WebInit implements WebApplicationInitializer {

	private static final String DISPATCHERSERVLET = "DispatcherServlet";
	private static final String SPRING_DISPATCHERSERVLET_MAPPING = "/";
	
	public void onStartup(ServletContext servletContext) throws ServletException {
		// TODO Auto-generated method stub
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(WebConfig.class);
		ctx.setServletContext(servletContext);
		Dynamic servlet = servletContext.addServlet(DISPATCHERSERVLET, new DispatcherServlet(ctx));
		servlet.addMapping(SPRING_DISPATCHERSERVLET_MAPPING);
		servletContext.addListener(SessionListener.class);
		servlet.setLoadOnStartup(1);
		filterAppPdp(servletContext);

	}
	
	private void filterAppPdp(final ServletContext servletContext) {
		FilterRegistration charEncodingfilterReg = servletContext.addFilter("CharacterEncodingFilter", FilterAutenticacion.class);
		charEncodingfilterReg.setInitParameter("encoding", "UTF-8");
		charEncodingfilterReg.setInitParameter("forceEncoding", "true");
		//charEncodingfilterReg.setInitParameter("nombreSistema","pdp-web");
		charEncodingfilterReg.setInitParameter("nombreSistema","pdp");
		//charEncodingfilterReg.addMappingForUrlPatterns(null, false, "/main/*");
		charEncodingfilterReg.addMappingForUrlPatterns(null, false, "/main/*");
	}

}
