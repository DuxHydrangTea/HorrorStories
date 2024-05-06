package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Function.Function;
import com.Model.User;

public class UserDAO {

	// true - ton tai -------- fasle - ko ton tai
	public static boolean existedUsername (String username) {
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("select * from user where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
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
	public static boolean signIn(String username, String password,String cPassword) {
		boolean checku = false;
		Connection cn = ConnectionDb.connectionDb();
		try {
			if(password.equals(cPassword)) {
				if(!existedUsername(username)) {
					PreparedStatement addUser = cn.prepareStatement("insert into user(username,password) values (?,?)");
					addUser.setString(1,username);
					addUser.setString(2, Function.getMD5(password));
					int x = addUser.executeUpdate();
					if(x!=0) {
						checku = true;
					}			
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return checku;
	}
	public static boolean addUser(User user) {
		Connection cn = ConnectionDb.connectionDb();
		try {
			if(!existedUsername(user.getUsername())) {
				PreparedStatement addUser = cn.prepareStatement("insert into user(username,password,fullname,isBanned,position,description) values (?,'c4ca4238a0b923820dcc509a6f75849b',?,0,3,?)");
				addUser.setString(1, user.getUsername());
				addUser.setString(2, user.getFullname());
				addUser.setString(3, user.getDescription());
				int x = addUser.executeUpdate();
				if(x!=0) {
					return true;
				}
				else {
					return false;
				}
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
	
	
	
	
	public static boolean userLogin(String u, String p) {
		String pass = Function.getMD5(p);
		Connection cn = ConnectionDb.connectionDb();
		PreparedStatement ps;
		try {
			ps = cn.prepareStatement("select * from user where username = ? and password = ?");
			ps.setString(1, u);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	public static boolean adminLogin(String u, String p) {
		String pass = Function.getMD5(p);
		Connection cn = ConnectionDb.connectionDb();
		PreparedStatement ps;
		try {
			ps = cn.prepareStatement("select * from user where username = ? and password = ? and (position = 1 or position = 2)");
			ps.setString(1, u);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	public static User getFirstUser(int id) {
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("select * from user where iduser = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String us = rs.getString("username");
				String fn = rs.getString("fullname");
				String pw = rs.getString("password");
				int pos = rs.getInt("position");
				String des = rs.getString("description");
				int ban = rs.getInt("isbanned");
				User u1 = new User(id, us, pw, fn, ban, pos, des);
				return u1;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public static User getUserByUsername(String username) {
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("select * from user where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("iduser");
				String us = rs.getString("username");
				String fn = rs.getString("fullname");
				String pw = rs.getString("password");
				int pos = rs.getInt("position");
				String des = rs.getString("description");
				int ban = rs.getInt("isbanned");
				User u1 = new User(id, us, pw, fn, ban, pos, des);
				return u1;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static List<User> getAllUser() {
		List<User> listUser = new ArrayList<User>();
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("select * from user limit 2");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("iduser");
				String us = rs.getString("username");
				String fn = rs.getString("fullname");
				String pw = rs.getString("password");
				int ban = rs.getInt("isbanned");
				int pos = rs.getInt("position");
				String des = rs.getString("description");
				User u1 = new User(id, us, pw, fn, ban, pos,des);
				listUser.add(u1);
			}
			return listUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listUser;
	}
	public static String getNamePosition(int p) {
		if(p ==1) {
			return "Lãnh Đạo";
		}
		else if(p == 2) {
			return "Nhân viên";
		}
		return "Người Dùng";
	}
	
	
	public static boolean updateUser(User u) {
		Connection cn = ConnectionDb.connectionDb();
		String query = "update user set fullname = ?,isbanned = ?, description = ? where iduser = ?";
		try {
			PreparedStatement ps = cn.prepareStatement(query);
			ps.setString(1, u.getFullname());
			ps.setInt(2,u.isIsbanned());
			ps.setString(3,u.getDescription());
			ps.setInt(4, u.getIduser());
			int x = ps.executeUpdate();
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
	
	public static boolean deleteUser(int iduser) {
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("delete from user where iduser = ?");
			ps.setInt(1, iduser);
			int x = ps.executeUpdate();
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
	
	public static boolean blockUserFunction(int iduser, int block) {
		int newBlock = 0;
		if(block == 0) {
			newBlock =1;
		}
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("update user set isbanned = ? where iduser = ?");
			ps.setInt(1, newBlock);
			ps.setInt(2, iduser);
			int x = ps.executeUpdate();
			if(x!=0) return true;
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	public static boolean changeInfo(String username, String fullname, String description) {
		boolean ch = false;
		Connection cn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = cn.prepareStatement("update user set fullname = ?, description = ? where username = ?");
			ps.setString(1,fullname);
			ps.setString(2, description);
			ps.setString(3, username);
			int x =ps.executeUpdate();
			if(x!=0) ch = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ch;
	}
	public static boolean changePassword (String username, String password, String newPassword) {
		boolean ch = false;
		Connection cn = ConnectionDb.connectionDb();
		// md5:passowrd -> kiem tra password theo username correct ? -> md5:newPassword -> update
		boolean userL = userLogin(username, password);
		if(userL) {
			String newPass = Function.getMD5(newPassword);
			try {
				PreparedStatement ps = cn.prepareStatement("update user set password = ? where username = ?");
				ps.setString(1, newPass);
				ps.setString(2, username);
				int x = ps.executeUpdate();
				if(x!=0) ch=true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return ch;
	}
}
