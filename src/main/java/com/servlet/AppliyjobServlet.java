package com.servlet;
/**
 * Servlet implementation class AppliyjobServlet
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.ApplyDao;
import com.db.DBConnect;
import com.entity.Applyjobuser;


@WebServlet("/applyjob")
@MultipartConfig
public class AppliyjobServlet extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
		int userid=Integer.parseInt(req.getParameter("userid"));
		
		String name=req.getParameter("name");
    	String qua=req.getParameter("qua");
    	String email=req.getParameter("email");
    	String state=req.getParameter("state");
    	String dist=req.getParameter("dist");
    	
		HttpSession session= req.getSession();
		if (name != null && !name.equals("") && qua != null && !qua.equals("")
				&& email != null && !email.equals("") && state != null && !state.equals("")
				&& dist != null && !dist.equals("")) {
		try {
    		
	    	
    		
        	Part p =req .getPart("photo");
	    	String fileName=p.getSubmittedFileName();
	    	//String photo=req.getParameter(fileName);
	    	Part p1 =req .getPart("resume");
	    	String fileName1=p1.getSubmittedFileName();        	
        //	String resume=req.getParameter(fileName1);
//        	 
        	ApplyDao dao=new ApplyDao(DBConnect.getConn());
        	 
        	
        	Applyjobuser a=new  Applyjobuser(userid,name,qua,email,state,dist,fileName,fileName1);
        	 boolean f=dao.applyforjob(a);
        	 
        	 
        	 
        	 if (f) {
    				session.setAttribute("succMsg", " Form Submited Successfully ..");
    				resp.sendRedirect("index.jsp");
    			}else {
    				session.setAttribute("succMsg", "Error: Problem in Server Side..");
    				resp.sendRedirect("jobApply.jsp");
    			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}else {
			session.setAttribute("succMsg", "All Form filled required..");
			resp.sendRedirect("jobApply.jsp");
		}
    	
    }
}










