package github.com.TomaszC283.ProjectOrganizer.Controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import github.com.TomaszC283.ProjectOrganizer.orders.Orders;
import github.com.TomaszC283.ProjectOrganizer.orders.OrdersRepository;
import github.com.TomaszC283.ProjectOrganizer.orders.Product;
import github.com.TomaszC283.ProjectOrganizer.orders.ProductRepository;
import github.com.TomaszC283.ProjectOrganizer.orders.Status;
import github.com.TomaszC283.ProjectOrganizer.orders.StatusRepository;
import github.com.TomaszC283.ProjectOrganizer.user.User;
import github.com.TomaszC283.ProjectOrganizer.user.UserRepository;

@Controller
public class OrderPageController {

	@Autowired
	OrdersRepository ordersRepository;
	
	@Autowired
	StatusRepository statusRepository;
	
	@Autowired
	OrderFromClientRepository orderFromClientRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@GET
	@RequestMapping(value="/workingpanel")
	public String showWorkingPanel(Model model, OrderFromClient clientOrder, Orders staffOrder, Status status) {
		
		getListOfOrders(model, clientOrder, staffOrder, status);
		
		List<User> userList = userRepository.findAll();
		model.addAttribute("userList", userList);
		
		return "workingpanel";
	}
	
	@GET
	@RequestMapping(value="/orderhistory")
	public String showOrderHistory() {
		return "orderhistory";
	}
	
	@POST
	@RequestMapping(value="/workingpanel/move/{id}")
	public String orderMoveForward(@PathVariable("id") int id, Model model, OrderFromClient clientOrder, Orders staffOrder, Status status, User user) {
		
		Orders moveOrder = ordersRepository.findById(id);
		moveOrder.setStatus(moveOrder.getStatus() + 1);
		ordersRepository.save(moveOrder);
		
		getListOfOrders(model, clientOrder, staffOrder, status);
		
		List<User> userList = userRepository.findAll();
		model.addAttribute("userList", userList);
		
		return "workingpanel";
	}
	@POST
	@RequestMapping(value="/workingpanel/apply/{id}")
	public String showApplyingClientOrder(@PathVariable("id") int id, Model model, OrderFromClient clientOrder, Orders staffOrder, Status status, User user)	{
		
			
		OrderFromClient order = new OrderFromClient();
		order = orderFromClientRepository.findById(id);
		model.addAttribute("order", order);
		
		getListOfOrders(model, null, null, status);
		model.addAttribute("staffOrder", new Orders());
		
		List<User> userList = userRepository.findAll();
		model.addAttribute("userList", userList);
		
		List<Product> productList = productRepository.findAll();
		model.addAttribute("productList", productList);
		
		return "applyorder";
	}
	
	@POST
	@RequestMapping(value="/workingpanel/apply")
	public String ApplyingClientOrder(Model model, OrderFromClient clientOrder, Orders staffOrder, Status status, User user)	{
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		
		String dateNow = dateFormat.format(date);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE,  14);
		date = cal.getTime();
		
		String DateDeadline = dateFormat.format(date);
		
		staffOrder.setDateOfOrder(dateNow);
		staffOrder.setDeadline(DateDeadline);
		staffOrder.setStatus(2);
		
		OrderFromClient ClientOrder = orderFromClientRepository.findById(staffOrder.getClient_id());
		ClientOrder.setOfferStatus(1);
		orderFromClientRepository.save(ClientOrder);
		
		ordersRepository.save(staffOrder);
			
		getListOfOrders(model, clientOrder, staffOrder, status);
		
		return "workingpanel";
	}
	
	public void getListOfOrders(Model model, OrderFromClient clientOrder, Orders staffOrder, Status status) {
		
		model.addAttribute("clientOrder", new OrderFromClient());
		model.addAttribute("staffOrder", new Orders());
		model.addAttribute("Status", new Status());
		
		List<OrderFromClient> clientOrderList = orderFromClientRepository.findAll();
		model.addAttribute("clientOrderList", clientOrderList);
		
		List<Orders> staffOrderList = ordersRepository.findAll();
		model.addAttribute("staffOrderList", staffOrderList);
		
		List<Status> statusList = statusRepository.findAll();
		model.addAttribute("statusList", statusList);
	}

	
}
