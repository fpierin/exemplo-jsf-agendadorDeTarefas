<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerenciador de tarefas</title>
<link href="<%=request.getContextPath()%>/css/estilos.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<h3>Lista de tarefas</h3>
	<f:view>
		<h:messages layout="table"></h:messages>

		<%-- Possibilidade de iniciar um novo Todo --%>
		<h:form>
			<h:commandLink binding="#{controladorDeTarefas.comandoAdicionar }"
				accesskey="n" action="#{controladorDeTarefas.adicionarNova }"
				value="Adicionar nova tarefa">
			</h:commandLink>
		</h:form>

		<h:form binding="#{controladorDeTarefas.formulario }" rendered="false"
			styleClass="todo">
			<h:panelGrid columns="2">
				<h:outputText value="Titulo"></h:outputText>
				<h:inputText value="#{controladorDeTarefas.tarefa.titulo }"
					required="true" requiredMessage="Titulo obrigatório"></h:inputText>
				<h:outputText value="Descrição"></h:outputText>
				<h:inputTextarea value="#{controladorDeTarefas.tarefa.descricao }"
					cols="40" rows="4"></h:inputTextarea>
				<h:outputText value="Prioriade"></h:outputText>
				<h:selectOneMenu validatorMessage="Obrigatório"
					value="#{controladorDeTarefas.tarefa.prioridade }">
					<f:selectItems value="#{controladorDeTarefas.prioridades }" />
				</h:selectOneMenu>
			</h:panelGrid>
			<h:panelGroup>
				<h:commandButton action="#{controladorDeTarefas.gravar }"
					value="Gravar" accesskey="s">
				</h:commandButton>
				<h:commandButton action="#{controladorDeTarefas.cancelar }"
					value="Cancelar" accesskey="c" immediate="true">
				</h:commandButton>
			</h:panelGroup>
		</h:form>

		<%-- Esses botões permitem ver e esconder a tabela --%>
		<h:form>
			<h:panelGrid columns="2">
				<h:commandLink id="esconder"
					actionListener="#{controladorDeTarefas.mostrarTabela }"
					value="Esconder tabela">
				</h:commandLink>
				<h:commandLink id="mostrar"
					actionListener="#{controladorDeTarefas.mostrarTabela }"
					value="Mostrar tabela"></h:commandLink>
			</h:panelGrid>
		</h:form>

		<%-- Aqui se inicia o formulaio para a tabela de dados --%>
		<h:form binding="#{controladorDeTarefas.tabela }">
			<%-- Aqui se inicia os dados da tabela --%>
			<h:dataTable value="#{controladorDeTarefas.tarefas }" var="tarefa"
				styleClass="todo" headerClass="todoheader"
				columnClasses="first, rest">
				<h:column>
					<%-- Por esse facet nós definimos o cebaçalho da tabela (coluna 1) --%>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Prioridade"></h:outputText>
						</h:column>
					</f:facet>
					<h:outputText value="#{tarefa.prioridade }"></h:outputText>
				</h:column>
				<h:column>
					<%-- Por esse facet nós definimos o cebaçalho da tabela (coluna 2) --%>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Titulo"></h:outputText>
						</h:column>
					</f:facet>
					<h:outputText value="#{tarefa.titulo }"></h:outputText>
				</h:column>
				<h:column>
					<%-- Por esse facet nós definimos o cebaçalho da tabela (coluna 3) --%>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Descrição"></h:outputText>
						</h:column>
					</f:facet>				
					<h:outputText value="#{tarefa.descricao }"></h:outputText>
				</h:column>
				<h:column>
					<%-- Por esse facet nós definimos o cebaçalho da tabela (coluna 4) --%>
					<f:facet name="header">
						<h:column>
							<h:outputText value="Ações"></h:outputText>
						</h:column>
					</f:facet>
					<h:panelGrid columns="2">
						<h:commandLink value="Remover" action="#{controladorDeTarefas.remover }">
							<f:setPropertyActionListener value="#{tarefa }" target="#{controladorDeTarefas.tarefa }"/>
						</h:commandLink>
					</h:panelGrid>				
				</h:column>				
			</h:dataTable>
		</h:form>

	</f:view>
</body>
</html>