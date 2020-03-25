package github.com.TomaszC283.ProjectOrganizer.Controller;

import javax.ws.rs.GET;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;

public class ErrorPageController implements ErrorController {

		@Override
		public String getErrorPath() {
			return "/error";
		}
		
		@GET
		@RequestMapping(value = "/error")
		public String showErrorPage() {
			return "error";
		}
}
