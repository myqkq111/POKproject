package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class Context_4_fileupload { //라이브러리를 추가할 때마다 객체를 추가해주어야 한다.
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		
		multipartResolver.setDefaultEncoding("utf-8");
		multipartResolver.setMaxUploadSize(10485760);
		
		return multipartResolver;
		
	}
	
	
	
}
