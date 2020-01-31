package com.epozen.web.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/list","/login").permitAll() //인증없이 사용자의 접근을 허용
//				.anyRequest().authenticated() //나머지 모든 요청에 대해 인증을 요구
				.and()
			.formLogin()
//				.loginPage("/login") //인증이 필요한 페이지에 접근하여 리다이렉팅
				.and()
			.httpBasic();
	}
}
