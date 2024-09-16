package ControleFuncionario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.Conexao;

public class Funcionario {
	private int     idFunc;
	private String  nomeFunc;
	private int     idDepto;
	private double  salHora;
	
/*
 	INCLUIR FUNCIONARIO
 */
	public boolean incluirFunc() throws ClassNotFoundException, SQLException{
		String sql = "INSERT INTO funcionario (nomeFunc, idDepto, salHora) ";
			   sql += "VALUES (?, ?, ?)";	
			   		   
//		INSTANCIAR CLASSE CONEXAO    
		Connection con = Conexao.conectar();	
		
//		TRY/CATCH PARA A INCLUSAO DO DEPARTAMENTO
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getNomeFunc());
			stm.setInt(2, this.getIdDepto());
			stm.setDouble(3, this.getSalHora());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na inclusão do funcionário" + e.getMessage());
			return false;
		}
			   
		return true;
	}
	
/*
 	ALTERAR FUNCIONÁRIO
 */
	public boolean alterarFuncionario() throws ClassNotFoundException {
		String  sql = "UPDATE funcionario ";
				sql += " SET nomefunc = ? , idDepto = ? , salHora = ? ";
				sql += " WHERE idFunc = ? ";
		Connection con = Conexao.conectar();
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getNomeFunc());
			stm.setInt(2, this.getIdDepto());
			stm.setDouble(3, this.getSalHora());
			stm.setInt(4, this.getIdFunc());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na alteração do funcionario" + e.getMessage());
			return false;
		}
		return true;
	}		

/*
  	EXCLUIR FUNCIONÁRIO
 */
	public boolean excluirFuncionario() throws ClassNotFoundException {
		String  sql  = "DELETE FROM funcionario ";
				sql += "WHERE idFunc = ? ";
		Connection con = Conexao.conectar();
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, this.getIdFunc());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na exclusão do funcionário" + e.getMessage());
			return false;
		}
		return true;
	}	
	
	
/*
 	LISTAR FUNCIONARIOS CADASTRADOS
 */
	public List<Funcionario> listarFunc() throws ClassNotFoundException{
		
//		CRIANDO LISTA 	
		List<Funcionario> listaFunc = new ArrayList<>();
		
//		INSTANCIAR CLASSE CONEXAO 
		Connection con = Conexao.conectar();
		
//		COMANDO PARA LISTAR DEPARTAMENTOS
		String sql = "SELECT idFunc, nomeFunc, idDepto, salHora FROM funcionario ORDER BY idFunc";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			
//			WHILE PARA FAZER A LISTAGEM DE TODOS OS DEPARTAMENTOS
			while (rs.next()) {
				
//				INSTANCIAR CLASSE DEPARTAMENTO 
				Funcionario fun = new Funcionario();
				fun.setIdFunc(rs.getInt("idFunc"));
				fun.setNomeFunc(rs.getString("nomeFunc"));
				fun.setIdDepto(rs.getInt("idDepto"));
				fun.setSalHora(rs.getDouble("salHora"));
				listaFunc.add(fun);
			}
		} catch (SQLException e) {
			System.out.println("Erro em listar funcionarios" + e.getMessage());
			return null;
		}
//		RETORNA A LISTA DOS DEPARTAMENTOS
		return listaFunc;
	
	}
	
/*	
  	LISTAR UM FUNCIONARIO CADASTRADO 
 */
	public Funcionario consultaFunc() throws ClassNotFoundException{
				
//		INSTANCIAR CLASSE CONEXAO E DEPARTAMENTO
		Connection   con = Conexao.conectar();
		Funcionario fun = new Funcionario();
		
//		COMANDO PARA LISTAR DEPARTAMENTOS
		String sql = "SELECT nomeFunc, idDepto, salHora FROM funcionario where idFunc = ?";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, this.getIdFunc());
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				fun = new Funcionario();
				fun.setNomeFunc(rs.getString("nomeFunc"));
				fun.setIdDepto(rs.getInt("idDepto"));
				fun.setSalHora(rs.getDouble("salHora"));
			}
		} catch (SQLException e) {
			System.out.println("Erro na consulta do funcionario" + e.getMessage());
			return null;
		}
		return fun;
	
	}
	
	
//	ÁREA DE GETTERS E SETTERS
	public int getIdFunc() {
		return idFunc;
	}
	public void setIdFunc(int idFunc) {
		this.idFunc = idFunc;
	}
	public String getNomeFunc() {
		return nomeFunc;
	}
	public void setNomeFunc(String nomeFunc) {
		this.nomeFunc = nomeFunc;
	}
	public int getIdDepto() {
		return idDepto;
	}
	public void setIdDepto(int idDepto) {
		this.idDepto = idDepto;
	}
	public double getSalHora() {
		return salHora;
	}
	public void setSalHora(double salHora) {
		this.salHora = salHora;
	}
	
}
