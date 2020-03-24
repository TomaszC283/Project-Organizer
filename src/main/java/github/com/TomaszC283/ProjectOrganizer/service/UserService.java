package github.com.TomaszC283.ProjectOrganizer.service;

import github.com.TomaszC283.ProjectOrganizer.user.User;

public interface UserService {
    void save(User user);

	public User findUserByEmail(String email);
}
