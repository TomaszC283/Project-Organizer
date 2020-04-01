package github.com.TomaszC283.ProjectOrganizer.orders;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import github.com.TomaszC283.ProjectOrganizer.user.User;

@Entity
@Table(name = "Orders")
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_id")
	private int id;

	@Column(name = "description")
	@NotNull
	private String description;

	@ManyToOne
	@JoinColumn(name = "user", referencedColumnName = "user_id")
	@NotNull
	private User responsible;

	@ManyToOne
	@JoinColumn(name = "orderstatus", referencedColumnName = "status_id")
	@NotNull
	private Status status;

	@Column(name = "dateoforder")
	@NotNull
	private String dateOfOrder;

	@Column(name = "deadline")
	@NotNull
	private String deadline;

	@ManyToOne
	@JoinColumn(name = "products", referencedColumnName = "product_id")
	@NotNull
	private Product product_id;

	@Column(name = "amount")
	@NotNull
	private int amount;

	@Column(name = "price")
	@NotNull
	private int price;
	
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

	public User getResponsible() {
		return responsible;
	}

	public void setResponsible(User responsible) {
		this.responsible = responsible;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getDateOfOrder() {
		return dateOfOrder;
	}

	public void setDateOfOrder(String dateOfOrder) {
		this.dateOfOrder = dateOfOrder;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public Product getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
