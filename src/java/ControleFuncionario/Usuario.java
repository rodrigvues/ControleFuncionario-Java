package ControleFuncionario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Conexao;

public class Usuario {
    String email;
    String senha;
    
    /*
 	INCLUIR USUARIO
 */
	public boolean incluirUsuario() throws ClassNotFoundException, SQLException{
		String sql = "INSERT INTO usuario (email, senha) ";
			   sql += "VALUES (?, ?)";	
			   		   
//		INSTANCIAR CLASSE CONEXAO    
		Connection con = Conexao.conectar();	
		
//		TRY/CATCH PARA A INCLUSAO DO DEPARTAMENTO
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getEmail());
			stm.setString(2, this.getSenha());
			
			stm.execute();
		} catch (SQLException e) {
			System.out.println("Erro na inclusão do usuario" + e.getMessage());
			return false;
		}
			   
		return true;
	}
    
  /*	
  	AUTENTICAÇÃO USUARIO
 */
	public Usuario autenticarUsuario() throws ClassNotFoundException{				
		Connection   con = Conexao.conectar();
		Usuario usu = null;

		String sql = "SELECT email FROM usuario WHERE email = ? and senha = ? ";
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, this.getEmail());
			stm.setString(2, this.getSenha());
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				usu = new Usuario();
				usu.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.println("Erro na autenticação");
			return null;
		}
		return usu;
	}
              
        
    //	ÁREA DE GETTERS E SETTERS
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
}
