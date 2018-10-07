package com.outfitterspk.models;

public class Product {

	private int id;
	private String productName;
	private String description;
	private String specs;
	private int category_id;
	private int subcategory_id;
	private int SKU;
	private String picturesUrl;
	private float price;
	
	//variant
	private String color;
	private String size;
	private int quantity;
	
	public Product() {}

	public Product(String productName, String description, String pictures, float price) {
		
		this.productName = productName;
		this.description = description;
		this.picturesUrl = pictures;
		this.price = price;
	}	              

	public Product(String productName, String description, String specs, int category_id, int subcategory_id, int sKU,
			String picturesUrl, float price) {
		this.productName = productName;
		this.description = description;
		this.specs = specs;
		this.category_id = category_id;
		this.subcategory_id = subcategory_id;
		this.SKU = sKU;
		this.picturesUrl = picturesUrl;
		this.price = price;
	}



	public Product(int id, String productName, String description, String specs, int category_id, int subcategory_id,
			int sKU, String picturesUrl, float price) {

		this.id = id;
		this.productName = productName;
		this.description = description;
		this.specs = specs;
		this.category_id = category_id;
		this.subcategory_id = subcategory_id;
		this.SKU = sKU;
		this.picturesUrl = picturesUrl;
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSpecs() {
		return specs;
	}


	public void setSpecs(String specs) {
		this.specs = specs;
	}


	public int getCategory_id() {
		return category_id;
	}


	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}


	public int getSubcategory_id() {
		return subcategory_id;
	}


	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}


	public int getSKU() {
		return SKU;
	}


	public void setSKU(int sKU) {
		SKU = sKU;
	}


	public String getPicturesUrl() {
		return picturesUrl;
	}


	public void setPicturesUrl(String picturesUrl) {
		this.picturesUrl = picturesUrl;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", description=" + description + ", specs="
				+ specs + ", category_id=" + category_id + ", subcateogry_id=" + subcategory_id + ", SKU=" + SKU
				+ ", picturesUrl=" + picturesUrl + ", price=" + price + "]";
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
}
