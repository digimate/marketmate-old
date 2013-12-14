package com.digimate.marketmate.data;

import android.R.string;

public class Product {
	
	private String name;
	private String owner;
	private String rating;
	private int view;
	private int comment;
	private int price;
	private String photoUrl;
	public Product(String name, String owner, String rating, int view, int comment, int price, String photo)
	{
		this.setName(name);
		this.setOwner(owner);
		this.setRating(rating);
		this.setView(view);
		this.setComment(comment);
		this.setPrice(price);
		this.setPhotoUrl(photo);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	
}
