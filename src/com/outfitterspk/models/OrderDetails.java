package com.outfitterspk.models;

public class OrderDetails {

	private int id;
	private int orderId;
	private int productId;
	private int productVariantId;
	private float price;
	private int quantity;
	
	
	public OrderDetails(int id, int orderId, int productId, int productVariantId, float price, int quantity) {
		
		this.id = id;
		this.orderId = orderId;
		this.productId = productId;
		this.productVariantId = productVariantId;
		this.price = price;
		this.quantity = quantity;
	}

	public OrderDetails( int orderId, int productId, int productVariantId, float price, int quantity) {

		this.orderId = orderId;
		this.productId = productId;
		this.productVariantId = productVariantId;
		this.price = price;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductVariantId() {
		return productVariantId;
	}

	public void setProductVariantId(int productVariantId) {
		this.productVariantId = productVariantId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetails [id=" + id + ", orderId=" + orderId + ", productId=" + productId + ", productVariantId="
				+ productVariantId + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	
	
}
