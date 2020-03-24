package github.com.TomaszC283.ProjectOrganizer.service;

import github.com.TomaszC283.ProjectOrganizer.user.User;
import github.com.TomaszC283.ProjectOrganizer.repository.RoleRepository;
import github.com.TomaszC283.ProjectOrganizer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
}
