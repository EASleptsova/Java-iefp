package com.example;

import static java.lang.System.out;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTeacher
 */
@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wnome=request.getParameter("txt_nome");
		String wmorada=request.getParameter("txt_morada");
		String wtelefone=request.getParameter("txt_telefone");
		String wgroup=(request.getParameter("group"));
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
			Statement comando=ligacao.createStatement();
			comando.executeUpdate("insert into teachers (nome,morada,telefone)"+
					"values ('"+wnome+"','"+wmorada+"','"+wtelefone+"')");
			Statement comando1=ligacao.createStatement();
			ResultSet rst= comando1.executeQuery("Select id from teachers order by id desc limit 1");	
			rst.next();
				int teacherId= Integer.parseInt(rst.getString("id"));
				rst.close();	
				int groupId=Integer.parseInt(wgroup);
				Statement comando2=ligacao.createStatement();
				comando2.executeUpdate("insert into teacher_group (idTeacher,idGroup)"+"values ("+teacherId+","+groupId+")");
				out.println("Inserimos os dados");
				request.getRequestDispatcher("operationSucceed.jsp").forward(request, response);
					
		}catch(Exception e){
			out.println(e);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	
	}

}
