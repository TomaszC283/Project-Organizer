package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import github.com.TomaszC283.ProjectOrganizer.orders.Product;
import github.com.TomaszC283.ProjectOrganizer.orders.StorageService;

@SuppressWarnings("serial")
@Controller
public class StoragePageController extends HttpServlet {

	/*
	 * Second way to dependency injection is to create a constructor with all
	 * dependencies.
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
	@Secured(value = { "ROLE_ADMIN", "ROLE_PRODUCTION_MANAGER", "ROLE_FOREMAN" })
	public String openAllProductsPage(Model model) {

		List<Product> productList = storageService.findAll();
		model.addAttribute("productList", productList);
		model.addAttribute("Product", new Product());
		return "storage";
	}

	@POST
	@RequestMapping(value = "/addproduct")
	public String addProduct(Product product, BindingResult result, Model model, Locale locale,
			HttpServletRequest request) {

		Product p = new Product();
		model.addAttribute("Product", new Product());
		p.setDescription(request.getParameter("desc"));
		p.setAmount(Integer.parseInt(request.getParameter("amount")));

		storageService.saveProduct(product);
		List<Product> productList = storageService.findAll();
		model.addAttribute("productList", productList);

		return "storage";
	}
	
	@GET
	@RequestMapping(value = "/storage/subamount/{id}")
	public String substractTheAmountValue(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		
		Product p = new Product();
		p.setAmount_sub(Integer.parseInt(request.getParameter("amount_sub_" + id)));
		String amount_req = request.getParameter("amount_sub_" + id);
		System.out.println(amount_req);
		
		return null;
	}
}
