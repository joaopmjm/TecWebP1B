<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

<style>
	#btlogin {
		
	}
</style>

<head>
<meta charset="utf-8">
<title>Palestra Q n A - Login</title>
</head>
<body>
	<table style="margin-left: auto; margin-right: auto; width: 8em">
		<tr>
			<td>
				<form method="post" action="efetuaLogin" style="padding-right: 10em">
					Nome<br/>
					<input type="text" name="nome" placeholder="Nome Ex. João"><br/>
					Senha<br/>
					<input type="password" name="senha" placeholder="Senha"><br/>
					<div >
						<input type="submit" name="login" value="login" id="btlogin">
					</div>
				</form>
			</td>
			<td>
				<form method="post" action="efetuaRegistro">
					Nome<br/>
					<input type="text" name="nome" placeholder="Seu nome"><br/>
					Senha<br/>
					<input type="password" name="senha" placeholder="Senha"><br/>
					Confirmar Senha<br/>
					<input type="password" name="senhaConfirma"><br/>
					<input type='submit' value='Cadastrar-se'>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>