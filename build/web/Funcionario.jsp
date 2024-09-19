<!-- bibliotecas necessárias -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="ControleFuncionario.Funcionario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt"> 
    <head>
        <meta charset="UTF-8">
        <title>Controle de Funcionario</title>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <header>
            <!--lógica para verificar se usuário tentando acessar sistema de funcionario está logado-->
            <%
                String username = (String) session.getAttribute("usuario");
                //redireciona, se não verificado, para outra tela
                if (username == null) {
                    response.sendRedirect("problemaNoLogin.html");
                }
            %>
            <nav class="navbar navbar-expand navbar-dark bg-primary">
                <div class="container-fluid">
                    <a href="menu.jsp" id="menu-toggle" class="navbar-brand"><span class="navbar-toggler-icon"></span></a>
                    <div class="sidebar-brand">
                        <a href="menu.jsp">Sistema de Controle de Funcionarios</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarsExample02">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="menu.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!--sidebar-->
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li><a href="Departamento.jsp">Departamento</a></li>
                    <li><a href="Funcionario.jsp">Funcionários</a></li>
                </ul>
            </div>
            <!--tela de forms do sistema de controle de funcionario-->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <h2 class="card-title text-center">Funcionario</h2>
                    <!--adicionando funcionario-->
                    <form action="addFunc.jsp">
                        <div class="form-group">
                            <label for="descDepto">Criando Funcionário</label>
                            <input type="text" id="nomeFunc" name="nomeFunc" class="form-control" placeholder="Qual é o nome do funcionário?">
                            <input type="text" id="idDepto" name="idDepto" class="form-control" placeholder="Qual o ID do departamento do funcionário?">
                            <input type="text" id="salHora" name="salHora" class="form-control" placeholder="Qual irá ser o salário hora do funcionário?">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Criar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--deletando funcionário-->
                    <form action="deletarFunc.jsp" method="get">
                        <div class="form-group">
                            <label for="idDepto">Deletar Funcionário</label>
                            <input type="text" id="idFunc" name="idFunc" class="form-control" placeholder="Insira o ID do funcionário" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Deletar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--mudando nome funcionario-->
                     <form action="updateFunc.jsp" method="get">
                        <div class="form-group">
                            <label for="idFunc">Mudar Info Funcionário</label>
                            <input type="text" id="idFunc" name="idFunc" class="form-control" placeholder="Digite o ID do Funcionário a ser alterado">
                            <input type="text" id="nomeFunc" name="nomeFunc" class="form-control" placeholder="Qual será o novo nome do Funcionário?">
                            <input type="text" id="idDepto" name="idDepto" class="form-control" placeholder="Qual será o novo id do departamento do funcionário?">
                            <input type="text" id="salHora" name="salHora" class="form-control" placeholder="Qual será o novo salário por hora do funcionário?">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Mudar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--consultar funcionario-->
                    <div class="table-container">
                        <h4 class="text-center">Funcionários</h4>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome do Funcionário</th>
                                    <th>Salário Hora</th>
                                    <th>Departamento</th>
                                </tr>
                            </thead>
                            <!--área para consultar funcionario-->
                            <tbody>
                                <%
                                    Funcionario func = new Funcionario();
                                    List<Funcionario> lista = func.listarFunc();

                                    for (Funcionario conteudo : lista) {
                                %>
                                <tr>
                                    <td><%= conteudo.getIdFunc()%></td>
                                    <td><%= conteudo.getNomeFunc()%></td>
                                    <td><%= conteudo.getSalHora()%></td>
                                    <td><%= conteudo.getIdDepto()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--style especifico para a tabela de consulta-->
        <style>
            .table-container {
                border: 1px solid #ddd;

                margin-top: 20px;
                border-radius: 10px;
                background-color: #f9f9f9;
            }
            .table {
                margin-bottom: 0;
            }
        </style>
    </body>
</html>


