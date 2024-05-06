package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Model.Seri;
import com.Model.Seripart;

public class SeriDAO {
	
	public static List<Seri> get4Seri(){
		List<Seri> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seri limit 4");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("idseri");
				String tit = rs.getString("title");
				String ab = rs.getString("abtract");
				int idc = rs.getInt("idcategory");
				String us = rs.getString("username");
				String thum = rs.getString("thumbnail");
				String date = rs.getString("createdtime");
				Seri s = new Seri(id,tit,ab,idc,us,thum,date);
				list.add(s);
				
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	public static Seri getSeriById(int id){
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seri where idseri = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int ids = rs.getInt("idseri");
				String tit = rs.getString("title");
				String ab = rs.getString("abtract");
				int idc = rs.getInt("idcategory");
				String us = rs.getString("username");
				String thum = rs.getString("thumbnail");
				String date = rs.getString("createdtime");
				Seri s = new Seri(ids,tit,ab,idc,us,thum,date);
				return s;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	public static List<Seri> getRandomSeri(){
		List<Seri> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from seri order by rand() limit 2");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("idseri");
				String tit = rs.getString("title");
				String ab = rs.getString("abtract");
				int idc = rs.getInt("idcategory");
				String us = rs.getString("username");
				String thum = rs.getString("thumbnail");
				String date = rs.getString("createdtime");
				Seri s = new Seri(id,tit,ab,idc,us,thum,date);
				list.add(s);
				
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
		public static List<Seri> getAllSeri(){
			List<Seri> list = new ArrayList<>();
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("select * from seri");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					int id = rs.getInt("idseri");
					String tit = rs.getString("title");
					String ab = rs.getString("abtract");
					int idc = rs.getInt("idcategory");
					String us = rs.getString("username");
					String thum = rs.getString("thumbnail");
					String date = rs.getString("createdtime");
					Seri s = new Seri(id,tit,ab,idc,us,thum,date);
					list.add(s);
					
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
		public static List<Seri> getAllSeri(String username){
			List<Seri> list = new ArrayList<>();
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("select * from seri where username = ?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					int id = rs.getInt("idseri");
					String tit = rs.getString("title");
					String ab = rs.getString("abtract");
					int idc = rs.getInt("idcategory");
					String us = rs.getString("username");
					String thum = rs.getString("thumbnail");
					String date = rs.getString("createdtime");
					Seri s = new Seri(id,tit,ab,idc,us,thum,date);
					list.add(s);
					
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
		public static boolean addSeri(Seri str) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("insert into seri(title, abtract, idcategory, username, thumbnail, createdtime) values (?,?,?,?,?,?)");
				ps.setString(1, str.getTitle());
				ps.setString(2, str.getAbtract());
				ps.setInt(3,str.getIdcategory());
				ps.setString(4,str.getUsername());
				ps.setString(5,str.getThumbnail());
				ps.setString(6,str.getCreatedtime());
				int checkAdd = ps.executeUpdate();
				if(checkAdd != 0) {
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
		public static List<Seri> searchSeri(String search){
			List<Seri> list = new ArrayList<>();
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM seri where title like '%"+ search +"%'");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					int idsr = rs.getInt("idseri");
					String title = rs.getString("title");
					String ab = rs.getString("abtract");
					int idc = rs.getInt("idcategory");
					String us = rs.getString("username");
					String thumb = rs.getString("thumbnail");
					String createdtime = rs.getString("createdtime");

					Seri sp = new Seri(idsr,title,ab,idc,us,thumb,createdtime);
					list.add(sp);
					
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		public static List<Seri> seriByCate(int cate){
			List<Seri> list = new ArrayList<>();
			Connection conn = ConnectionDb.connectionDb();
			if(cate != 0 ) {
				try {
					PreparedStatement ps = conn.prepareStatement("SELECT * FROM seri where idcategory = ?");
					ps.setInt(1, cate);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						int idsr = rs.getInt("idseri");
						String title = rs.getString("title");
						String ab = rs.getString("abtract");
						int idc = rs.getInt("idcategory");
						String us = rs.getString("username");
						String thumb = rs.getString("thumbnail");
						String createdtime = rs.getString("createdtime");

						Seri sp = new Seri(idsr,title,ab,idc,us,thumb,createdtime);
						list.add(sp);
						
					}
					return list;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				try {
					PreparedStatement ps = conn.prepareStatement("SELECT * FROM seri");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						int idsr = rs.getInt("idseri");
						String title = rs.getString("title");
						String ab = rs.getString("abtract");
						int idc = rs.getInt("idcategory");
						String us = rs.getString("username");
						String thumb = rs.getString("thumbnail");
						String createdtime = rs.getString("createdtime");

						Seri sp = new Seri(idsr,title,ab,idc,us,thumb,createdtime);
						list.add(sp);
						
					}
					return list;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return list;
		}
		
		public static int getSumPart(int idseri) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("select idseri, COUNT(idseripart) AS numpart from view_full_seri GROUP BY idseri having idseri = ?" );
				ps.setInt(1, idseri);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					return rs.getInt("numpart");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
		}
		public static int makeNewPart(int idseri) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("select idseri, COUNT(idseripart) AS numpart from view_full_seri GROUP BY idseri having idseri = ?");
				ps.setInt(1, idseri);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					return rs.getInt("numpart")+1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 1;
		}
		
		public static boolean updateSeri (int id, String title, String abtract, String thumbnail) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("update seri set title = ?, abtract = ? , thumbnail = ? where idseri = ?");
				ps.setString(1, title);
				ps.setString(2, abtract);
				ps.setString(3, thumbnail);
				ps.setInt(4, id);
				int x = ps.executeUpdate();
				if(x!= 0) {
					return true;
				}
				return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		public static boolean updateSerinoThumb (int id, String title, String abtract) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("update seri set title = ?, abtract = ?  where idseri = ?");
				ps.setString(1, title);
				ps.setString(2, abtract);
				ps.setInt(3, id);
				int x = ps.executeUpdate();
				if(x!= 0) {
					return true;
				}
				return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		public static boolean deleteSeriWithPart(int id) {
			Connection conn = ConnectionDb.connectionDb();
			try {
				PreparedStatement ps = conn.prepareStatement("delete seri, seripart from seri left join seripart on seri.idseri = seripart.idseri where seri.idseri = ?");
				ps.setInt(1, id);
				int x = ps.executeUpdate();
				if(x!=0) {
					return true;
				}
				else {
					return false;
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			
			return false;
		}
}
