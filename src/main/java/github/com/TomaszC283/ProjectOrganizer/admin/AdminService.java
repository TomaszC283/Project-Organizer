package github.com.TomaszC283.ProjectOrganizer.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import github.com.TomaszC283.ProjectOrganizer.user.User;

public interface AdminService {
	
	Page<User> findAll(Pageable pageable);
	User findUserById(int id);
	void updateUser(int id, int nrRoli);
	Page<User> findAllSearch(String param, Pageable pageable);
	void saveAll(List<User> userList);
	void deleteUserById(int id);
}
