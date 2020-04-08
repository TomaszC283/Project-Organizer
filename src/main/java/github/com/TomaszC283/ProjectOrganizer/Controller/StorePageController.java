package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import github.com.TomaszC283.ProjectOrganizer.orders.OrderFromClient;
import github.com.TomaszC283.ProjectOrganizer.orders.OrderFromClientRepository;
import github.com.TomaszC283.ProjectOrganizer.orders.Store;
import github.com.TomaszC283.ProjectOrganizer.orders.StoreRepository;

@Controller
public class StorePageController {

	@Autowired
	StoreRepository storeRepository;
	
	@Autowired
	OrderFromClientRepository orderFromClientRepository;
	
	@GET
	@RequestMapping(value = "/store")
	public String showStorePage(Model model) {
		
		model.addAttribute("Store", new Store());
		List<Store> storeList = storeRepository.findAll();
		model.addAttribute("storeList", storeList);
		
		return "store";
	}
	
	@GET
	@RequestMapping(value = "/store/{id}")
	public String showUserProfilePage(@PathVariable("id") int id, Model model) {	
		Store store = storeRepository.findById(id);
			model.addAttribute("store", store);
			OrderFromClient order = new OrderFromClient();
			model.addAttribute("ClientOrder", order);
		return "store_offer";
	}
	
	@POST
	@RequestMapping(value = "/store/sendoffer")
	public String sendOffer(Model model, OrderFromClient order) {
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		
		order.setOfferStatus(0);
		order.setMessage(date + " Message from client : " + order.getMessage());
		orderFromClientRepository.save(order);
		return "store";
	}
}
