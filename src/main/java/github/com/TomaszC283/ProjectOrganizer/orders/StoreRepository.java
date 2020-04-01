package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("storeRepositoryRepository")
public interface StoreRepository extends JpaRepository<Store, Integer> {

		public Store findById(int id);
	}
