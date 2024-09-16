<!DOCTYPE html>
<html lang="pt-br" >
    <head>
        <meta charset="UTF-8">
        <title>Sistema</title>
        <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <header>
            
            <!--lógica para verificar se usuário tentando acessar menu está logado-->
            <%
                String username = (String) session.getAttribute("usuario");
                //redireciona, se não verificado, para tela
                if (username == null) {
                    response.sendRedirect("problemaNoLogin.html");
                }
            %>
            <nav class="navbar navbar-expand navbar-dark bg-primary">
                <div class="container-fluid">
                    <a href="#menu-toggle" id="menu-toggle" class="navbar-brand"><span class="navbar-toggler-icon"></span></a>   
                    <div class="sidebar-brand"> <a href="menu.jsp">Sistema</a> </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarsExample02">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active"> <a class="nav-link" href="menu.jsp">Home <span class="sr-only">(current)</span></a> </li>
                        </ul>
                        <form class="form-inline my-2 my-md-0"> </form>
                    </div>
                </div>
            </nav>
        </header>
        <!--sidebar para acessar os principais sistemas-->
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li> <a href="Departamento.jsp">Departamentos</a> </li>          
                </ul>
            </div>
            <!--titulo e descrição do sistema-->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <h1>Sistema de Controle</h1>
                    <p>Controle funcionários, departamentos e folhas de pagamentos com esse sistema.<br>Crie, consulte, edite e exclua por meio deste sistema.</p>            
                </div>
            </div> 
        </div> 
        <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js'></script>
        <script  src="scripts/script.js"></script>
    </body>
</html>
