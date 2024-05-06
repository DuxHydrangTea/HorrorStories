package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Model.Seri;
import com.Model.ViewFullSeri;

public class ViewFullSeriDAO {
	public static List<ViewFullSeri> getAllFullSeri() {
		List<ViewFullSeri> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from view_full_seri");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ViewFullSeri s = new ViewFullSeri();
				s.setIdseri(rs.getInt("idseri"));
				s.setIdcategory(rs.getInt("idcategory"));
				s.setIdseripart(rs.getInt("idseripart"));
				s.setIndexpart(rs.getInt("indexpart"));
				s.setTitle(rs.getString("title"));
				s.setAbtract(rs.getString("abtract"));
				s.setCategoryname(rs.getString("categoryname"));
				s.setUsername(rs.getString("thumbnail"));
				s.setTimeseri(rs.getString("timeseri"));
				s.setFullname(rs.getString("fullname"));
				s.setContent(rs.getString("content"));
				s.setTimeseripart(rs.getString("timeseripart"));
				list.add(s);
				
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ViewFullSeri getPartSeri(int idseripart, int indexpart) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from view_full_seri where idseri = ? and indexpart = ?");
			ps.setInt(1, idseripart);
			ps.setInt(2, indexpart);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("idseri");
				int idcate = rs.getInt("idcategory");
				int idpart = rs.getInt("idseripart");
				int indpart = rs.getInt("indexpart");
				String tit = rs.getString("title");
				String ab = rs.getString("abtract");
				String catename = rs.getString("categoryname");
				String username = rs.getString("username");
				String thub = rs.getString("thumbnail");
				String timsr = rs.getString("timeseri");
				String fulln = rs.getString("fullname");
				String cont = rs.getString("content");
				String timesrp = rs.getString("timeseripart");
				ViewFullSeri vfs = new ViewFullSeri(id,idcate,idpart,indpart,tit,ab,catename,username,thub,timsr,fulln,cont,timesrp);
				return vfs;
				
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
