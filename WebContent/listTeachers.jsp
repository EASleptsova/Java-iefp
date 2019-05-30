<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de educadoras</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>

<ul>
   <li><a href="index.jsp">Menu principal</a></li>
  <li><a href=".jsp">Adicionar relatório</a></li>
  <li><a href=".jsp">Ver relatório</a></li>
 <li><a href="managegroups.jsp">Gerir turmas</a></li>
</ul>

<p align="center">***Listagem de educadoras***</p>
<br>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select t.id, t.nome, t.morada, t.telefone, g.nome  from teachers t"+ 
			" left join teacher_group tg on tg.idTeacher=t.id"+
			" left join groups g on tg.idGroup=g.id order by t.id;");%>
<form method="POST" action="DeleteTeacher">	
<table class="list" align="center">
<tr><th>Nome</th><th>Morada</th><th>Telefone</th><th>Turma</th><th></th></tr>

<% 	while(rst.next()){%>
<tr>
<td><%out.println(rst.getString("nome")); %></td>
<td><%out.println(rst.getString("morada")); %></td>
<td><%out.println(rst.getString("telefone")); %></td>
<td><%out.println(rst.getString("g.nome")); %></td>
<td><button class="btn" type="submit" name="Apagar" value="<%=rst.getString("id")%>"> Apagar </button></td>
</tr>			
<%}	
}catch(Exception e){
out.println(e);	
}
%>
</table>
</form>
<br>
</body>
</html>
