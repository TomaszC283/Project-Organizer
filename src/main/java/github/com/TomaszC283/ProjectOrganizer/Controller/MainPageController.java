package github.com.TomaszC283.ProjectOrganizer.Controller;

import javax.ws.rs.GET;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

	private static Logger LOG = LoggerFactory.getLogger(MainPageController.class);
	
	@GET
	@RequestMapping(value = {"/", "/index"})
	public String showMainPage() {
		LOG.info("**** WYWOŁANO > showMainPage()");
		return "index";
	}
}
