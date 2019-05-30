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
<p align="center">***Novo Relatório***</p>
<p align="center"><%int id= Integer.parseInt(request.getParameter("idKid")); 
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select nome from kids where id="+id);
	rst.next();
	out.print(rst.getString("nome"));%></p>

<form method="POST" action="AddRelatorio" align="center">
<table id="table" align="center">
<tr><th><font color="lime">Data:</font></th>
<td><input type="date" name="txt_date" required style="width:370px"><td></tr>
<tr><th><font color="tomato">Refeições:</font></th>
<td> <textarea rows = "5" cols = "50" name = "txt_meals" required></textarea><td></tr>
<tr><th><font color="aqua">Sestas:</font></th>
<td> <textarea rows = "5" cols = "50" name = "txt_naps" required></textarea><td></tr>
<tr><th><font color="gold">Atividades:</font></th>
<td> <textarea rows = "7" cols = "50" name = "txt_activities" required></textarea><td></tr>
<tr><th><font color="orchid">Notas:</font></th>
<td> <textarea rows = "5" cols = "50" name = "txt_notes"></textarea>
<input type="hidden" name="kidId" value="<% out.print(id);%>"><td></tr>
</table>
<input type="submit"  value="Guardar" class="btn" align="center"><br><br>
<input type="reset"  value="Cancelar" class="btn" align="center">
</form>
<br>
<%}catch(Exception e){e.printStackTrace();}%>
</body>
</html>
