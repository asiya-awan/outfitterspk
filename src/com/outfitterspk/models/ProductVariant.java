package com.outfitterspk.models;

public class ProductVariant {
	private int id;
	private String size;
	private String color;
	private int quantity;
	private int product_id;
	
	public ProductVariant(String size, String color, int quantity, int product_id) {

		this.size = size;
		this.color = color;
		this.quantity = quantity;
		this.product_id = product_id;
	}
	public ProductVariant(int id, String size, String color, int quantity, int product_id) {

		this.id = id;
		this.size = size;
		this.color = color;
		this.quantity = quantity;
		this.product_id = product_id;
	}
	
	@Override
	public String toString() {
		return "ProductVariant [id=" + id + ", size=" + size + ", color=" + color + ", quantity=" + quantity
				+ ", product_id=" + product_id + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	
}
