package github.com.TomaszC283.ProjectOrganizer.orders;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {

	@Id
	@Column(name = "product_id")
	private int id;

	@Column(name = "description")
	@NotNull
	private String description;

	@Column(name = "amount")
	@NotNull
	private int amount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
}
