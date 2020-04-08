package github.com.TomaszC283.ProjectOrganizer.orders;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE project_organizer.products SET amount = :amount WHERE product_id= :id", nativeQuery = true)
	void updateProductAmount(@Param("amount") int amount, @Param("id") int id);
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM project_organizer.products WHERE product_id= :id", nativeQuery = true)
	void deleteUserById(@Param("id") int id);
	
	@Query(value = "SELECT amount FROM project_organizer.products WHERE product_id= :product_id", nativeQuery = true)
	int getAmountById(@Param("product_id") int id);
	
	public Product findById(int id);
}