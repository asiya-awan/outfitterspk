package com.outfitterspk.models;

import java.util.ArrayList;
import java.util.List;

public class ProductUtil {

	public static List<Product> getProducts(){
		//create an empty list
		List<Product> products =new ArrayList<>();
		
		//add sample data
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt"
				,"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",34.0f));
	
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt",
				"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",44.0f));
		
		
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt",
				"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",64.0f));
		
		
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt"
				,"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",34.0f));
	
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt",
				"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",44.0f));
		
		
		products.add(new Product("Suzy Shier Plaid Button-Front Shirt with 2 Pockets",
				"relaxed chalet vibe anywhere you go in this classic plaid button-front shirt",
				"https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584",64.0f));
		
		//return the list
		
		return products;
	}
}
