<!--fun��o para criar um novo funcion�rio-->
<%@page import="ControleFuncionario.Funcionario"%>

<%
    String novoNomeFunc = request.getParameter("nomeFunc");
    int novoIdDepto = Integer.parseInt(request.getParameter("idDepto"));
    double novoSalHora = Double.parseDouble(request.getParameter("salHora"));

    Funcionario fun = new Funcionario();
    
    //settando para inserir novo func
    fun.setNomeFunc(novoNomeFunc);
    fun.setIdDepto(novoIdDepto);
    fun.setSalHora(novoSalHora);

    boolean inseriu = fun.incluirFunc();

    //if else para atualizar p�gina
    if (inseriu) {
        response.sendRedirect("Funcionario.jsp");
    } else {
        response.sendRedirect("Funcionario.jsp");
    }
%>
