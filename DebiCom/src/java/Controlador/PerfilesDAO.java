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
    public Perfiles consultarPerfil(int idPerfil){
      Connection conn = conect.getconn();
      Perfiles miPerfil = null;
      
      try{
          String querySql = "SELECT id_perfil, nombre_perfil FROM perfiles WHERE id_perfil = ?";
          
          PreparedStatement ps = conn.prepareStatement(querySql);
          ps.setInt(1, idPerfil);
          
          ResultSet rs = ps.executeQuery();
          if (rs.next()){
              miPerfil = new Perfiles();
              
              miPerfil.setIdPerfil(rs.getInt("id_perfil"));
              miPerfil.setNombrePerfil(rs.getString("nombre_perfil"));
            }
      }catch (SQLException e) {
          System.out.print(e.getMessage());
          return miPerfil;
    }
        return miPerfil;
    }
    public boolean InsertarPerfil(Perfiles miPerfil){
        boolean insertar = false;
        Connection conn = conect.getconn();
        
        try {
            String querySql = "INSERT INTO perfiles (nombre_perfil) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(querySql);
            ps.setString(1, miPerfil.getNombrePerfil());
           
        
            ps.executeUpdate();
            insertar = true;
            System.out.println("Dato insertado");
            
        }catch (SQLException e) {
            System.out.println("Error al insertar el perfil" + e.getMessage());
        }
        return insertar;
    }
    public boolean actualizarPerfil (Perfiles miPerfil){
        boolean actualizar = false;
        Connection conn = conect.getconn();
        
        try{
            String querySql = "UPDATE Perfiles SET nombre_perfil = ? WHERE id_perfil = ?";
            PreparedStatement ps = conn.prepareStatement(querySql);
            ps.setString(1, miPerfil.getNombrePerfil());
            ps.setInt(2, miPerfil.getIdPerfil());
            
            ps.executeUpdate();
            actualizar = true;
            System.out.println("Dato insertado");
        }catch (SQLException e) {
            System.out.println("Error al actualizar el perfil" + e. getMessage());
            
        }
        return actualizar;
        }
    public boolean EliminarPerfil (int id) {
        boolean eliminar = false;
        String querysql = "DELETE FROM perfiles WHERE id_perfil = ? ";
        Connection conn = conect.getconn();
        
        try{
            PreparedStatement ps = conn.prepareStatement(querysql);
            ps.setInt(1,id);
            int filaAfectada = ps.executeUpdate();
            if(filaAfectada > 0) {
            eliminar = true;
        }else{
            System.out.println("No se encontro ID del perfil");
        }
    }catch (SQLException e) {
           System.out.println("No se pudo eliminar perfil" + e.getMessage());
        }
        return eliminar;
    }
}


