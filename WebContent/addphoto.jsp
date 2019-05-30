<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nova criança</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>
<ul>
   <li><a href="index.jsp">Menu principal</a></li>
</ul>
<p align="center">***Adicionar fotografia***</p>
<form method="POST" action="FileUploadServlet"  enctype="multipart/form-data"  align="center">
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
<br><br>
<input type="file" name="fileName" class="btn1" ><br><br>
<input type="submit" value="Adicionar" class="btn">
</form>
<p align="center"><a href="index.jsp"  style="font-size:18px">Adicionar mais tarde</a></p>
<% 
}catch(Exception e){
out.println(e);	
}
%>
</body>
</html>
