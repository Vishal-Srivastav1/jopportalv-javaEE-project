package com.servlet;
/**
 * Servlet implementation class DeleteUserServlet
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.dao.UserDao;
import com.db.DBConnect;
@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			UserDao dao=new UserDao(DBConnect.getConn()); 		
    		boolean f= dao.deleteUserbyid(id);
			
    	
    		HttpSession session=req.getSession();
   		
    		if (f) {
    			session.getAttribute("userobj");
        		session.removeAttribute("userobj");
				session.setAttribute("succMsg", "Account Delete Successfully..");
				resp.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("succMsg", "Error: Problem in Server Side..");
				resp.sendRedirect("index.jsp");
			}
    		
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
