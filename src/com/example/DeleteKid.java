package com.example;

import static java.lang.System.out;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteKid
 */
@WebServlet("/DeleteKid")
public class DeleteKid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteKid() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wkid=request.getParameter("Apagar");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
			Statement comando=ligacao.createStatement();
			comando.executeUpdate("delete from kid_group where idKid="+wkid);
			Statement comando1=ligacao.createStatement();
			comando1.executeUpdate("delete from kids where id="+wkid);
			
					
		}catch(Exception e){
			out.println(e);
		}
	request.getRequestDispatcher("listKids.jsp").forward(request, response);
	}

}
