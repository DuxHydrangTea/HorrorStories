package com.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ConnectionDb.ConnectionDb;

public class Seri {
	private int idseri;
	private String title,abtract;
	private int idcategory;
	private String username,thumbnail,createdtime;
	public Seri(int idseri, String title, String abtract, int idcategory, String username, String thumbnail,
			String createdtime) {
		super();
		this.idseri = idseri;
		this.title = title;
		this.abtract = abtract;
		this.idcategory = idcategory;
		this.username = username;
		this.thumbnail = thumbnail;
		this.createdtime = createdtime;
	}
	public Seri(String title, String abtract, int idcategory, String username, String thumbnail,
			String createdtime) {
		super();
		this.title = title;
		this.abtract = abtract;
		this.idcategory = idcategory;
		this.username = username;
		this.thumbnail = thumbnail;
		this.createdtime = createdtime;
	}
	public Seri() {
		super();
	}
	public int getIdseri() {
		return idseri;
	}
	public void setIdseri(int idseri) {
		this.idseri = idseri;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAbtract() {
		return abtract;
	}
	public void setAbtract(String abtract) {
		this.abtract = abtract;
	}
	public int getIdcategory() {
		return idcategory;
	}
	public void setIdcategory(int idcategory) {
		this.idcategory = idcategory;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	@Override
	public String toString() {
		return "Seri [idseri=" + idseri + ", title=" + title + ", abtract=" + abtract + ", idcategory=" + idcategory
				+ ", username=" + username + ", thumbnail=" + thumbnail + ", createdtime=" + createdtime + "]";
	}
	
	
	public int getSumPart() {
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select idseri, COUNT(idseripart) AS numpart from view_full_seri GROUP BY idseri having idseri = ?");
			ps.setInt(1,this.idseri );
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
	
	
	public  String getNamebyID() {
		
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("select idseri, categoryname "
					+ "from seri sr INNER join category ct  on ct.idcategory = sr.idcategory   where idseri = ?");
			ps.setInt(1, this.idseri);
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
	

}
