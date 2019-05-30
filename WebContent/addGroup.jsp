<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nova turma</title>
<link rel="stylesheet" type="text/css" href="resources/css/mystyle.css">
</head>
<body>
<ul>
   <li><a href="index.jsp">Menu principal</a></li>
</ul>
<p align="center">***Nova turma***</p>
<br><form method="POST" action="AddGroup">
<table id="addItem" align="center">
<tr><th>Nome:</th>
<td><input type="text" name="txt_nome" required style="width:300px; height:30px;"><td></tr>
</table>
<p align="center"><input type="submit"  value="Guardar" class="btn">
<input type="reset"  value="Cancelar" class ="btn"></p>
</form>
<br>
</body>
</html>
