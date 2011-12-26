package br.com.indra.jsf.modelo;

import java.util.Calendar;

public class Tarefa {

	private int id;
	private String titulo;
	private String descricao;
	private int prioridade;
	private Calendar data;

	public Tarefa(final String titulo, final String descricao, final int prioridade) {
		this.titulo = titulo;
		this.descricao = descricao;
		this.prioridade = prioridade;
	}

	public int getId() {
		return id;
	}

	public void setId(final int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(final String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(final String descricao) {
		this.descricao = descricao;
	}

	public int getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(final int prioridade) {
		this.prioridade = prioridade;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(final Calendar data) {
		this.data = data;
	}

}
