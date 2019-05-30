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
 * Servlet implementation class DeleteTeacher
 */
@WebServlet("/DeleteTeacher")
public class DeleteTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wteacher=request.getParameter("Apagar");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
			Statement comando=ligacao.createStatement();
			comando.executeUpdate("delete from teacher_group where idTeacher="+wteacher);
			Statement comando1=ligacao.createStatement();
			comando1.executeUpdate("delete from teachers where id="+wteacher);
			
					
		}catch(Exception e){
			out.println(e);
		}
	request.getRequestDispatcher("listTeachers.jsp").forward(request, response);
	}

}
