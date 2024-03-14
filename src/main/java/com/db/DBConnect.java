package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
       private static Connection conn;
       
       public static Connection getConn() {
    	   
//      String url="jdbc:mysql:///mydb";
//      String dbName="mydb";
//     
//      String userName="vishal123";
//      String password="vishal123";
      
		   
    	   try {
			if (conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				conn=DriverManager.getConnection("jdbc:mysql:///job_portal","vishal123","vishal123");                           
				//conn=DriverManager.getConnection(url+dbName,userName,password);                           
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
    	   
    	   return conn;
	}
}
