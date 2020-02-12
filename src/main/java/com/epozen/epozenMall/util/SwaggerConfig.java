package com.epozen.epozenMall.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {


	/*
	 * localhost:9090/swagger-ui.html 접속
	 */
	
	@Bean
	public Docket api() {
		
		//Authentication header 처리를 위해 사용
		List<Parameter> global = new ArrayList<>();
		global.add(new ParameterBuilder()
						.name("Authorization")
						.description("Access Token")
						.parameterType("header")
						.required(false)
						.modelRef(new ModelRef("string")).build()
				);
		
		return new Docket(DocumentationType.SWAGGER_2)
				.select()
				.apis(RequestHandlerSelectors.any()) //현재 RequestMapping으로 할당된 모든 URL 리스트를 추출
				.paths(PathSelectors.any()) 
				.build();
	}
}
