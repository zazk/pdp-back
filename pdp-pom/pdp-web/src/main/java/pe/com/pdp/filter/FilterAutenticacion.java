package pe.com.pdp.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FilterAutenticacion implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

	      HttpServletRequest httpRequest = (HttpServletRequest) request;
		  HttpServletResponse httpResponse = (HttpServletResponse) response;
		  
		  httpRequest.setCharacterEncoding("UTF-8");
		  
		  HttpSession sesion =  httpRequest.getSession();
		  String context = httpRequest.getContextPath();
		  
		  if(sesion.getAttribute("usuarioLoginAutenticate")==null){
			  	httpResponse.sendRedirect(context+"/login");
		  }
		  
		  chain.doFilter(request,response);
		 
		
	}

	@Override
	public void destroy() {}

}
