<%@page import="ControleFuncionario.Funcionario"%>

<!--fun��o para deletar funcuion�rio-->
<%
    int IdFuncDeletado = Integer.parseInt(request.getParameter("idFunc"));

    Funcionario func = new Funcionario();
    func.setIdFunc(IdFuncDeletado);

    //deletando funcion�rio
    boolean deletando = func.excluirFuncionario();

    //if else para atualizar p�gina
    if (deletando) {
        response.sendRedirect("Funcionario.jsp");
    } else {
        response.sendRedirect("Funcionario.jsp");
    }
%>


