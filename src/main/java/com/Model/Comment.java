package com.Model;

public class Comment {
	private int idcomment;
	private int idseri;
	private String username;
	private String commenttext;
	private String commentedtime;
	public Comment(int idcomment, int idseri, String username, String commenttext, String commentedtime) {
		super();
		this.idcomment = idcomment;
		this.idseri = idseri;
		this.username = username;
		this.commenttext = commenttext;
		this.commentedtime = commentedtime;
	}
	public Comment(int idseri, String username, String commenttext, String commentedtime) {
		super();
		this.idseri = idseri;
		this.username = username;
		this.commenttext = commenttext;
		this.commentedtime = commentedtime;
	}
	public int getIdcomment() {
		return idcomment;
	}
	public void setIdcomment(int idcomment) {
		this.idcomment = idcomment;
	}
	public int getIdseri() {
		return idseri;
	}
	public void setIdseri(int idseri) {
		this.idseri = idseri;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCommenttext() {
		return commenttext;
	}
	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}
	public String getCommentedtime() {
		return commentedtime;
	}
	public void setCommentedtime(String commentedtime) {
		this.commentedtime = commentedtime;
	}
	@Override
	public String toString() {
		return "Comment [idcomment=" + idcomment + ", idseri=" + idseri + ", username=" + username
				+ ", commenttext=" + commenttext + ", commentedtime=" + commentedtime + "]";
	}
	
}
