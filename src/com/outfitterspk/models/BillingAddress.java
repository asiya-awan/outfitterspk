package com.outfitterspk.models;

public class BillingAddress {

	private int id;
	private String firstName;
	private String lastName;
	private String address;
	private String city;
	private String region;
	private String country;
	private String postalCode;
	private String phone;
	private int customer_id;
	private int order_id;
	
	public BillingAddress(int id, String firstName, String lastName, String address, String city, String region,
			String country, String postalCode, String phone, int customer_id) {
	
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.customer_id = customer_id;
		
	}
	
	public BillingAddress(int id, String firstName, String lastName, String address, String city, String region,
			String country, String postalCode, String phone, int customer_id, int order_id) {
	
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.customer_id = customer_id;
		this.order_id=order_id;
	}
	
	public BillingAddress(String firstName, String lastName, String address, String city, String region,
			String country, String postalCode, String phone,int customer_id) {

		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.customer_id=customer_id;
	
	}
	
	
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "BillingAddress [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", address="
				+ address + ", city=" + city + ", region=" + region + ", country=" + country + ", postalCode="
				+ postalCode + ", phone=" + phone + "]";
	}
	
	
	
}
