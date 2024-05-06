package com.Model;

public class ViewFullSeri {
		private int idseri, idcategory, idseripart, indexpart;
		private String title, abtract, categoryname, username,thumbnail, timeseri, fullname, content, timeseripart;
		public ViewFullSeri(int idseri, int idcategory, int idseripart, int indexpart, String title, String abtract,
				String categoryname, String username, String thumbnail, String timeseri, String fullname,
				String content, String timeseripart) {
			super();
			this.idseri = idseri;
			this.idcategory = idcategory;
			this.idseripart = idseripart;
			this.indexpart = indexpart;
			this.title = title;
			this.abtract = abtract;
			this.categoryname = categoryname;
			this.username = username;
			this.thumbnail = thumbnail;
			this.timeseri = timeseri;
			this.fullname = fullname;
			this.content = content;
			this.timeseripart = timeseripart;
		}
		
		public ViewFullSeri() {
			super();
		}

		public int getIdseri() {
			return idseri;
		}

		public void setIdseri(int idseri) {
			this.idseri = idseri;
		}

		public int getIdcategory() {
			return idcategory;
		}

		public void setIdcategory(int idcategory) {
			this.idcategory = idcategory;
		}

		public int getIdseripart() {
			return idseripart;
		}

		public void setIdseripart(int idseripart) {
			this.idseripart = idseripart;
		}

		public int getIndexpart() {
			return indexpart;
		}

		public void setIndexpart(int indexpart) {
			this.indexpart = indexpart;
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

		public String getCategoryname() {
			return categoryname;
		}

		public void setCategoryname(String categoryname) {
			this.categoryname = categoryname;
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

		public String getTimeseri() {
			return timeseri;
		}

		public void setTimeseri(String timeseri) {
			this.timeseri = timeseri;
		}

		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getTimeseripart() {
			return timeseripart;
		}

		public void setTimeseripart(String timeseripart) {
			this.timeseripart = timeseripart;
		}

		@Override
		public String toString() {
			return "ViewFullSeri [idseri=" + idseri + ", idcategory=" + idcategory + ", idseripart=" + idseripart
					+ ", indexpart=" + indexpart + ", title=" + title + ", abtract=" + abtract + ", categoryname="
					+ categoryname + ", username=" + username + ", thumbnail=" + thumbnail + ", timeseri=" + timeseri
					+ ", fullname=" + fullname + ", content=" + content + ", timeseripart=" + timeseripart + "]";
		}
		
}
