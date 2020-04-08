package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("orderFromClienteRepository")
public interface OrderFromClientRepository extends JpaRepository<OrderFromClient, Integer> {

		public OrderFromClient findById(int id);
		public List<OrderFromClient> findAll();
		
	}