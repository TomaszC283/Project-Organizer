package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("ordersRepository")
public interface OrdersRepository extends JpaRepository<Orders, Integer>{
	
	public OrdersRepository findById(int id);
	public List<Orders> findAll();
}