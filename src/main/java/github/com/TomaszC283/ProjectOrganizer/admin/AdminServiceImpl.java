package github.com.TomaszC283.ProjectOrganizer.admin;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import github.com.TomaszC283.ProjectOrganizer.user.Role;
import github.com.TomaszC283.ProjectOrganizer.user.RoleRepository;
import github.com.TomaszC283.ProjectOrganizer.user.User;

@Service("adminService")
@Transactional
public class AdminServiceImpl extends HttpServlet implements AdminService {

	
	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private RoleRepository roleRepository;


	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	String role_employee;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		setRole_employee(request.getParameter("role_employee"));
	}


	public void setRole_employee(String role_employee) {
		this.role_employee = role_employee;
	}
	
	public String getRole_employee() {
		return role_employee;
	}
	
	@Override
	public Page<User> findAll(Pageable pageable) {
		Page<User> userList = adminRepository.findAll(pageable);
		return userList;
	}

	@Override
	public User findUserById(int id) {
		User user = adminRepository.findUserById(id);
		return user;
	}

	@Override
	public void updateUser(int id, int nrRoli) {
		adminRepository.updateRoleUser(nrRoli, id);
	}

	@Override
	public Page<User> findAllSearch(String param, Pageable pageable) {
		Page<User> userList = adminRepository.findAllSearch(param, pageable);
		return userList;
	}

	@Override
	public void deleteUserById(int id) {
		adminRepository.deleteUserFromUserRole(id);
		adminRepository.deleteUserFromUser(id);
	}

	@Override
	public void saveEmployee(User user, String role_request) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		Role role = roleRepository.findByRole(role_request);
		user.setRoles(new HashSet<Role>(Arrays.asList(role)));
		adminRepository.save(user);
	}

}
