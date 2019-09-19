package br.edu.insper.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import br.edu.insper.model.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController{	
	@RequestMapping("efetuaRegistro")
	public String upload(User user, String senhaConfirma, HttpSession session) throws IOException, SQLException{
		System.out.println(user.getNome() + "  " + user.getSenha() + "   " + senhaConfirma);
		if (user.getSenha().equals(senhaConfirma)) {
			if (new DAO().checkUser(user)) {
				return"login";
			}else {
				DAO dao =new DAO();
				dao.adicionaUsuario(user);
				user.setId(new DAO().getUser(user.getNome(),user.getSenha()).getId());
				session.setAttribute("usuarioLogado", user);
				return"Home";
			}
		}else {
			return"login";
		}
		
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(User usuario, HttpSession session) throws SQLException {
		System.out.println("trying to login...");
		System.out.println(usuario.getNome());
		usuario.setId(new DAO().getUser(usuario.getNome(), usuario.getSenha()).getId());
		if (new DAO().checkUser(usuario)) {
			System.out.println("Loged");
			session.setAttribute("usuarioLogado", usuario);
			return "Home";
		}
		System.out.println("Failed to login");
		return "login";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
}