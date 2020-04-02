package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.util.List;

import javax.ws.rs.GET;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import github.com.TomaszC283.ProjectOrganizer.orders.Product;
import github.com.TomaszC283.ProjectOrganizer.orders.StorageService;

@Controller
public class StoragePageController {

	/*
	 * Second way to dependency injection is to create a constructor with all dependencies.
	 * 
	 * private final StorageService storageService;
	 * 
	 * public StoragePageController(StorageService storageService) {
	 * this.storageService = storageService; }
	 */
	
	@Autowired
	private StorageService storageService;
	
	@GET
	@RequestMapping(value = "/storage")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String openAllProductsPage(Model model) {
		
		List<Product> productList = storageService.findAll();
		model.addAttribute("productList", productList);
		return "storage";
	}

}
