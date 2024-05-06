package com.ConnectionDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDb {
	public static Connection connectionDb() {
		Connection Cd = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Cd = DriverManager.getConnection("jdbc:mysql://localhost:3306/webtruyenma", "root", "ngocdung181");
			return Cd;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Cd;

	}
}
