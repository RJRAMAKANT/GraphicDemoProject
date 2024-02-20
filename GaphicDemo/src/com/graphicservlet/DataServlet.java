package com.graphicservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/graphicdata")
public class DataServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		String InpatientorNot=req.getParameter("checkradio");
		int centercode=Integer.parseInt(req.getParameter("centercode"));
		String  year=req.getParameter("year");
		System.out.println(InpatientorNot + " , "+centercode+" ,"+year);
		
	}

}
