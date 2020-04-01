package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoragePageController {

	@GET
	@RequestMapping(value = "/storage")
	public String openStoragePage() {
		Map<String, Integer> materialMap = new HashMap<>();
		return "storage";
	}
}
