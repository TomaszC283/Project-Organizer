package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productsRepository")
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	public ProductRepository findByProductId(int id);
}