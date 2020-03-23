package github.com.TomaszC283.ProjectOrganizer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class ProjectOrganizerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectOrganizerApplication.class, args);
	}

}
