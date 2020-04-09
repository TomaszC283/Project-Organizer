package github.com.TomaszC283.ProjectOrganizer.orders;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "order_from_client")
public class OrderFromClient {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "message")
	@NotNull
	private String message;

	@Column(name = "amount")
	@NotNull
	private int amount;

	@Column(name = "offer_status")
	@NotNull
	private int offerStatus;

	@Column(name = "client_id")
	@NotNull
	private int client_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOfferStatus() {
		return offerStatus;
	}

	public void setOfferStatus(int offerStatus) {
		this.offerStatus = offerStatus;
	}

	public int getClient_id() {
		return client_id;
	}

	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}
}
