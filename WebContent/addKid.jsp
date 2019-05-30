<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<p align="center">***Nova criança***</p>

<br><form method="POST" action="AddKid">
<table id="addItem" align="center">
<tr><th>Nome:</th>
<td><input type="text" name="txt_nome" required style="width:300px; height:30px"></td></tr>
<tr><th>Morada:</th>
<td><input type="text" name="txt_morada" required style="width:300px; height:30px"></td></tr>
<tr><th>Telefone:</th>
<td><input type="text" name="txt_telefone" required style="width:300px; height:30px"></td></tr>
<tr><th>Email:</th>
<td><input type="text" name="txt_email" required style="width:300px; height:30px"></td></tr>
<tr><th>Idade:</th>
<td><select name="idade" required style="width:300px" class="select">
<option value="2">ate 2 anos</option>
<option value="3">entre 2-3 anos</option>
<option value="4">entre 3-4 anos</option>
<option value="5">entre 4-5 anos</option>
</select></td></tr>
<tr><th>Turma:</th>
<td>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection ligacao= DriverManager.getConnection("jdbc:mysql://localhost:3306/school_reports","root","12345678");
	Statement comando=ligacao.createStatement();
	ResultSet rst=comando.executeQuery("select id,nome from groups");%>
<select name="group" required style="width:300px" class="select">
<% while(rst.next()){ %>			
	<option value="<%out.print(rst.getString("id"));%>"> <% out.println(rst.getString("nome"));%> </option>
<% } %>
</select>

</table>
<p align="center"><input type="submit"  value="Guardar" class="btn">
<input type="reset"  value="Cancelar" class="btn"></p>
</form>
<% 
}catch(Exception e){
out.println(e);	
}
%>
<br>
</body>
</html>
