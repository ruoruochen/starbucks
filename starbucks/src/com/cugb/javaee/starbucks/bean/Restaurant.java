package com.cugb.javaee.starbucks.bean;

public class Restaurant {
	public int restaurantid;
	public String restaurantname;
	
	public String getRestaurantname() {
		return restaurantname;
	}
	public void setRestaurantname(String res) {
		this.restaurantname = res;
	}
	
	public int getRestaurantid() {
		return restaurantid;
	}
	public void setRestaurantid(int id) {
		this.restaurantid = id;
	}
}
