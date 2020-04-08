package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("storeRepository")
public interface StoreRepository extends JpaRepository<Store, Integer> {

		public Store findById(int id);
		public List<Store> findAll();
	}
