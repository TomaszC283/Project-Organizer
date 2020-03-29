package github.com.TomaszC283.ProjectOrganizer.Controller;

import javax.ws.rs.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	
	@GET
	@RequestMapping(value = {"/", "/index"})
	public String showMainPage() {
		return "index";
	}
	
	@GET
	@RequestMapping(value = "/denied")
	public String showMainPageWhenAccessDenied() {
		return "index";
	}
}
