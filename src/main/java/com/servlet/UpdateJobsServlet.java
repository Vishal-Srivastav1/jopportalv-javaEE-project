package com.servlet;
/**
 * Servlet implementation class UpdateJobsServlet
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

@WebServlet("/update")
public class UpdateJobsServlet extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	  
		int id=Integer.parseInt(req.getParameter("id"));
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
        		j.setId(id);
        		j.setTitle(title);
        		j.setLocation(Location);
        		j.setCategory(category);
        		j.setStatus(status);
        		j.setDescription(desc);
        		
        		
        		
        		JobDAO dao=new JobDAO(DBConnect.getConn());
        		
        		boolean f= dao.updateJob(j);
        		if (f) {
    				session.setAttribute("succMsg", "job Updated Successfully..");
    				resp.sendRedirect("view_jobs.jsp");
    			}else {
    				session.setAttribute("succMsg", "Error: Problem in Server Side..");
    				resp.sendRedirect("view_jobs.jsp");
    			}
        	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			session.setAttribute("succMsg", "Error: Form All field required.");
			resp.sendRedirect("view_jobs.jsp");
		}
    }
}
