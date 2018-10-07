package com.outfitterspk.models;

import java.util.Date;

public class Order {
	private int id;
	private int customerId;
	private Date orderDate;
	private Date requiredDate;
	private Date shippedDate;
	private String shipVia;
	private int billingId;
	private float totalBill;
	private String orderStatus;
	
	
	

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Order(int id, int customerId, Date orderDate, Date requiredDate, Date shippedDate, String shipVia,
			int billingId, String orderStatus) {
	
		this.id = id;
		this.customerId = customerId;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.shippedDate = shippedDate;
		this.shipVia = shipVia;
		this.billingId = billingId;
		this.orderStatus=orderStatus;
	}

	public Order(int id, int customerId, Date orderDate, Date requiredDate, Date shippedDate, String shipVia,
			 String orderStatus) {
	
		this.id = id;
		this.customerId = customerId;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.shippedDate = shippedDate;
		this.shipVia = shipVia;
		
		this.orderStatus=orderStatus;
	}
	public Order( int customerId, Date orderDate, Date requiredDate, Date shippedDate, String shipVia,
			int billingId,String orderStatus) {
		
		
		this.customerId = customerId;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.shippedDate = shippedDate;
		this.shipVia = shipVia;
		this.billingId = billingId;
		this.orderStatus=orderStatus;
	
	}
	
	public Order( int customerId, Date orderDate, Date requiredDate, Date shippedDate, String shipVia,String orderStatus) {
		
		
		this.customerId = customerId;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.shippedDate = shippedDate;
		this.shipVia = shipVia;
		
		this.orderStatus=orderStatus;
	
	}
	
	
	public Order(int id, Date oShippedDate, String oOrderStatus) {

		this.id=id;
		this.shippedDate = oShippedDate;
		
		
		this.orderStatus=oOrderStatus;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", customerId=" + customerId + ", orderDate=" + orderDate + ", requiredDate="
				+ requiredDate + ", shippedDate=" + shippedDate + ", shipVia=" + shipVia + ", billingId=" + billingId
				+ ", totalBill=" + totalBill + ", orderStatus=" + orderStatus + "]";
	}

	public float getTotalBill() {
		return totalBill;
	}
	
	public void setTotalBill(float totalBill) {
		this.totalBill = totalBill;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id=id;
	}

	
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getRequiredDate() {
		return requiredDate;
	}

	public void setRequiredDate(Date requiredDate) {
		this.requiredDate = requiredDate;
	}

	public Date getShippedDate() {
		return shippedDate;
	}

	public void setShippedDate(Date shippedDate) {
		this.shippedDate = shippedDate;
	}

	public String getShipVia() {
		return shipVia;
	}

	public void setShipVia(String shipVia) {
		this.shipVia = shipVia;
	}

	public int getBillingId() {
		return billingId;
	}

	public void setBillingId(int billingId) {
		this.billingId = billingId;
	}

	
	
}
