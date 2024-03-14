package com.dao;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.entity.Jobs;
import com.entity.User;

public class PhotosDao {

	private Connection conn;

	public PhotosDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean uploadphotos(User u) {
		boolean f=false;
		try {
			String sql="insert into photos (description,image,pdate,userid) values(?,?,?,?)";
			
			 java.util.Date d2 = null;
		      if (d2==null) 
		    	 d2=new java.util.Date();  
				      long ld=d2.getTime();
				      java.sql.Date sqlDate= new java.sql.Date(ld);
		
		PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getDescription());
		    ps.setString(2, u.getImage());
		     ps.setDate(3,sqlDate);
		     ps.setInt(4, u.getId());
			
			
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<User> getAllPhotos(int id) {
		List<User> list = new ArrayList<>();
		User u = null;

		try {
			String sql1 = "select * from photos where userid=? order by imageId desc";
			
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
				while (rs.next()) {
				u = new User();
				u.setImageId(rs.getInt(1));
				u.setDescription(rs.getString(2));
			  
				u.setImage(rs.getString("image"));
				
				java.sql.Date d3=rs.getDate(4);
				SimpleDateFormat ds1= new SimpleDateFormat("dd-MM-yyyy");
				String st3=ds1.format(d3);	
				
				u.setPdate(st3);
				u.setId(rs.getInt(5));
				list.add(u);
               
			}
				
		} catch (SQLException se) {
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public boolean updatephotos(User u) {
		boolean f=false;
		try {
			String sql="update photos set description=?,image=?,pdate=? where imageId=?";
			
			 java.util.Date d2 = null;
		      if (d2==null) 
		    	 d2=new java.util.Date();  
				      long ld=d2.getTime();
				      java.sql.Date sqlDate= new java.sql.Date(ld);
	
			
		PreparedStatement ps=conn.prepareStatement(sql);
		    
			ps.setString(1, u.getDescription());
			ps.setString(2, u.getImage());		
			 ps.setDate(3,sqlDate);
			 ps.setInt(4, u.getImageId());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public boolean deletepost(int id) {
		boolean f = false;  
	
	try {
		String dql4=" delete from photos where imageId=?";
		PreparedStatement ps=conn.prepareStatement(dql4);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		
		if (i == 1) {
			f = true;
		}

		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
	
	}
	
	public User getphotoId(int id) {
		User u = null;

		try {
			String sql2 = "select * from photos where imageId=?";
			PreparedStatement ps = conn.prepareStatement(sql2);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
				while (rs.next()) {
				u = new User();
				u.setImageId(rs.getInt(1));
				u.setDescription(rs.getString(2));
				u.setImage(rs.getString(3));	
				

				
				java.sql.Date d3=rs.getDate(4);
				SimpleDateFormat ds1= new SimpleDateFormat("dd-MM-yyyy");
				String st3=ds1.format(d3);			
				u.setPdate(st3);
				
               
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	
}
