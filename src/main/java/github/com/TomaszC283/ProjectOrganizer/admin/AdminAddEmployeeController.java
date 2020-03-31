package github.com.TomaszC283.ProjectOrganizer.admin;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import github.com.TomaszC283.ProjectOrganizer.user.User;
import github.com.TomaszC283.ProjectOrganizer.user.UserService;
import github.com.TomaszC283.ProjectOrganizer.validators.UserRegisterValidator;

@SuppressWarnings("serial")
@Controller
public class AdminAddEmployeeController extends HttpServlet {

	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MessageSource messageSource;
	
	@GET
	@RequestMapping(value = "/admin/addemployee")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String addEmployeeForm(Model model) {
		User u = new User();
		model.addAttribute("user", u);
		return "admin/addemployee";
	}
	@POST
	@RequestMapping(value = "/admin/saveemployee")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String addEmployeeAction(User user, BindingResult result, Model model, Locale locale, HttpServletRequest request) {
				
		String returnPage = null;
		
		User userExist = userService.findUserByEmail(user.getEmail());
	
		new UserRegisterValidator().validateEmailExist(userExist, result);
		
		new UserRegisterValidator().validate(user, result);

		if (result.hasErrors()) {
			returnPage = "admin/addemployee";
		} else {
			adminService.saveEmployee(user, request.getParameter("role_employee"));
			model.addAttribute("message", messageSource.getMessage("user.register.success.email", null, locale));
			model.addAttribute("user", new User());
			returnPage = "admin/addemployee";
		}
		
		return returnPage;
	}
}
