<%@page import="ControleFuncionario.Departamento"%>

<!--função para criar um novo departamento-->
<%
    String novoNomeDepto = request.getParameter("descDepto");

    Departamento depto = new Departamento();
    depto.setDescDepto(novoNomeDepto);
    
    //função para incluir
    boolean incluir = depto.incluirDepto();

    //if else para atualizar página
    if (incluir) {
        response.sendRedirect("Departamento.jsp");
    } else {
        response.sendRedirect("Departamento.jsp");
    }
%>

