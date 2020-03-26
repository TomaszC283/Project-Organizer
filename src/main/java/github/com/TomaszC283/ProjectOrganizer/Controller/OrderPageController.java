package github.com.TomaszC283.ProjectOrganizer.Controller;

import javax.ws.rs.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderPageController {

	@GET
	@RequestMapping(value="/workingpanel")
	public String showWorkingPanel() {
		return "workingpanel";
	}
}
