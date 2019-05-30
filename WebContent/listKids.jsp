<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listagem de crianças</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>

<ul>
   <li><a href="index.jsp">Menu principal</a></li>
  <li><a href="relatorio1.jsp">Adicionar relatório</a></li>
  <li><a href="relatorio2.jsp">Ver relatório</a></li>
  <li><a href="managegroups.jsp">Gerir turmas</a></li>
</ul>

<p align="center">***Listagem de crianças***</p>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select k.id, k.nome, k.morada, k.telefone, k.email, k.idade , g.nome from kids k"+
			" join kid_group on k.id= idKid join groups g on g.id= idGroup order by g.nome");%>
<form method="POST" action="DeleteKid">	
<table class="list" align="center" >
<tr><th>Nome</th><th>Morada</th><th>Telefone</th><th>Idade</th><th>Email</th><th>Turma</th><th> </th></tr>
<% 	while(rst.next()){%>
<tr>
<td id="listnome"><%out.println(rst.getString("k.nome")); %></td>
<td><%out.println(rst.getString("k.morada")); %></td>
<td><%out.println(rst.getString("k.telefone")); %></td>
<td><%out.println(rst.getString("k.idade")); %></td>
<td><%out.println(rst.getString("k.email")); %></td>
<td><%out.println(rst.getString("g.nome")); %></td>
<td><button class="btn" type="submit" name="Apagar" value="<%=rst.getString("k.id")%>"> Apagar </button></td>
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
