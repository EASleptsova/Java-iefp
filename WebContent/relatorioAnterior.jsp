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

<p align="center">***Relatório***</p>
<p align="center"><%int id= Integer.parseInt((request.getParameter("id")));
	int idReport=Integer.parseInt(request.getParameter("idReport"));
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports?useUnicode=yes&characterEncoding=UTF-8","root","12345678");
		Statement comando=ligacao.createStatement();
		ResultSet rst=comando.executeQuery("select nome from kids where id="+id);
		rst.next();
		out.print(rst.getString("nome"));
		Statement comando2=ligacao.createStatement();
		//get fileName from database
		ResultSet rst2=comando2.executeQuery("select fileName from idkid_filename where idkid="+id);
		if(rst2.next()){
			String fileName= rst2.getString("fileName");%>
			<img src="resources/imgs/<%=fileName %>"  width="250">
		<% }else{%>
			<img src="resources/imgs/default.png"  heigth="200" width="200"/>
		<%}	
		Statement comando1=ligacao.createStatement();
		try{
			ResultSet rst1=comando1.executeQuery("select * from report where idKid="+id+" and id < "+idReport+" order by id desc limit 1");
			rst1.next();	
			%></p>
		<table id="report" align="center">
		<tr><th></th>
		<td><%= rst1.getDate("data") %></td></tr>
		<tr height="60"><th><font color="tomato">Meals:</font></th>
		<td> <%= rst1.getString("meal") %></td></tr>
		<tr height="60"><th><font color="aqua">Naps:</font></th>
		<td> <%= rst1.getString("nap") %></td></tr>
		<tr height="100"><th><font color="gold">Activities:</font></th>
		<td> <%= rst1.getString("activity") %></td></tr>
		<tr height="100"><th><font color="orchid">Notes:</font></th>
		<td> <%= rst1.getString("notes") %></td></tr>
		</table>
		<br>
		<form method="POST" action="relatorioAnterior.jsp" align="center">
		<input type="hidden" name="id" value="<% out.print(id);%>">
		<input type="hidden" name="idReport" value="<% out.print(rst1.getInt("id"));%>">
		<input type="submit"  value="Ver relatório anterior" class="btn" >
		</form>
		
	<% }catch(Exception e){%>
		<p align="center">***Não há relatórios para mostrar***</p>
		<% }
		}catch(Exception e){e.printStackTrace();}%>
</body>
</html>
