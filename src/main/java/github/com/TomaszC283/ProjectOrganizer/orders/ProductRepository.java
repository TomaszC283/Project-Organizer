package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Modifying
	@Query(value = "UPDATE Products p SET p.amount = :amount WHERE p.product_id= :id", nativeQuery = true)
	void updateProductAmount(@Param("amount") int amount, @Param("id") int id);
	
	public Product findById(int id);
}