<%@page import="ControleFuncionario.Departamento"%>

<!--fun��o para mudar nome departamento-->
<%
    int IdDeptoMudado = Integer.parseInt(request.getParameter("idDepto"));
    String novoNomeDepto = request.getParameter("descDepto");

    //settando novo nome
    Departamento depto = new Departamento();
    depto.setDescDepto(novoNomeDepto);
    depto.setIdDepto(IdDeptoMudado);

    boolean mudar = depto.alterarDepartamento(); 
    
    //if else para atualizar p�gina
    if (mudar) {   
        response.sendRedirect("Departamento.jsp"); 
    } else {
        response.sendRedirect("Departamento.jsp");
    }
%>
