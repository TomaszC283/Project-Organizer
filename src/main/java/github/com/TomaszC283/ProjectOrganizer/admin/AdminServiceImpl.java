package github.com.TomaszC283.ProjectOrganizer.admin;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class AdminServiceImpl implements AdminService {

	private static final Logger LOG = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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

	
	public void saveAll(List<User> userList) {
		for (int i = 0; i < userList.size(); i++) {
            Role role = roleRepository.findByRole("ROLE_USER");
            userList.get(i).setRoles(new HashSet<Role>(Arrays.asList(role)));
			userList.get(i).setPassword(bCryptPasswordEncoder.encode(userList.get(i).getPassword()));
		}
		adminRepository.saveAll(userList);
	}

	@Override
	public void deleteUserById(int id) {
		LOG.debug("[WYWOŁANIE >>> AdminServiceImpl.deleteUserById > PARAMETR: " + id);
		LOG.debug("[WYWOŁANIE >>> AdminRepository.deleteUserFromUserRole > PARAMETR: " + id);
		adminRepository.deleteUserFromUserRole(id);
		LOG.debug("[WYWOŁANIE >>> AdminRepository.deleteUserFromUser > PARAMETR: " + id);
		adminRepository.deleteUserFromUser(id);
	}

}
