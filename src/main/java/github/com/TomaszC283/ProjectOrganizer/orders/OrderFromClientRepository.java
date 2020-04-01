package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("orderFromClienteRepository")
public interface OrderFromClientRepository extends JpaRepository<OrderFromClient, Integer> {

		public OrderFromClient findById(int id);
	}