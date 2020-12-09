package com.edu.interceter.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.edu.interceter.inter;

@Configuration
public class Mvcconfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new inter()).excludePathPatterns("/css/**","/fonts/**","plugin/**","scripts/**");
	}

}
