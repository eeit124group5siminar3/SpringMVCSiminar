package tw.group5.config;

import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "tw.group5")

//@EnableTransactionManagement

//@PropertySource("classpath:jdbc.properties")
//mvc-servlet.xml
public class SpringMVCJavaConfig implements WebMvcConfigurer {
//	@Autowired
//	private Environment env;

	
	public SpringMVCJavaConfig() {
		
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
		
	}

	// 設定view處理者
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(2);
		return viewResolver;
	}

//	 獲得DataSource
//	@Bean
//	public DataSource getJndiObjectFactoryBean() {
//		JndiObjectFactoryBean factoryBean = new JndiObjectFactoryBean();
//		factoryBean.setJndiName("java:comp/env/jdbc/xe");
//		DataSource ds = (DataSource) factoryBean.getObject();
//		return ds;
//	}

//	// 獲得SessionFactory
//	@Bean(destroyMethod = "destroy")
//	public LocalSessionFactoryBean sessionFactory() {
//		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
//		sessionFactory.setDataSource(getJndiObjectFactoryBean());
//		sessionFactory.setPackagesToScan("tw.group5");
//		Properties hibernateProperties = new Properties();
//		hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.Oracle12cDialect");
//		hibernateProperties.put("hibernate.current_session_context_class", "thread");
//		hibernateProperties.put("hibernate.show_sql", "true");
//		hibernateProperties.put("hibernate.format_sql", "true");
//		sessionFactory.setHibernateProperties(hibernateProperties);
//		return sessionFactory;
//	}

	// 增加屬性
//	public void addProperties() {
//		String driverClassName = env.getRequiredProperty("datasource.driverClassName");
//		String url = env.getRequiredProperty("datasource.url");
//		String username = env.getRequiredProperty("datasource.username");
//		String password = env.getRequiredProperty("datasource.password");
//		System.out.println("driverClassName = " + driverClassName);
//		System.out.println("url = " + url);
//		System.out.println("username = " + username);
//		System.out.println("password = " + password);
//	}

	// 獲得multipart處理者
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		return commonsMultipartResolver;
	}
	
	//獲得jsonView
//	@Bean
//	public MappingJackson2JsonView jsonView() {
//		MappingJackson2JsonView mj2jv=new MappingJackson2JsonView();
//		mj2jv.setPrettyPrint(true);
//		return mj2jv;
//	}
	
	//註冊用Json顯示的類別
//	@Bean
//	 public Jaxb2Marshaller jaxbMarshaller() {
//		Jaxb2Marshaller jaxb2Marshaller=new Jaxb2Marshaller();
////		jaxb2Marshaller.setClassesToBeBound(classesToBeBound);
//		return jaxb2Marshaller;
//	 }
	
	//註冊JsonView
//	@Bean
//	public ContentNegotiatingViewResolver getContentNegotiatingViewResolver() {
//		ContentNegotiatingViewResolver contentNegotiatingViewResolver=new ContentNegotiatingViewResolver();
//		List<View> list =new ArrayList<View>();
//		list.add(jsonView());
//		contentNegotiatingViewResolver.setDefaultViews(list);
//		return contentNegotiatingViewResolver;
//	}

//註冊View
//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addRedirectViewController("/", "/FrontPage");
//		registry.addViewController("/");
//		addViewController("/").setViewName("redirect:FrontPage");
//		WebMvcConfigurer.super.addViewControllers(registry);
//		return "/FrontPage";
//	}
	// 增加資源處理者
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/pages/images/");
			registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/pages/css/");
			registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/pages/js/");
			registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/pages/fonts/");
		}


}
