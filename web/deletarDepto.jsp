<%@page import="ControleFuncionario.Departamento"%>

<!--função para deletar departamento-->
<%
    int IdDepDeletado = Integer.parseInt(request.getParameter("idDepto"));

    Departamento depto = new Departamento();
    depto.setIdDepto(IdDepDeletado);

    //deletando departamento
    boolean deletando = depto.excluirDepartamento();

    //if else para atualizar página
    if (deletando) {
        response.sendRedirect("Departamento.jsp");
    } else {
        response.sendRedirect("Departamento.jsp");
    }
%>

