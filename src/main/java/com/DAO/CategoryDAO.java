package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Model.Category;

public class CategoryDAO {
	public static List<Category> getAllCategory() {
		List<Category> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from category");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int idcate = rs.getInt(1);
				String catename = rs.getString(2);
				String des = rs.getString(3);
				Category ct = new Category(idcate,catename,des);
				list.add(ct);
				
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

	}
	
	
	
	
	public static String getNamebyID(int id) {
		
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from category where idcategory = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String catename = rs.getString("categoryname");
				return catename;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	public static Category getCateByID(int id) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from category where idcategory = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int idc = rs.getInt("idcategory");
				String name = rs.getString("categoryname");
				String de = rs.getString("description");
				Category ct = new Category(idc,name,de);
				return ct;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;


	}
	
	public static boolean updateCategory(Category c) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("update category set categoryname = ?, description = ? where idcategory = ?");
			ps.setString(1, c.getCategoryname());
			ps.setString(2, c.getDescription());
			ps.setInt(3,c.getIdcategory());
			int x = ps.executeUpdate();
			if(x!=0) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;


	}
	
	public static boolean deleteCategory(int id) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("delete from category where idcategory = ?");
			ps.setInt(1, id);
			int rs = ps.executeUpdate();
			if(rs != 0) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	public static boolean addCategory(Category c) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into category(categoryname,description) values(?,?)");
			ps.setString(1, c.getCategoryname());
			ps.setString(2, c.getDescription());
			int x =ps.executeUpdate();
			if(x!=0) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
