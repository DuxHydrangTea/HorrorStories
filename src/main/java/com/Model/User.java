package com.Model;
import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;
public class User {
	private int iduser;
	private String username;
	private String password;
	private String fullname;
	private int isbanned;
	private int position;
	private String description;

	public User(int iduser, String username, String password, String fullname, int isbanned) {
		super();
		this.iduser = iduser;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.isbanned = isbanned;
	}
	public User() {
		super();
	}


	public User(int iduser, String username, String password, String fullname, int isbanned, int position,
			String description) {
		super();
		this.iduser = iduser;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.isbanned = isbanned;
		this.position = position;
		this.description = description;
	}

	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIduser() {
		return iduser;
	}

	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public int isIsbanned() {
		return isbanned;
	}

	public void setIsbanned(int isbanned) {
		this.isbanned = isbanned;
	}

	@Override
	public String toString() {
		return "User [iduser=" + iduser + ", username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", biBanchua=" + isbanned + "]";
	}

}
