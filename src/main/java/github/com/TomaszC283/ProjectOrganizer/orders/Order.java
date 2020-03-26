package github.com.TomaszC283.ProjectOrganizer.orders;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import github.com.TomaszC283.ProjectOrganizer.user.User;

@Entity
@Table(name = "Orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_id")
	private int id;

	@Id
	@Column(name = "order_id")
	private int product_id;

	@Column(name = "description")
	@NotNull
	private String description;

	@Id
	@Column(name = "responsible")
	@NotNull
	private int responsible;

	@Id
	@Column(name = "status")
	@NotNull
	private int status;

	@Column(name = "dateoforder")
	@NotNull
	private String dateOfOrder;

	@Column(name = "deadline")
	@NotNull
	private String deadline;

	@Column(name = "material")
	@NotNull
	private String material;

	@Column(name = "amount")
	@NotNull
	private int amount;

	@Column(name = "price")
	@NotNull
	private int price;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "orderstatus", joinColumns = @JoinColumn(name = "status_id"), inverseJoinColumns = @JoinColumn(name = "description"))
	private Set<Status> statusDesc;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "user", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "email"))
	private Set<User> responsibleUser;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "products", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "description"))
	private Set<Product> products;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getResponsible() {
		return responsible;
	}

	public void setResponsible(int responsible) {
		this.responsible = responsible;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
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

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
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

	public Set<Status> getStatusDesc() {
		return statusDesc;
	}

	public void setStatusDesc(Set<Status> statusDesc) {
		this.statusDesc = statusDesc;
	}

	public Set<User> getResponsibleUser() {
		return responsibleUser;
	}

	public void setResponsibleUser(Set<User> responsibleUser) {
		this.responsibleUser = responsibleUser;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
