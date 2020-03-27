package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("statusRepository")
public interface StatusRepository extends JpaRepository<Status, Integer>{
	
	public StatusRepository findById(int id);
}
