package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.entity.Applyjobuser;
import com.entity.Jobs;

public class ApplyDao {
	private Connection conn;

	public ApplyDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean applyforjob(Applyjobuser a) {
		boolean f=false;
		try {
			String sql="insert into applyjob (userid,name,qualification,email,state,dist,photo,resume,pdate) values(?,?,?,?,?,?,?,?,?)";
			   
			PreparedStatement ps=conn.prepareStatement(sql);
			  java.util.Date d2 = null;
		      if (d2==null) 
		    	 d2=new java.util.Date();  
				      long ld=d2.getTime();
				      java.sql.Date sqlDate= new java.sql.Date(ld);
				     // System.out.println(sqlDate);
				      //int userid =Integer.parseInt("userid");
			
				      
			ps.setInt(1, a.getUserid());
			ps.setString(2, a.getName());
			ps.setString(3, a.getQua());
			ps.setString(4, a.getEmail());
			ps.setString(5, a.getState());
			ps.setString(6, a.getDist());
			ps.setString(7, a.getPhoto());
			ps.setString(8, a.getResume());
			  ps.setDate(9,sqlDate);
			
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	public List<Applyjobuser> applygetUserformDetails(int id) {
		List<Applyjobuser> list= new ArrayList<>();
		Applyjobuser j = null;

		try {
			String sql2 = "select * from applyjob where userid=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql2);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();                                                         
			                                                                                          
				while (rs.next()) {                                                                          
				j = new Applyjobuser(); 
				j.setId(rs.getInt(1));
				j.setUserid(rs.getInt(2));
				j.setName(rs.getString(3));                                                                  
				j.setQua(rs.getString(4));                                                                 
				j.setEmail(rs.getString(5));                                                               
				j.setState(rs.getString(6));                                                                 
				j.setDist(rs.getString(7)) ;                                                                 
				j.setPhoto(rs.getString(8));                                                                 
				j.setResume(rs.getString(9));                                                                
				                                                                                             
				java.sql.Date d3=rs.getDate(10);
				SimpleDateFormat ds1= new SimpleDateFormat("dd-MM-yyyy");
				String st3=ds1.format(d3);			
				j.setPdate(st3);
				list.add(j);
		   
			}
		
		} catch (SQLException se) {
			se.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	public List<Applyjobuser> AllEmployeeDetails() {
		List<Applyjobuser> list = new ArrayList<>();
		Applyjobuser j = null;

		try {
			String sql1 = "select * from applyjob order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {                                                                          
				j = new Applyjobuser(); 
				j.setId(rs.getInt(1));
				j.setUserid(rs.getInt(2));
				j.setName(rs.getString(3));                                                                  
				j.setQua(rs.getString(4));                                                                 
				j.setEmail(rs.getString(5));                                                               
				j.setState(rs.getString(6));                                                                 
				j.setDist(rs.getString(7)) ;                                                                 
				j.setPhoto(rs.getString(8));                                                                 
				j.setResume(rs.getString(9));                                                                
				                                                                                             
				java.sql.Date d3=rs.getDate(10);
				SimpleDateFormat ds1= new SimpleDateFormat("dd-MM-yyyy");
				String st3=ds1.format(d3);			
				j.setPdate(st3);
				list.add(j);
		   
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
