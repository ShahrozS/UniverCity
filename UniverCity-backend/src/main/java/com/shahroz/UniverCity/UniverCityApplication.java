package com.shahroz.UniverCity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class UniverCityApplication {

	public static void main(String[] args) {
		SpringApplication.run(UniverCityApplication.class, args);
	}

}

