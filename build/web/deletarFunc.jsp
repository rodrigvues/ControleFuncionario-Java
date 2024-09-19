<%@page import="ControleFuncionario.Funcionario"%>

<!--função para deletar funcuionário-->
<%
    int IdFuncDeletado = Integer.parseInt(request.getParameter("idFunc"));

    Funcionario func = new Funcionario();
    func.setIdFunc(IdFuncDeletado);

    //deletando funcionário
    boolean deletando = func.excluirFuncionario();

    //if else para atualizar página
    if (deletando) {
        response.sendRedirect("Funcionario.jsp");
    } else {
        response.sendRedirect("Funcionario.jsp");
    }
%>


