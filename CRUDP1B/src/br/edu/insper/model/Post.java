package br.edu.insper.model;
import java.sql.Time;

public class Post {
	private String texto;
	private int idautor;
	private int id;
	private Time time;
	
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public int getIdAutor() {
		return idautor;
	}
	public void setIdAutor(int idautor) {
		this.idautor = idautor;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}

}
