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
 * Servlet implementation class AddGroup
 */
@WebServlet("/AddGroup")
public class AddGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wnome=request.getParameter("txt_nome");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
			Statement comando=ligacao.createStatement();
			comando.executeUpdate("insert into groups (nome)"+"values ('"+wnome+"')");
			out.println("Inserimos os dados");
			request.getRequestDispatcher("operationSucceed.jsp").forward(request, response);
					
		}catch(Exception e){
			out.println(e);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	
	}
}
