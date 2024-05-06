package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Function.Function;
import com.Model.History;
import com.Model.HistoryRead;

public class HistoryReadDAO {
	public static boolean makeHistory(int idseri, int indexpart, String username, String time) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into historyread(idseri, indexpart,username,historytime) values (?,?,?,?)" );
			ps.setInt(1,idseri);
			ps.setInt(2, indexpart);
			ps.setString(3, username);
			ps.setString(4, time);
			int x = ps.executeUpdate();
			if(x!=0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static List<HistoryRead> getHistory(String username, int days){
		List<HistoryRead> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from historyread where username = ? order by historytime desc " );
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String historytime = rs.getString("historytime");
				if(Function.getDayofDiffTime(historytime) == days ) {
					int idseri = rs.getInt("idseri");
					int indexpart = rs.getInt("indexpart");
					HistoryRead hr = new HistoryRead(idseri, indexpart, username, historytime);
					list.add(hr);
				}
				
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}
