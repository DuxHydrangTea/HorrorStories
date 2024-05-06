package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Model.SavedSeri;

public class SavedSeriDAO {

	
	// make a new saved item when click in save button
	public static boolean saveSeri( String username, int idseri, String time) {
		boolean ch = false;
		Connection conn = ConnectionDb.connectionDb();
		try {
			boolean isVal = checkIsSaved(username,idseri);
			if(isVal == false) {
				PreparedStatement ps = conn.prepareStatement("insert into savedseri(idseri,username,savedtime) values (?,?,?)");
				ps.setInt(1,idseri);
				ps.setString(2, username);
				ps.setString(3, time);
				int x = ps.executeUpdate();
				if(x!=0) ch = true;
			}
			else {
				PreparedStatement ps = conn.prepareStatement("delete from savedseri where idseri = ? and username = ?");
				ps.setInt(1, idseri);
				ps.setString(2, username);
				int x = ps.executeUpdate();
				if(x!=0) ch = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ch;
	}
	// unsave
	public static boolean checkIsSaved(String username, int idseri) {
		boolean ch = false;
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from savedseri where idseri = ? and username = ?");
			ps.setInt(1, idseri);
			ps.setString(2, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) ch = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ch;
	}
	
	public static List<SavedSeri> getAllByUsername(String username){
		List<SavedSeri> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from savedseri where username = ? order by savedtime desc");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int idseri = rs.getInt("idseri");
				String savedtime = rs.getString("savedtime");
				SavedSeri ss = new SavedSeri(username,idseri,savedtime);
				list.add(ss);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}
