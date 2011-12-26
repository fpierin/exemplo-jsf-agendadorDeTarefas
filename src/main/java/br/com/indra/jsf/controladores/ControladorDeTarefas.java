package br.com.indra.jsf.controladores;

import java.util.ArrayList;
import java.util.List;

import javax.faces.component.UICommand;
import javax.faces.component.UIForm;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import br.com.indra.jsf.modelo.Tarefa;

public class ControladorDeTarefas {

	// Variaveis relacionadas ao modelo de dominio
	private List<Tarefa> listaDeTarefas;
	private Tarefa tarefa;

	// Variaveis relacionadas com JavaServerFaces
	private UIForm formulario;
	private UIForm tabela;
	private UICommand comandoAdicionar;

	public ControladorDeTarefas() {
		listaDeTarefas = new ArrayList<Tarefa>();
		listaDeTarefas.add(new Tarefa("Learn JFS", "Finish this article",1));
		listaDeTarefas.add(new Tarefa("stop drinking to much coffee", "Coffee is evil!", 3));
	}

	public String adicionarNova() {
		tarefa = new Tarefa("", "", 3);
		formulario.setRendered(true);
		comandoAdicionar.setRendered(false);
		return null;
	}

	public String gravar() {
		listaDeTarefas.add(tarefa);
		formulario.setRendered(false);
		comandoAdicionar.setRendered(true);
		return null;
	}

	public String cancelar(){
		tarefa = null;
		formulario.setRendered(false);
		comandoAdicionar.setRendered(true);
		return null;
	}

	public String remover(){
		listaDeTarefas.remove(tarefa);
		return null;
	}

	public void mostrarTabela(final ActionEvent evento){
		if(evento.getComponent().getId().equalsIgnoreCase("esconder")){
			tabela.setRendered(false);
		} else {
			tabela.setRendered(true);
		}
	}

	public List<SelectItem> getPrioridades() {
		final List<SelectItem> selecoes = new ArrayList<SelectItem>();
		selecoes.add(new SelectItem(1, "Alta"));
		selecoes.add(new SelectItem(2, "Média"));
		selecoes.add(new SelectItem(3, "Baixa"));
		return selecoes;
	}

	public List<Tarefa> getTarefas(){
		return listaDeTarefas;
	}

	public void setTarefas(final List<Tarefa> tarefas){
		this.listaDeTarefas =  tarefas;
	}

	public Tarefa getTarefa() {
		return tarefa;
	}

	public void setTarefa(final Tarefa tarefa) {
		this.tarefa = tarefa;
	}

	public List<Tarefa> getListaDeTarefas() {
		return listaDeTarefas;
	}

	public void setListaDeTarefas(final List<Tarefa> listaDeTarefas) {
		this.listaDeTarefas = listaDeTarefas;
	}

	public UIForm getFormulario() {
		return formulario;
	}

	public void setFormulario(final UIForm formulario) {
		this.formulario = formulario;
	}

	public UIForm getTabela() {
		return tabela;
	}

	public void setTabela(final UIForm tabela) {
		this.tabela = tabela;
	}

	public UICommand getComandoAdicionar() {
		return comandoAdicionar;
	}

	public void setComandoAdicionar(final UICommand comandoAdicionar) {
		this.comandoAdicionar = comandoAdicionar;
	}

}
