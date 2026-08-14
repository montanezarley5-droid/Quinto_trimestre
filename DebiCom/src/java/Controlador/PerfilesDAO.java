/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Perfiles;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Aprendiz
 */
public class PerfilesDAO {
    private Conexion conect = new Conexion();
    public Perfiles consultarPerfil(String id_perfil) throws SQLException{
      Connection conn = conect.getconn();
      Perfiles miperfil = null;
      
      try{
          String querySql = "SELECT id_perfil, nombre_perfil FROM perfiles WHERE id_perfil = ?";
          
          PreparedStatement ps = conn.prepareStatement(querySql);
          ps.setString(1, id_perfil);
          
          ResultSet rs = ps.executeQuery();
          if (rs.next()){
              miperfil = new Perfiles();
              
              miperfil.setIdPerfiles(rs.getInt("id_perfil"));
              miperfil.setNombrePerfil(rs.getString("NombrePerfil"));
            }
      }catch (SQLException e) {
          System.out.print(e.getMessage());
    }
      return miperfil;
    }
}
