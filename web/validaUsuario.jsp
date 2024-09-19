<!--valida usuário-->
<%@page import="ControleFuncionario.Usuario"%>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("senha");

    Usuario novoUsuario = new Usuario();
    novoUsuario.setEmail(username);
    novoUsuario.setSenha(password);

    novoUsuario = novoUsuario.autenticarUsuario();

    //verifica se usuário realmente já possui conta
    if (novoUsuario != null) {
        session.setAttribute("usuario", username);
        response.sendRedirect("menu.jsp");
        //se não redireciona para outra tela
    } else {
        response.sendRedirect("problemaNoCadastro.html");
    }
%>