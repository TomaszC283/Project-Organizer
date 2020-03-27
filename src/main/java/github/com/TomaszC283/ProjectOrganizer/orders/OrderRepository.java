package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("orderRepository")
public interface OrderRepository extends JpaRepository<Order, Integer>{
	
	public OrderRepository findById(int id);
}