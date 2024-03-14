package com.servlet;
/**
 * Servlet implementation class RegisterServlet
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
		String name=req.getParameter("name");
    	String qua=req.getParameter("qua");
    	String email=req.getParameter("email");	
    	String ps=req.getParameter("ps");
    	 
    	   HttpSession session= req.getSession();
		if (name != null && !name.equals("") && qua != null && !qua.equals("") && email != null && !email.equals("") &&
				ps != null && !ps.equals("")) 
		{	
			
		try {
			
    		
        	UserDao dao=new UserDao(DBConnect.getConn());
        	
        	 User u=new User(name,qua,email,ps,"User");
        	 boolean f=dao.addUser(u);
        	 
        	 
        	 
        	 if (f) {
    				session.setAttribute("succMsg", "Registration Successfully..");
    				resp.sendRedirect("signup.jsp");
    			}else {
    				session.setAttribute("succMsg", "Error: Problem in Server Side..");
    				resp.sendRedirect("signup.jsp");
    			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}else {
			session.setAttribute("succMsg", "Plz fill All fields required..");
			resp.sendRedirect("signup.jsp");
		}
    	
    }
}
