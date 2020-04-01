package github.com.TomaszC283.ProjectOrganizer.orders;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface StorageService {
	
	public Product findById(int id);
	Page<Product> findAll(Pageable pageable);
	void updateProduct(int id, int amount);
	
}
