package com.servlet;
/**
 * Servlet implementation class UpdatePhotosServlet
 */
import java.io.File;
import java.io.IOException;

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

@WebServlet("/upphotos")
@MultipartConfig
public class UpdatePhotosServlet extends HttpServlet {
    
	   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   
		   int id= Integer.parseInt(req.getParameter("imageid"));
   		      Part p =req .getPart("files");
	    	String fileName=p.getSubmittedFileName();
	    	
	    	String remark= req.getParameter("remark");
	    	
		   
		   HttpSession session= req.getSession();
			if (remark != null && !remark.equals("") && fileName != null && !fileName.equals("")) {
			
			try {
			
	    		User u=new User();  
	    		u.setImageId(id);
	    		u.setDescription(remark);
	    		u.setImage(fileName);
	    	
	    
	    		PhotosDao dao=new PhotosDao(DBConnect.getConn());
	    		
	    		boolean f= dao.updatephotos(u);
	    		    		
	    		
	    		if (f) {
	    			
	    			 String path= getServletContext().getRealPath("")+"userimg";
					 File file =new File(path);
					 p.write(path+File.separator+fileName);	
					 
					session.setAttribute("succMsg", "Post Edited Successfully..");
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("succMsg", "Error: Problem in Server Side..");
					resp.sendRedirect("Edit_photos.jsp");
				}
	    	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else {
				session.setAttribute("succMsg", "Error: All fields required..");
				resp.sendRedirect("Edit_photos.jsp");
			}
	    	
	}
}
