<!-- bibliotecas necessárias -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="ControleFuncionario.Departamento"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8">
        <title>Controle de Departamento</title>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <header>
            <!--lógica para verificar se usuário tentando acessar sistema de departamento está logado-->
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
                        <a href="menu.jsp">Sistema de Controle de Departamentos</a>
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
                </ul>
            </div>
            <!--tela de forms do sistema de controle de departamentos-->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <h2 class="card-title text-center">Departamento</h2>
                    <!--adicionando departamento-->
                    <form action="addDepto.jsp">
                        <div class="form-group">
                            <label for="descDepto">Criando Departamento</label>
                            <input type="text" id="descDepto" name="descDepto" class="form-control" placeholder="Qual irá ser o nome?">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Criar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--deletando departamento-->
                    <form action="deletarDepto.jsp" method="get">
                        <div class="form-group">
                            <label for="idDepto">Deletar Departamentos</label>
                            <input type="text" id="idDepto" name="idDepto" class="form-control" placeholder="Insira o ID do departamento" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Deletar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--mudando nome departamento-->
                    <form action="updateDepto.jsp" method="get">
                        <div class="form-group">
                            <label for="idDepto">Mudar Nome de Departamentos</label>
                            <input type="text" id="idDepto" name="idDepto" class="form-control" placeholder="Qual o ID do departamento a ser mudado?" required>
                            <input type="text" id="descDepto" name="descDepto" class="form-control" placeholder="Qual o novo nome do departamento?" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Mudar</button>
                        <button type="reset" class="btn btn-secondary btn-block">Cancelar</button>
                    </form>

                    <!--consultar departamentos-->
                    <div class="table-container">
                        <h4 class="text-center">Departamentos</h4>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                </tr>
                            </thead>
                            <!--área para consultar departamentos-->
                            <tbody>
                                <%
                                    Departamento depto = new Departamento();
                                    List<Departamento> lista = depto.listarDeptos();

                                    for (Departamento conteudo : lista) {
                                %>
                                <tr>
                                    <td><%= conteudo.getIdDepto()%></td>
                                    <td><%= conteudo.getDescDepto()%></td>
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


