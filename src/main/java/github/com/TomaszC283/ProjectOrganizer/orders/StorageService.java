package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

public interface StorageService {
	
	public Product findById(int id);
	List<Product> findAll();
	void updateProduct(int id, int amount);
	
}
