package com.outfitterspk.models;

public class Customer {

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String cpassword;
	private String address;
	private String city;
	private String region;
	private String country;
	private String postalCode;
	private String phone;
	private boolean useAddressAsBillingAddress;
	private boolean isCustomer;
	
	
	
	public Customer(String firstName, String lastName, String email, String cpassword, boolean isCustomer) {
		
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.cpassword = cpassword;
		this.isCustomer = isCustomer;
	}



	public Customer( String firstName, String lastName, String email, String cpassword, String address,
			String city, String region, String country, String postalCode, String phone, boolean useAddressAsBillingAddress,
			boolean isCustomer) {
		
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.cpassword = cpassword;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
		this.isCustomer = isCustomer;
	}
	
	public Customer(int id, String firstName, String lastName, String email, String cpassword, String address,
			String city, String region, String country, String postalCode, String phone, boolean useAddressAsBillingAddress,
			boolean isCustomer) {
		
		this.id=id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.cpassword = cpassword;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
		this.isCustomer = isCustomer;
	}
	
	public Customer( String firstName, String lastName, String email, String address,
			String city, String region, String country, String postalCode, String phone, boolean useAddressAsBillingAddress,
			boolean isCustomer) {
		
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
		this.isCustomer = isCustomer;
	}
	
	public Customer(String address, String city, String region, String country, String postalCode, String phone) {
		
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
	}

	


	public Customer(String email, String address, String city, String region, String country, String postalCode, String phone,
			boolean useAddressAsBillingAddress, boolean isCustomer) {
		
		this.email=email;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
		this.isCustomer = isCustomer;
	}

	


	public Customer(int id, String firstName, String lastName, String email, String address, String city, String region,
			String country, String postalCode, String phone, boolean useAddressAsBillingAddress, boolean isCustomer) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.region = region;
		this.country = country;
		this.postalCode = postalCode;
		this.phone = phone;
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
		this.isCustomer = isCustomer;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
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
	public boolean isUseSameBillingAddress() {
		return useAddressAsBillingAddress;
	}
	public void setUseSameBillingAddress(boolean useAddressAsBillingAddress) {
		this.useAddressAsBillingAddress = useAddressAsBillingAddress;
	}
	public boolean isCustomer() {
		return isCustomer;
	}
	public void setCustomer(boolean isCustomer) {
		this.isCustomer = isCustomer;
	}
	
	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", cpassword=" + cpassword + ", address=" + address + ", city=" + city + ", region=" + region
				+ ", country=" + country + ", postalCode=" + postalCode + ", phone=" + phone
				+ ", useAddressAsBillingAddress=" + useAddressAsBillingAddress + ", isCustomer=" + isCustomer + "]";
	}
	
	
	
}
