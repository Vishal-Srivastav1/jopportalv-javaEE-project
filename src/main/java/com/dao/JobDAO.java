package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class JobDAO {
	private Connection conn;

	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addJobs(Jobs j) {
		boolean f = false;
		try {
			String sql = "insert into job(title,description,category,status,location,pdate)values(?,?,?,?,?,?)";
			
		    
			   java.util.Date d2 = null;
			      if (d2==null) 
			    	 d2=new java.util.Date();  
					      long ld=d2.getTime();
					      java.sql.Date sqlDate= new java.sql.Date(ld);
					     // System.out.println(sqlDate);
				
					
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
            ps.setDate(6,sqlDate);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		}
		catch (SQLException se) {
			se.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;

		try {
			String sql1 = "select * from job order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			
				while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				
				java.sql.Date d3=rs.getDate(7);
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
	
	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;

		try {
			String sql1 = "select * from job where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			
				while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				
				java.sql.Date d3=rs.getDate(7);
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
	
	
	
	
	
	public Jobs getJobById(int id) {
		Jobs j = null;

		try {
			String sql2 = "select * from job where id=?";
			PreparedStatement ps = conn.prepareStatement(sql2);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
				while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				
				java.sql.Date d3=rs.getDate(7);
				SimpleDateFormat ds1= new SimpleDateFormat("dd-MM-yyyy");
				String st3=ds1.format(d3);			
				j.setPdate(st3);
				
               
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

	public boolean updateJob(Jobs j) {
		boolean f = false;
		try {
			String sql3 = "update job set title=?,description=?,category=?,status=?,location=?,pdate=? where id=?";
			
		    
			   java.util.Date d2 = new java.util.Date();  
			      long ld=d2.getTime();
			      java.sql.Date sqlDate= new java.sql.Date(ld);
			     // System.out.println(sqlDate);
			PreparedStatement ps = conn.prepareStatement(sql3);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
            ps.setDate(6,sqlDate);
            ps.setInt(7, j.getId());
			int i = ps.executeUpdate();
			//System.out.println(i);
			if (i == 1) {
				f = true;
			}

		}
		catch (SQLException se) {
			se.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	public boolean deleteJob(int id) {
		boolean f = false;  
	
	try {
		String dql4="delete from job where id=?";
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
	
	public List<Jobs> getJobLocORCate(String category,String location) {
		
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;

		try {
			String sql1 = "select * from job where category=? or location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				
				java.sql.Date d3=rs.getDate(7);
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
	
public List<Jobs> getJobLocANDCate(String category,String location) {
		
		List<Jobs> list = new ArrayList<>();
		Jobs j = null;

		try {
			String sql1 = "select * from job where category=? and location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql1);
			ps.setString(1, category);
			ps.setString(2, location);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				
				java.sql.Date d3=rs.getDate(7);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


