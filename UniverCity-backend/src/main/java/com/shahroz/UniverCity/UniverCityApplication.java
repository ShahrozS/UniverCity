package com.shahroz.UniverCity;

import com.shahroz.UniverCity.Entities.Role;
import com.shahroz.UniverCity.Repositories.RoleRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableJpaAuditing(auditorAwareRef = "auditorAware")
@EnableAsync
//@EnableCaching
@SpringBootApplication
public class UniverCityApplication {

	public static void main(String[] args) {
		SpringApplication.run(UniverCityApplication.class, args);


	}
	@Bean
	public CommandLineRunner runner(RoleRepository roleRepository) {
		return args -> {
			if (roleRepository.findByName("USER").isEmpty()) {
				roleRepository.save(Role.builder().name("USER").build());
			}
		};
	}




}

