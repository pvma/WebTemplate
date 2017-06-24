package com.sourcebrewer.hoegarden.dsams.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class DsamsSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("pancajas").password("123456").authorities("ROLE_USER", "ROLE_ADMIN");
		auth.inMemoryAuthentication().withUser("hosorio").password("123456").authorities("ROLE_USER", "ROLE_ADMIN");
		auth.inMemoryAuthentication().withUser("useronly").password("123456").authorities("ROLE_USER");
		auth.inMemoryAuthentication().withUser("adminonly").password("123456").authorities("ROLE_ADMIN");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/patient/secured/**").access("hasRole('ROLE_USER')")
    	.antMatchers("/doctor/secured/**").access("hasRole('ROLE_USER')")
    	.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
        	//.anyRequest().authenticated()
        	.and()
				.formLogin().loginPage("/login")
                	.failureUrl("/login?error=true")
                	.usernameParameter("username")
                	.passwordParameter("password") 
				.and()
					.logout().logoutSuccessUrl("/login?logout")
				.and()
					.csrf();
	}
}
