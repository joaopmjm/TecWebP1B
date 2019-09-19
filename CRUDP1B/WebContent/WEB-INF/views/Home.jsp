<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Q n A - Home Page</title>
</head>
<body>
<%@ page import="java.util.*, br.edu.insper.model.*" %>
<%	DAO dao = new DAO();
	String ordered = (String) session.getAttribute("order");
	String filtered = (String) session.getAttribute("filter");
	System.out.println("ordenar " +ordered + "   filtrar " + filtered);
	List<Post> posts;
	List<User> users = dao.getUsers();
	if (ordered != null) {
		posts = dao.getPosts("ordenar", null);
		session.setAttribute("order", null);
	}else if (filtered != null){
		posts = dao.getPosts("filtrar", filtered);
		if (posts.isEmpty()){
			posts = dao.getPosts();
			out.println("<h6>Usuario filtrado inexistente</h6>");
		}
		session.setAttribute("filter", null);
	}else{
		posts = dao.getPosts();
	}
	String iduser = String.valueOf(request.getAttribute("iduser"));
	User usuarioLogado = (User) session.getAttribute("usuarioLogado");
	System.out.println(usuarioLogado.getId());
	//System.out.println("ID: "+ iduser);
%>
<h1>Usuário: <%=usuarioLogado.getNome() %></h1>
<form action="logout"><input type="submit" value="Logout">Logout</input></form>

<table>
	<tr>
		<td>Ordenar</td><td>filtrar por usuario</td>
	</tr>
	<tr>
		<td>
			<form method="post" action="ordenar">
				<input type="submit" value="Ordenar por autor">
			</form>
		</td>
		<td>
			<form method="post" name="drop" action="filtrar">
				<input type="text" name="filtrarPor">
				<input type="submit">
				</form>
		</td>
	</tr>
	
</table>
<table border="1">
	<tr><td>Pergunta</td><td>Autor</td><td>TimeStamp</td></tr>
	<% for (Post post : posts){ %>
		<tr>
			<td><%=post.getTexto() %></td>
			<td><%=dao.getUser((String.valueOf(post.getIdAutor()))).getNome() %></td>
			<td><form method="post" action="formQuestion">
				<input type="hidden" name="idautor"    value=<%=usuarioLogado.getId()%>>
				<input type="hidden" name="id" value=<%=post.getId()%>>
				<%if (String.valueOf(post.getIdAutor()).equals(String.valueOf(usuarioLogado.getId()))){ %>
					<input type="submit" name="modify" value="Modificar">
				<% }else{ %>
					<input type="submit" name="modify" value="Modificar" disabled="disabled">				
				<% } %>
			</form></td>
			<td><form method="post" action="deletar">
				<input type="hidden" name="id" value=<%=post.getId()%>>
				<%if (String.valueOf(post.getIdAutor()).equals(String.valueOf(usuarioLogado.getId()))){ %>
					<input type="submit" name="delete" value="Deletar">
				<% }else{ %>
					<input type="submit" name="delete" value="Deletar" disabled="disabled">				
				<% } %>
			</form></td>
		</tr>
<% } %>
</table>
<form method="post" action="formQuestion">
	<input type="hidden" name="idautor"    value=0>
	<input type="hidden" name="id" value=0>
	<input type="submit" name="adicionar"  value="Adicionar">
</form>
</body>
</html>