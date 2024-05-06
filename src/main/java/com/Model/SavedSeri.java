package com.Model;

public class SavedSeri {
	private int idsavedseri;
	private String username;
	private int idseri;
	private String savedtime;
	public SavedSeri(int idsavedseri, String username, int idseri, String savedtime) {
		super();
		this.idsavedseri = idsavedseri;
		this.username = username;
		this.idseri = idseri;
		this.savedtime = savedtime;
	}
	public SavedSeri( String username, int idseri, String savedtime) {
		super();
		this.username = username;
		this.idseri = idseri;
		this.savedtime = savedtime;
	}
	public int getIdsavedseri() {
		return idsavedseri;
	}
	public void setIdsavedseri(int idsavedseri) {
		this.idsavedseri = idsavedseri;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getIdseri() {
		return idseri;
	}
	public void setIdseri(int idseri) {
		this.idseri = idseri;
	}
	public String getSavedtime() {
		return savedtime;
	}
	public void setSavedtime(String savedtime) {
		this.savedtime = savedtime;
	}
	
}
