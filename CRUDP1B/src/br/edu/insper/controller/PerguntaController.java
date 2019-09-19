package br.edu.insper.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.edu.insper.model.*;

@Controller
public class PerguntaController {
	@RequestMapping("/")
	public String execute() {
		System.out.print("Inicialized...");
		return "login";
	}
	
	@RequestMapping("adicionarPergunta")
	public String addQuestion(Post post, int idautor) {
		System.out.println("Texto: " + post.getTexto());
		post.setIdAutor(idautor);
		System.out.println("Idautor: " + post.getIdAutor());
		DAO dao = new DAO();
		dao.adicionaPost(post);
		return "Home";
	}
	
	@RequestMapping("paginaAdicionar")
	public String goAddQuestion(Post post){
		return "adiciona";
	}
	
	
	@RequestMapping("formQuestion")
	public String modAdd(Post post, HttpSession session, int idautor) throws SQLException {
		if (post.getId() != 0) {
			post.setIdAutor(idautor);
			System.out.println("ID do post " + post.getId());
			System.out.println("ID do autor " + post.getIdAutor());
			post.setTexto(new DAO().getPost(post.getId()).getTexto());
		}
		session.setAttribute("postModificavel", post);
		return "adiciona";
	}
	
	@RequestMapping("modificarPergunta")
	public String modifyQuestion(Post post, String novoTexto) throws SQLException {
		DAO dao = new DAO();
		dao.alterarPergunta(post, novoTexto);
		return "Home";
	}
	@RequestMapping("deletar")
	public String deleteQuestion(Post post) throws SQLException {
		DAO dao = new DAO();
		dao.deletarPergunta(post);
		return "Home";
	}	
	
	@RequestMapping("ordenar")
	public String ordenar(HttpSession session) {
		session.setAttribute("order", "true");
		return "Home";
	}
	
	@RequestMapping("filtrar")
	public String filtrar(String filtrarPor, HttpSession session) {
		session.setAttribute("filter", filtrarPor);
		return "Home";
	}
}