
	package com.servlet;

	/**
	 * Servlet implementation class DeletePostServlet
	 */
	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;


import com.dao.PhotosDao;
import com.db.DBConnect;

	@WebServlet("/deletepost")
	public class DeletePostServlet extends HttpServlet {

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				int id=Integer.parseInt(req.getParameter("id"));
				
				PhotosDao dao=new PhotosDao(DBConnect.getConn()); 		
	    		boolean f= dao.deletepost(id);
				
	    		HttpSession session=req.getSession();
	    		
	    		if (f) {
					session.setAttribute("succMsg", "post Delete Successfully..");
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("succMsg", "Error: Problem in Server Side..");
					resp.sendRedirect("view_jobs.jsp");
				}
	    		
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

	
	
	

