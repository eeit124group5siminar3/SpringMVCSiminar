package tw.group5.config;


import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import tw.group5.util.OpenSessionInViewFilter;
//Web.xml
public class DemoDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

//	@Override
//	protected Filter[] getServletFilters() {
//	CharacterEncodingFilter characterEncodingFilter=new CharacterEncodingFilter();
//	characterEncodingFilter.setEncoding("UTF-8");
//	characterEncodingFilter.setForceEncoding(true);
//	return new Filter[] {characterEncodingFilter};
//	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {SpringMVCJavaConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(SpringMVCJavaConfig.class);
		rootContext.setServletContext(servletContext);
		ServletRegistration.Dynamic mvc = servletContext.addServlet("mvc", new DispatcherServlet(rootContext));
		mvc.setLoadOnStartup(1);
		mvc.addMapping("/");
		FilterRegistration.Dynamic filterRegistration = servletContext.addFilter("endcodingFilter", new CharacterEncodingFilter());
		filterRegistration.setInitParameter("encoding", "UTF-8");
		filterRegistration.setInitParameter("forceEncoding", "true");
		filterRegistration.addMappingForUrlPatterns(null, false, "/*");
		filterRegistration = servletContext.addFilter("OpenSessionInViewFilter", OpenSessionInViewFilter.class);
		//filterRegistration.setInitParameter("sessionFactoryBeanName", "sessionFactory");
		filterRegistration.addMappingForUrlPatterns(null, true, "/*");
		filterRegistration.addMappingForServletNames(null, true, "mvc");

		servletContext.addListener(new ContextLoaderListener(rootContext));
	}

//	@Override
//	protected Class<?>[] getServletConfigClasses() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	protected String[] getServletMappings() {
//		// TODO Auto-generated method stub
//		return null;
//	}

}