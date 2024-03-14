package com.servlet;
/**
 * Servlet implementation class UploadPhotosServlet
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.PhotosDao;
import com.db.DBConnect;
import com.entity.User;
@WebServlet("/uploadphotos")
@MultipartConfig
public class UploadPhotosServlet extends HttpServlet {

	   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		   int userid=Integer.parseInt(req.getParameter("userid"));
   		     Part p =req .getPart("files");
	    	 String fileName=p.getSubmittedFileName();
	    	
	    	 String remark= req.getParameter("remark");
	    	
		   
		   HttpSession session= req.getSession();
			if (remark != null && !remark.equals("") && fileName != null && !fileName.equals("")) {
			  
	    	try {
	    		    		
	    		User u=new User(); 
	    		u.setId(userid);
	    		u.setDescription(remark);
	    		u.setImage(fileName);
	    	
	    		PhotosDao dao=new PhotosDao(DBConnect.getConn());
	    		
	    		boolean f= dao.uploadphotos(u);
	    		    		
	    		
	    		if (f) {
	    			
	    			 String path= getServletContext().getRealPath("")+"userimg";
					 File file =new File(path);
					 p.write(path+File.separator+fileName);	
					 
					session.setAttribute("succMsg", "Post uploaded Successfully..");
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("succMsg", "Error: Problem in Server Side..");
					resp.sendRedirect("photosUploads.jsp");
				}
	    	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else {
				session.setAttribute("succMsg", "Error: form All fields required..");
				resp.sendRedirect("photosUploads.jsp");
			}
	    	
	    }
	}

