<%@page import="ControleFuncionario.Departamento"%>

<!--fun��o para criar um novo departamento-->
<%
    String novoNomeDepto = request.getParameter("descDepto");

    Departamento depto = new Departamento();
    depto.setDescDepto(novoNomeDepto);
    
    //fun��o para incluir
    boolean incluir = depto.incluirDepto();

    //if else para atualizar p�gina
    if (incluir) {
        response.sendRedirect("Departamento.jsp");
    } else {
        response.sendRedirect("Departamento.jsp");
    }
%>

