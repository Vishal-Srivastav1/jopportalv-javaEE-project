package com.servlet;
/**
 * Servlet implementation class AddPostServlet
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBConnect;
import com.entity.Jobs;
@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
        String title=req.getParameter("title");
  		String Location=req.getParameter("Location");
  		String category=req.getParameter("category");
  		String status=req.getParameter("status");
  		String desc=req.getParameter("desc");
  		
  		 HttpSession session= req.getSession();
			if (title != null && !title.equals("") && Location != null && !Location.equals("")
					&& category != null && !category.equals("") && status != null && !status.equals("")
					&& desc != null && !desc.equals("")) {
		  try {
		
    		Jobs j=new Jobs();
    		j.setTitle(title);
    		j.setLocation(Location);
    		j.setCategory(category);
    		j.setStatus(status);
    		j.setDescription(desc);
    		
    		
    		
    		JobDAO dao=new JobDAO(DBConnect.getConn());
    		
    		boolean f= dao.addJobs(j);
    		if (f) {
				session.setAttribute("succMsg", "job Post Successfully..");
				resp.sendRedirect("add_job.jsp");
			}else {
				session.setAttribute("succMsg", "Error: Problem in Server Side..");
				resp.sendRedirect("add_job.jsp");
			}
    	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			}else {
				session.setAttribute("succMsg", "Job All Fields required..");
				resp.sendRedirect("add_job.jsp");
			}
    	
    }
}
