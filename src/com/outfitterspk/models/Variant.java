package com.outfitterspk.models;

public class Variant {

	private String size;
	private String color;
	
	
	
	public Variant(String size, String color) {
		super();
		this.size = size;
		this.color = color;
	}
	
	
	@Override
	public String toString() {
		return "Variant [sizes=" + size + ", colors=" + color + "]";
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
	
	
}
