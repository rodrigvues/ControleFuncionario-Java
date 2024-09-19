<%@page import="ControleFuncionario.Funcionario"%>

<!--função para mudar funcionário-->
<%
    int updateIdFunc = Integer.parseInt(request.getParameter("idFunc"));
    String updateNomeFunc = request.getParameter("nomeFunc");
    int updateIdDepto = Integer.parseInt(request.getParameter("idDepto"));
    double updateSalHora = Double.parseDouble(request.getParameter("salHora"));

    //settando novas info
    Funcionario func = new Funcionario();
    
    func.setIdFunc(updateIdFunc);
    func.setNomeFunc(updateNomeFunc);
    func.setIdDepto(updateIdDepto);
    func.setSalHora(updateSalHora);

    boolean mudar = func.alterarFuncionario(); 
    
    //if else para atualizar página
    if (mudar) {   
        response.sendRedirect("Funcionario.jsp"); 
    } else {
        response.sendRedirect("Funcionario.jsp");
    }
%>
