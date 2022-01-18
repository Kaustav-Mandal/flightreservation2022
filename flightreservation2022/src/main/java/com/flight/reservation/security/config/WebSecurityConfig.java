package com.flight.reservation.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public void configure(HttpSecurity http) throws Exception 
	{
		http.csrf().disable().authorizeRequests()
				.antMatchers("/registration", "/", "/index.html", "/login", "/login/login", "/registerUser","/reservations/*", "/reservations", "/css/*")
				.permitAll().antMatchers("/admin/addFlight", "/admin/reservationList").hasAnyAuthority("ADMIN").anyRequest().authenticated();
				
	}
	
	 @Override
	    public void configure(WebSecurity web) 
	 {
	        web.ignoring()
	            .antMatchers("/resources/**", "/static/**");
	 }

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManager();
	}

}
