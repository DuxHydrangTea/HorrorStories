package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ConnectionDb.ConnectionDb;
import com.Function.Function;
import com.Model.Comment;

public class CommentDAO {
	public static boolean addComment(Comment cmt) {
	 
		int id = cmt.getIdseri();
		String cmter = cmt.getUsername();
		String cmtext = cmt.getCommenttext();
		String cmttime = cmt.getCommentedtime();
		//Comment newCmt = new Comment(idcmt,idp,cmter,cmtext,cmttime);
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into comment (idseri,username,commenttext,commentedtime) values (?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, cmter);
			ps.setString(3, cmtext);
			ps.setString(4, cmttime);
			int updated = ps.executeUpdate();
			if(updated == 1) {
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
	
	
	public static List<Comment> getCommentByID(int idseri){
		List<Comment> list = new ArrayList<>();
		Connection conn = ConnectionDb.connectionDb();
		try {
			PreparedStatement ps = conn.prepareStatement(" select * from comment where idseri = " + idseri);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int idcmt = rs.getInt(1);
				int idstr = rs.getInt(2);
				String cmter = rs.getString(3);
				String cmttext = rs.getString(4);
				String cmttime = rs.getString(5);
				Comment newcmt = new Comment(idcmt,idstr,cmter,cmttext,cmttime);
				list.add(newcmt);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
