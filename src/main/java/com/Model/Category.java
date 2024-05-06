package com.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.lang.Object;

import com.ConnectionDb.ConnectionDb;

public class Category {
	private int idcategory;
	private String categoryname;
	private String description;
	public Category(int idcategory, String categoryname, String description) {
		super();
		this.idcategory = idcategory;
		this.categoryname = categoryname;
		this.description = description;
	}
	public Category() {
		super();
	}
	public int getIdcategory() {
		return idcategory;
	}
	public void setIdcategory(int idcategory) {
		this.idcategory = idcategory;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Category [idcategory=" + idcategory + ", categoryname=" + categoryname + ", description=" + description
				+ "]";
	}
	
	
}
