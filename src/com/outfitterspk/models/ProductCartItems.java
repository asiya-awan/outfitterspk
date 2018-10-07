package com.outfitterspk.models;

public class ProductCartItems {

	private int cartItemId;
	private int productId;
	private int productVariantId;
	private String productName;
	private String picturesUrl;
	private String size;
	private String color;
	private float price;
	private int quantity;
	private float subtotal;
	
	
	
	public ProductCartItems(int cartItemId, int productId, int productVariantId, String productName,String picturesUrl, String size, String color, float price,
			int quantity, float subtotal) {
		
		this.cartItemId=cartItemId;
		this.productId = productId;
		this.productVariantId = productVariantId;
		this.productName = productName;
		this.picturesUrl=picturesUrl;
		this.size = size;
		this.color = color;
		this.price = price;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}
	
	
	
	@Override
	public String toString() {
		return "ProductCart [cartItemId=" +cartItemId + " , productId=" + productId + ", productVariantId=" + productVariantId + ", productName="
				+ productName + ", picturesUrl=" + picturesUrl +", size=" + size + ", color=" + color + ", price=" + price + ", quantity=" + quantity
				+ ", subtotal=" + subtotal + "]";
	}


	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}



	public String getPicturesUrl() {
		return picturesUrl;
	}



	public void setPicturesUrl(String picturesUrl) {
		this.picturesUrl = picturesUrl;
	}
	
	
}
