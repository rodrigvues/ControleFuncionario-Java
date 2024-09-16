package ControleFuncionario;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.Conexao;

public class Departamento {
	private int    idDepto;
	private String descDepto;
	
	
/*
 	CLASSE PARA INCLUIR DEPARTAMENTO
 */
	public boolean incluirDepto() throws ClassNotFoundException, SQLException{
		String sql = "INSERT INTO departamento (descDepto) ";
			   sql += "VALUES (?)";	
			   
//		INSTANCIAR CLASSE CONEXAO    
		Connection con = Conexao.conectar();	
		
//		TRY/CATCH PARA A INCLUSAO DO DEPARTAMENTO
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getDescDepto());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na inclusão do departamento" + e.getMessage());
			return false;
		}
			   
		return true;
	}
	
/*
 	ALTERAR DEPARTAMENTO
 */
	public boolean alterarDepartamento() throws ClassNotFoundException {
		String  sql = "UPDATE departamento ";
				sql += "SET descdepto = ? ";
				sql += "WHERE iddepto = ? ";
		Connection con = Conexao.conectar();
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getDescDepto());
			stm.setInt(2, this.getIdDepto());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na alteração do departamento" + e.getMessage());
			return false;
		}
		return true;
	}	

/*
  	EXCLUIR DEPARTAMENTO
 */
	public boolean excluirDepartamento() throws ClassNotFoundException {
		String  sql  = "DELETE FROM departamento ";
				sql += "WHERE iddepto = ? ";
		Connection con = Conexao.conectar();
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, this.getIdDepto());
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na exclusão do departamento" + e.getMessage());
			return false;
		}
		return true;
	}
	
/*
 	LISTAR DEPARTAMENTOS CADASTRADOS
 */
	public List<Departamento> listarDeptos() throws ClassNotFoundException{		
//		CRIANDO LISTA 	
		List<Departamento> listaDepto = new ArrayList<>();
//		INSTANCIAR CLASSE CONEXAO 
		Connection con = Conexao.conectar();
		
//		COMANDO PARA LISTAR DEPARTAMENTOS
		String sql = "SELECT idDepto, descDepto FROM departamento ORDER BY idDepto";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			
//			WHILE PARA FAZER A LISTAGEM DE TODOS OS DEPARTAMENTOS
			while (rs.next()) {				
//				INSTANCIAR CLASSE DEPARTAMENTO 
				Departamento dep = new Departamento();
				dep.setIdDepto(rs.getInt("idDepto"));
				dep.setDescDepto(rs.getString("descDepto"));
				listaDepto.add(dep);
			}
		} catch (SQLException e) {
			System.out.println("Erro em listar departamentos" + e.getMessage());
			return null;
		}
//		RETORNA A LISTA DOS DEPARTAMENTOS
		return listaDepto;
	
	}
	
/*	
  	LISTAR UM DEPARTAMENTO CADASTRADO 
 */
	public Departamento consultaDepto() throws ClassNotFoundException{
				
//		INSTANCIAR CLASSE CONEXAO E DEPARTAMENTO
		Connection   con = Conexao.conectar();
		Departamento dep = new Departamento();
		
//		COMANDO PARA LISTAR DEPARTAMENTOS
		String sql = "SELECT descDepto FROM departamento where idDepto = ?";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, this.getIdDepto());
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				dep = new Departamento();
				dep.setDescDepto(rs.getString("descDepto"));
			}
		} catch (SQLException e) {
			System.out.println("Erro na consulta do departamento" + e.getMessage());
			return null;
		}
		return dep;
	
	}
	
	
//	ÁREA DE GETTERS E SETTERS
	public int getIdDepto() {
		return idDepto;
	}

	public void setIdDepto(int idDepto) {
		this.idDepto = idDepto;
	}

	public String getDescDepto() {
		return descDepto;
	}

	public void setDescDepto(String descDepto) {
		this.descDepto = descDepto;
	}
	
}
