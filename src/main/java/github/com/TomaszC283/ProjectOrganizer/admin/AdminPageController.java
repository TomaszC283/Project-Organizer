package github.com.TomaszC283.ProjectOrganizer.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import github.com.TomaszC283.ProjectOrganizer.user.User;

@Controller
public class AdminPageController {
	
	private static int ELEMENTS = 15;
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private MessageSource messageSource;

	@GET
	@RequestMapping(value = "/admin")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String openAdminMainPage() {
		return "admin/admin";
	}

	@GET
	@RequestMapping(value = "/admin/users/{page}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String openAdminAllUsersPage(@PathVariable("page") int page, Model model) {
		
		Page<User> pages = getAllUsersPageable(page - 1, false, null);
		int totalPages = pages.getTotalPages();
		int currentPage = pages.getNumber();
		List<User> userList = pages.getContent();
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage + 1);
		model.addAttribute("userList", userList);
		model.addAttribute("recordStartCounter", currentPage * ELEMENTS);
		return "admin/users";
	}

	@GET
	@RequestMapping(value = "/admin/users/edit/{id}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String getUserToEdit(@PathVariable("id") int id, Model model) {
		User user = new User();
		user = adminService.findUserById(id);
		Map<Integer, String> roleMap = new HashMap<Integer, String>();
		roleMap = prepareRoleMap();
		int rola = user.getRoles().iterator().next().getId();
		user.setNrRoli(rola);
		model.addAttribute("roleMap", roleMap);
		model.addAttribute("user", user);
		return "admin/useredit";
	}

	@POST
	@RequestMapping(value = "/admin/updateuser/{id}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String updateUser(@PathVariable("id") int id, User user) {
		int nrRoli = user.getNrRoli();
		adminService.updateUser(id, nrRoli);
		return "redirect:/admin/users/1";
	}

	@GET
	@RequestMapping(value = "/admin/users/search/{searchWord}/{page}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String openSearchUsersPage(@PathVariable("searchWord") String searchWord, 
			@PathVariable("page") int page, Model model) {
		Page<User> pages = getAllUsersPageable(page - 1, true, searchWord);
		int totalPages = pages.getTotalPages();
		int currentPage = pages.getNumber();
		List<User> userList = pages.getContent();
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage + 1);
		model.addAttribute("userList", userList);
		model.addAttribute("recordStartCounter", currentPage * ELEMENTS);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("userList", userList);
		return "admin/usersearch";
	}
	
	@DELETE
	@RequestMapping(value = "/admin/users/delete/{id}")
	@Secured(value = { "ROLE_ADMIN","ROLE_PRODUCTION_MANAGER","ROLE_FOREMAN" })
	public String deleteUser(@PathVariable("id") int id) {
		adminService.deleteUserById(id);
		return "redirect:/admin/users/1";
	}
	

	
	// Metody uzytkowe
	// Pobranie listy userów
	private Page<User> getAllUsersPageable(int page, boolean search, String param) {
		Page<User> pages;
		if (!search) {
			pages = adminService.findAll(PageRequest.of(page, ELEMENTS));
		} else {
			pages = adminService.findAllSearch(param, PageRequest.of(page, ELEMENTS));
		}
		for (User users : pages) {
			int numerRoli = users.getRoles().iterator().next().getId();
			users.setNrRoli(numerRoli);
		}
		return pages;
	}
	// przygotowanie mapy ról
	public Map<Integer, String> prepareRoleMap() {
		Locale locale = Locale.getDefault();
		Map<Integer, String> roleMap = new HashMap<Integer, String>();
		roleMap.put(1, messageSource.getMessage("word.admin", null, locale));
		roleMap.put(2, messageSource.getMessage("word.manager", null, locale));
		roleMap.put(3, messageSource.getMessage("word.foreman", null, locale));
		roleMap.put(4, messageSource.getMessage("word.constructor", null, locale));
		roleMap.put(5, messageSource.getMessage("word.technologist", null, locale));
		roleMap.put(6, messageSource.getMessage("word.storekeeper", null, locale));
		roleMap.put(7, messageSource.getMessage("word.punching", null, locale));
		roleMap.put(8, messageSource.getMessage("word.bending", null, locale));
		roleMap.put(9, messageSource.getMessage("word.welder", null, locale));
		roleMap.put(10, messageSource.getMessage("word.printer", null, locale));
		roleMap.put(11, messageSource.getMessage("word.fitter", null, locale));
		roleMap.put(12, messageSource.getMessage("word.quality", null, locale));
		roleMap.put(13, messageSource.getMessage("word.logistician", null, locale));
		roleMap.put(14, messageSource.getMessage("word.client", null, locale));
		return roleMap;
	}
}
