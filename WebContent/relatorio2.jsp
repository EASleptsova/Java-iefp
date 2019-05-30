<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Relatorio</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>
<ul>
   <li><a href="index.jsp">Menu principal</a></li>
 
</ul>
<p align="center">***Escolha criança***</p>
<br><form method="POST" action="mostraRelatorio.jsp" align="center">
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select id,nome from kids");%>
<select name="idKid" required style="width:300px" class="select">
<% while(rst.next()){ %>			
	<option value="<%out.print(rst.getString("id"));%>"> <% out.println(rst.getString("nome"));%> </option>
<% } %>
</select>
<br>
<input type="submit" value="Ver Relatório" style="width:300px" class="btn" >
</form>
<% 
}catch(Exception e){
out.println(e);	
}
%>
<br>
</body>
</html>
