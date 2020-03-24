package github.com.TomaszC283.ProjectOrganizer.repository;

import github.com.TomaszC283.ProjectOrganizer.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}