<!--fun��o para cadastrar novo usu�rio-->
<%@page import="ControleFuncionario.Usuario"%>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("senha");
    
    //fun��o para incluir novo usuario
    Usuario usuario = new Usuario();
    usuario.setEmail(username);
    usuario.setSenha(password);

    //if para cadastrar e redirecionar para tela de login
    if (usuario.incluirUsuario()) {
        response.sendRedirect("index.html");
    } 
%>
