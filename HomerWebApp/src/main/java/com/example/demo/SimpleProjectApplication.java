package com.example.demo;

import org.springframework.boot.SpringApplication;


import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@SpringBootApplication
@ComponentScan(basePackages = {"configuration","controller"})
@EntityScan(basePackages = {"training", "documents","employee"})

@EnableJpaRepositories(basePackages = {"employee", "training","documents"})


public class SimpleProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SimpleProjectApplication.class, args);
	
	}
	
}





	
	
	
