<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de turmas</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>

<ul>
   <li><a href="index.jsp">Menu principal</a></li>
  <li><a href=".jsp">Adicionar relatório</a></li>
  <li><a href=".jsp">Ver relatório</a></li>
  <li><a href="managegroups.jsp">Gerir turmas</a></li>
</ul>

<p align="center">***Listagem de turmas***</p>
<br>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select idGroup,  count(*) as contador from kid_group group by idGroup");%>	
<table class="list" align="center">
<tr><th>Nome</th><th>Numero de crianças</th></tr>

<% 	while(rst.next()){%>
<tr>
<% String id=rst.getString("idGroup");
Statement comando1=ligacao.createStatement();
ResultSet rst1=comando1.executeQuery("select nome from groups where id="+id);
rst1.next();%>
<td><%out.println(rst1.getString("nome")); %></td>
<td><%out.println(rst.getString("contador")); %></td>
</tr>			
<%}	
}catch(Exception e){
out.println(e);	
}
%>
</table>
<br>
</body>
</html>
