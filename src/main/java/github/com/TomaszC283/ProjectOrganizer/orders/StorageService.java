package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

public interface StorageService {
	
	public Product findById(int id);
	public List<Product> findAll();
	public void updateProduct(int id, int amount);
	public void saveProduct(Product product);
	
}
