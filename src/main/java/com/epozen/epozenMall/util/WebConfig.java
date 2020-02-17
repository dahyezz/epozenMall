package com.epozen.epozenMall.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	private static final String CLASSPATH_RESOURCE_LOCATIONS = "classpath:/static/";
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	
		registry.addResourceHandler("/image/**")
			.addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS+"image/")
			.setCachePeriod(20);
	}
}
