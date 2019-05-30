package com.example;

import static java.lang.System.out;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddRelatorio
 */
@WebServlet("/AddRelatorio")
public class AddRelatorio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRelatorio() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int wkidId=Integer.parseInt(request.getParameter("kidId"));
		String wdata= request.getParameter("txt_date");		
		String wmeals=request.getParameter("txt_meals");
		String wnaps=request.getParameter("txt_naps");
		String wnotes=request.getParameter("txt_notes");
		String wactivities=request.getParameter("txt_activities");
				
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports?useUnicode=yes&characterEncoding=UTF-8","root","12345678");
			Statement comando=ligacao.createStatement();
			comando.executeQuery("SET NAMES 'UTF8'");
		    comando.executeQuery("SET CHARACTER SET 'UTF8'");
			comando.executeUpdate("insert into report (idKid, data,meal,nap,activity,notes)"+
					" values ("+wkidId+",'"+ wdata+"','"+wmeals+"','"+wnaps+"','"+wactivities+"','"+wnotes+"')");
				out.println("Inserimos os dados");
				request.getRequestDispatcher("operationSucceed.jsp").forward(request, response);
				ligacao.close();
								
		}catch(Exception e){
			out.println(e);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
