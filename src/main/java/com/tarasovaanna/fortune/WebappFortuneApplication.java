package com.tarasovaanna.fortune;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class WebappFortuneApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebappFortuneApplication.class, args);
	}

}
