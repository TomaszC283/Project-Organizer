package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DELETE;
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
import github.com.TomaszC283.ProjectOrganizer.orders.ProductRepository;
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

	@Autowired
	private ProductRepository productRepository;

	private String subError;
	private String addError;

	@GET
	@RequestMapping(value = "/storage")
	@Secured(value = { "ROLE_ADMIN", "ROLE_PRODUCTION_MANAGER", "ROLE_FOREMAN" })
	public String openAllProductsPage(Model model) {

		makeProductList(model);

		addError = "";
		subError = "";
		model.addAttribute("subError", subError);
		model.addAttribute("addError", addError);
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

		if (p.getAmount() < 0) {
			addError = "Amount can't be less than 0 !";
			subError = "";
			model.addAttribute("addError", addError);
			model.addAttribute("subError", subError);
			makeProductList(model);
			return "storage";
		}
		
		addError = "Product successly added";
		subError = "";
		model.addAttribute("subError", subError);
		model.addAttribute("addError", addError);
		
		storageService.saveProduct(product);
		makeProductList(model);
		return "storage";
	}

	@POST
	@RequestMapping(value = "/storage/subamount/{id}")
	public String substractTheAmountValue(@PathVariable("id") int id, Product product, Model model) {

		int amount_by_id = productRepository.getAmountById(id);

		if (Integer.parseInt(product.getAmount_sub()) < 0) {
			subError = "Amount of the product can't be less than 0 !";
			addError = "";
			model.addAttribute("subError", subError);
			model.addAttribute("addError", addError);
			
			makeProductList(model);
			return "storage";
		} else {
			int new_amount = amount_by_id - (Integer.parseInt(product.getAmount_sub()));
			if (new_amount < 0) {
				subError = "Amount of the product can't be less than 0 !";
				addError = "";
				model.addAttribute("subError", subError);
				model.addAttribute("addError", addError);
				makeProductList(model);
				return "storage";
				
			} else {
				productRepository.updateProductAmount(new_amount, id);
			}
		}
		
		addError = "";
		subError = "";
		model.addAttribute("subError", "Product successly updated");
		model.addAttribute("addError", addError);
		
		makeProductList(model);
		return "storage";
	}
	
	@DELETE
	@RequestMapping(value = "storage/delete/{id}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String deleteProduct(@PathVariable("id") int id, Model model) {
		productRepository.deleteUserById(id);
		
		addError = "";
		subError = "";
		model.addAttribute("subError", "Product successly deleted");
		model.addAttribute("addError", addError);
		
		makeProductList(model);
		return "storage";
	}
	
	private void makeProductList(Model model) {
		model.addAttribute("Product", new Product());
		List<Product> productList = storageService.findAll();
		model.addAttribute("productList", productList);
	}
}
