<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Adicionar pergunta</title>
</head>
<body>
<%@ page import="br.edu.insper.model.*" %>
<%
	DAO dao = new DAO();
	User usuarioLogado = (User) session.getAttribute("usuarioLogado");
	Post postModificavel = (Post) session.getAttribute("postModificavel");
	
	if (postModificavel.getId() != 0){
		System.out.println(postModificavel.getIdAutor() + " outra " + usuarioLogado.getId());
		if (postModificavel.getIdAutor() == usuarioLogado.getId()){
				System.out.println(postModificavel.getTexto());
				%>
				<form method="post" action="modificarPergunta">
					<input type="text" name="novoTexto" value="<%=postModificavel.getTexto() %>">
					<input type="hidden" name="id" value=<%=postModificavel.getId() %>>
					<input type="hidden" name="idautor" value=<%=usuarioLogado.getId() %>>
					<input type="submit" value="Modificar">
				</form>
		<% }else {out.println("Deu merda ai viu");} %>
	<% }else{ %>
		<form method="post" action="adicionarPergunta">
			<input type="text"   name="texto">
			<input type="hidden" name="idautor" value=<%=usuarioLogado.getId() %>>
			<input type="submit"                value="Adicionar">
		</form>
	<% }
	%>
</body>
</html>