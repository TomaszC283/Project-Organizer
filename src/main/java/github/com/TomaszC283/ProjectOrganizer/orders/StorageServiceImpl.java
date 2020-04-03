package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("storageService")
@Transactional
public class StorageServiceImpl implements StorageService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Product findById(int id) {
		Product product = productRepository.findById(id);
		return product;
	}

	@Override
	public List<Product> findAll() {
		List<Product> productList = productRepository.findAll();
		return productList;
	}

	@Override
	public void updateProduct(int id, int amount) {
		productRepository.updateProductAmount(amount, id);
	}

	@Override
	public void saveProduct(Product product) {
		productRepository.save(product);
	}
}
