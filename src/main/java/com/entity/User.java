package com.entity;

public class User {
   //User                                    
     private int id;                
     private String name;           
     private String email;  
     private String qualification;
     private String password;       
     private String role;
     private String description;
     private String image; 
     private int imageId; 
     private String pdate;
     
     
	public User(String name, String qualification, String email, String password,  String role) {
		
		this.name = name;
		this.qualification = qualification;
		this.email = email;
		this.password = password;
		this.role = role;
	}

	

	public User(int imageId,String description, String image,String pdate) {
		super();
		this.setImageId(imageId);
		this.description = description;
		this.image = image;
		this.pdate=pdate;
	}



	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int id, String name, String email, String qualification, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.qualification = qualification;
		this.password = password;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}           

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
                              
	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}


}












