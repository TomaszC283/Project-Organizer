package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("ordersRepository")
public interface OrdersRepository extends JpaRepository<Orders, Integer>{
	
	public OrdersRepository findById(int id);
}