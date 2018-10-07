package com.outfitterspk.models;

import java.util.Date;

public class OrderSummary {

	private String SKU;
	private String product;
	private String color;
	private String size;
	private float price;
	private int quantity;
	private Date orderDate;
	private Date shippedDate;
	private String orderStatus;
	
	
	public OrderSummary(String sKU, String product,  float price,String color, String size, int quantity,
			Date orderDate, Date shippedDate, String orderStatus) {
	
		SKU = sKU;
		this.product = product;
		this.price = price;
		this.color = color;
		this.size = size;
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.shippedDate = shippedDate;
		this.orderStatus = orderStatus;
	}
	
	
	@Override
	public String toString() {
		return "OrderSummary [SKU=" + SKU + ", product=" + product + ", color=" + color + ", size=" + size + ", price="
				+ price + ", quantity=" + quantity + ", orderDate=" + orderDate + ", shippedDate=" + shippedDate
				+ ", orderStatus=" + orderStatus + "]";
	}


	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Date getShippedDate() {
		return shippedDate;
	}
	public void setShippedDate(Date shippedDate) {
		this.shippedDate = shippedDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getSKU() {
		return SKU;
	}
	public void setSKU(String sKU) {
		SKU = sKU;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
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
	
	
	
}
