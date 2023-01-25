package configuration;

import javax.sql.DataSource;



import org.springframework.boot.jdbc.DataSourceBuilder;

import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import documents.DocumentsRepository;
import employee.EmployeeRepository;
import training.TrainingRepository;


@Configuration
@ComponentScan("employee")
public class WebConfig implements WebMvcConfigurer  
{
	
	   @Override
	    public void addViewControllers(ViewControllerRegistry registry) {
	        registry.addViewController("/").setViewName("index");
	    }

	
	   @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/static/**")
	                .addResourceLocations("classpath:/static/");
	    }
	   
	   @Override
	   public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	       configurer.enable("jsp");
	   }
	   
}
