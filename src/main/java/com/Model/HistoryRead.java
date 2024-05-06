package com.Model;

public class HistoryRead {
	private int idhistory, idseri, indexpart;
	private String username, historytime;
	
	public HistoryRead(int idhistory, int idseri, int indexpart, String username, String historytime) {
		super();
		this.idhistory = idhistory;
		this.idseri = idseri;
		this.indexpart = indexpart;
		this.username = username;
		this.historytime = historytime;
	}
	
	public HistoryRead(int idseri, int indexpart, String username, String historytime) {
		super();
		this.idseri = idseri;
		this.indexpart = indexpart;
		this.username = username;
		this.historytime = historytime;
	}

	public int getIdhistory() {
		return idhistory;
	}
	public void setIdhistory(int idhistory) {
		this.idhistory = idhistory;
	}
	public int getIdseri() {
		return idseri;
	}
	public void setIdseri(int idseri) {
		this.idseri = idseri;
	}
	public int getIndexpart() {
		return indexpart;
	}
	public void setIndexpart(int indexpart) {
		this.indexpart = indexpart;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHistorytime() {
		return historytime;
	}
	public void setHistorytime(String historytime) {
		this.historytime = historytime;
	}
	
}
