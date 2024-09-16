<!--função para cadastrar novo usuário-->
<%@page import="ControleFuncionario.Usuario"%>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("senha");
    
    //função para incluir novo usuario
    Usuario usuario = new Usuario();
    usuario.setEmail(username);
    usuario.setSenha(password);

    //if para cadastrar e redirecionar para tela de login
    if (usuario.incluirUsuario()) {
        response.sendRedirect("index.html");
    } 
%>
