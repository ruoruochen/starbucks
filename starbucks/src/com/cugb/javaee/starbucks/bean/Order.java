package com.cugb.javaee.starbucks.bean;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.OrderItem;

public class Order {
	public String orderid;
	public String username;
	public Timestamp time;
	public int count;
	private float totalPrice;
	private String payStatus; //Ö§¸¶×´Ì¬
	public String address;
	public String tel;
	public String restaurantname;
	private ArrayList<OrderItem> items;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void updateCount() {
		this.count = 0;
		ArrayList<OrderItem> items = this.getItems();
		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			this.count += item.getCount();
		}
	}
	public float getTotalprice() {
		return totalPrice;
	}
	public void setTotalprice(float totalprice) {
		this.totalPrice = totalprice;
	}
	public void updateTotalPrice() {
		this.totalPrice = 0.0F;
		ArrayList<OrderItem> items = this.getItems();
		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			this.totalPrice += item.getCount() * item.getFinalprice();
		}
	}
	public String getPaystatus() {
		return payStatus;
	}
	public void setPaystatus(String paystatus) {
		this.payStatus = paystatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getRestaurantname() {
		return restaurantname;
	}
	public void setRestaurantname(String restaurantname) {
		this.restaurantname = restaurantname;
	}
	public ArrayList<OrderItem> getItems() {
		return items;
	}
	public void setItems(ArrayList<OrderItem> items) {
		this.items = items;
	}
}
