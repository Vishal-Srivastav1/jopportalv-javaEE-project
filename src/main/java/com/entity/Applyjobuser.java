package com.entity;

public class Applyjobuser {
	
	private int id;
	private int userid;
	private String name;
	private String qua;
	private String email;
	private String state;
	private String dist;
	private String photo;
	private String resume;
	private String pdate;
	
	
	public Applyjobuser() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Applyjobuser( int userid, String name, String qua, String email, String state, String dist, String photo,
			String resume) {
		super();
		
		this.userid = userid;
		this.name = name;
		this.qua = qua;
		this.email = email;
		this.state = state;
		this.dist = dist;
		this.photo = photo;
		this.resume = resume;
		
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQua() {
		return qua;
	}

	public void setQua(String qua) {
		this.qua = qua;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getDist() {
		return dist;
	}
	
	public void setDist(String dist) {
		this.dist = dist;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getResume() {
		return resume;
	}
	
	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	
	
	
	

}
