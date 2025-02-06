package bl.config;  

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
        .allowedOrigins(
            "http://localhost:8082",  // Aggiungi localhost
            "http://[2a02:aa16:397d:ea00:7499:2b0d:a4a3:314c]:8082"  // Indirizzo IPv6
        ).allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") 
         .allowedHeaders("*")  
         .allowCredentials(true);  
    }
}
