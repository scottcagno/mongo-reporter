package com.cagnosolutions.starter.app
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.EnableAutoConfiguration
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaRepositories
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity
import org.springframework.security.web.util.matcher.AntPathRequestMatcher
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter

import javax.sql.DataSource
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */


@ComponentScan
@EnableJpaRepositories
@EnableAutoConfiguration
class Application {
    static void main(String... args) {
        SpringApplication.run Application, args
    }
}

@Configuration
class StaticMapping extends WebMvcConfigurerAdapter {
    void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }
}

@Configuration
@EnableWebMvcSecurity
class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN")
    }

    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/secure/**").hasAnyRole("ADMIN")
        http.formLogin().loginPage("/login")
        http.logout().logoutSuccessUrl("/").logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
    }
}