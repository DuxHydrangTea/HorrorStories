package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Model.Seripart;

public class SeripartDAO {
	public static Seripart getByIDvsPart(int idseri, int index) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seripart where idseri = ? and indexpart = ? ");
			ps.setInt(1, idseri);
			ps.setInt(2, index);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int ids = rs.getInt("idseripart");
				int idsr = rs.getInt("idseri");
				int ind = rs.getInt("indexpart");
				String ct = rs.getString("content");
				String cdate = rs.getString("createddate");
				String des = rs.getString("description");
				Seripart sp = new Seripart(ids,idsr,ind,ct,cdate, des);
				return sp;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public static Seripart getByIDSeriPart(int idseripart) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seripart where idseripart = ?  ");
			ps.setInt(1, idseripart);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int ids = rs.getInt("idseripart");
				int idsr = rs.getInt("idseri");
				int ind = rs.getInt("indexpart");
				String ct = rs.getString("content");
				String cdate = rs.getString("createddate");
				String des = rs.getString("description");
				Seripart sp = new Seripart(ids,idsr,ind,ct,cdate, des);
				return sp;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public static List<Seripart> getPartBySeri(int idseri){
		List<Seripart> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seripart where idseri = ?");
			ps.setInt(1, idseri);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int ids = rs.getInt("idseripart");
				int idsr = rs.getInt("idseri");
				int ind = rs.getInt("indexpart");
				String ct = rs.getString("content");
				String cdate = rs.getString("createddate");
				String des = rs.getString("description");
				Seripart sp = new Seripart(ids,idsr,ind,ct,cdate,des);
				list.add(sp);	
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static String selectedPart(int idpart, int idpage) {
		if(idpart == idpage) {
			return "selectedPart";
		}
		else {
			return "";
		}
	}
	
	public static boolean addSeriPart(Seripart sr) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into seripart(idseri,indexpart,content,createddate,description)values (?,?,?,?,?)");
			ps.setInt(1, sr.getIdseri());
			ps.setInt(2, sr.getIndexpart());
			ps.setString(3, sr.getContent());
			ps.setString(4, sr.getCreateddate());
			ps.setString(5, sr.getDescription());
			int insertCheck = ps.executeUpdate();
			if(insertCheck != 0) {
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
	public static boolean updateSeriPart(Seripart sp) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("update seripart set indexpart = ?, description = ?, content = ? where idseripart = ?");
			ps.setInt(1, sp.getIndexpart());
			ps.setString(2, sp.getDescription());
			ps.setString(3, sp.getContent());
			ps.setInt(4, sp.getIdseripart());
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
	public static boolean deleteSeriPart(int idseripart) {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("delete from seripart where idseripart = ?");
			ps.setInt(1, idseripart);
			int x=  ps.executeUpdate();
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
}
