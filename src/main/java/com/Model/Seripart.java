package com.Model;

public class Seripart {
	private int idseripart, idseri,indexpart;
	private String content;
	private String createddate, description;
	public Seripart(int idseripart, int idseri, int indexpart, String content, String createddate, String description) {
		super();
		this.idseripart = idseripart;
		this.idseri = idseri;
		this.indexpart = indexpart;
		this.content = content;
		this.createddate = createddate;
		this.description = description;
	}
	public Seripart( int idseri, int indexpart, String content, String createddate, String description) {
		super();
		this.idseri = idseri;
		this.indexpart = indexpart;
		this.content = content;
		this.createddate = createddate;
		this.description = description;
	}
	public Seripart() {
		super();
	}
	public int getIdseripart() {
		return idseripart;
	}
	public void setIdseripart(int idseripart) {
		this.idseripart = idseripart;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Seripart [idseripart=" + idseripart + ", idseri=" + idseri + ", indexpart=" + indexpart + ", content=" + content
				+ ", createddate=" + createddate + "]";
	}
	
}
