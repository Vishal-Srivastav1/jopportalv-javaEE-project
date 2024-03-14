package com.servlet;
/**
 * Servlet implementation class Profile_UpdateServlet
 */
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Jobs;
import com.entity.User;

@WebServlet("/update_profile")
public class Profile_UpdateServlet extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	   
		int id=Integer.parseInt(req.getParameter("id"));
    	String name=req.getParameter("name");
		String qua=req.getParameter("qua");
		String email=req.getParameter("email");
		
		
		HttpSession session= req.getSession();
		if (name != null && !name.equals("") && qua != null && !qua.equals("")
				&& email != null && !email.equals("")) {
		try {
    	    	
        		UserDao dao=new UserDao(DBConnect.getConn());
        	  
        		User u=new User();
	       		u.setId(id);
	       		u.setName(name);
	       		u.setQualification(qua);
	       		u.setEmail(email);
	       		
	     	
        		boolean f= dao.updateUser(u);
        		if (f) {
    				session.setAttribute("succMsg", "profile Updated Successfully ! Login Again...");
    				resp.sendRedirect("index.jsp");
    			}else {
    				session.setAttribute("succMsg", "Error: Problem in Server Side..");
    				resp.sendRedirect("index.jsp");
    			}
        	
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			session.setAttribute("succMsg", "Error: All Form filled required");
			resp.sendRedirect("index.jsp");
		}
    }
	
	
}












