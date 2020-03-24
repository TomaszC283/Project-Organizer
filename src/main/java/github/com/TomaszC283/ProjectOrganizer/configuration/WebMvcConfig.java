package github.com.TomaszC283.ProjectOrganizer.configuration;

import javax.servlet.MultipartConfigElement;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.unit.DataSize;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;



@Configuration
public class WebMvcConfig extends WebSecurityConfigurerAdapter implements WebMvcConfigurer {
	
	@Bean
	public BCryptPasswordEncoder pwdEncrypt() {
		BCryptPasswordEncoder bcp = new BCryptPasswordEncoder();
		return bcp;
	}
	
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		factory.setMaxFileSize(DataSize.ofMegabytes(5));
		factory.setMaxRequestSize(DataSize.ofMegabytes(5));
		return factory.createMultipartConfig();
	}
	
    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }
}
