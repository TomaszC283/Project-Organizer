package github.com.TomaszC283.ProjectOrganizer.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("roleRepository")
public interface RoleRepository extends JpaRepository<Role, Integer>{
	
	public Role findByRole(String role);
}