/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Ninos;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.PreparedStatement;
/**
 *
 * @author Aprendiz
 */
public class NinosDAO {
    private Conexion conect = new Conexion();
    
    public Ninos consultarNinos(String codigo_unico){
        Connection conn = conect.getconn();
        
        Ninos miNino = null;
        
        try{
            String querySql = "SELECT id_Ninos, nombre, apellido, fecha_nacimiento, codigo_unico, "
                    + "numero_documento, id_grupos, tipo_documento_id_tipo_documento FROM Ninos WHERE codigo_unico = ?";
            
            PreparedStatement ps = conn.prepareStatement(querySql);
            
            ps.setString(1, codigo_unico);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                miNino = new Ninos();
                
                miNino.setIdNinos(rs.getInt("id_Ninos"));
                miNino.setNombre(rs.getString("nombre"));
                miNino.setApellido(rs.getString("apellido"));
                miNino.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                miNino.setCodigoUnico(rs.getInt("codigo_unico"));
                miNino.setNumeroDocumento(rs.getString("numero_documento"));
                miNino.setIdGrupos(rs.getInt("id_grupos"));
                miNino.setTipoDocumentoIdTipoDocumento(rs.getInt("tipo_documento_id_tipo_documento"));
                
             
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
            return miNino;
        }
    public boolean InsertarNinos(Ninos miNino){
        boolean insertar = false;
        Connection conn = conect.getconn();
        
        try {
            String querySql = "INSERT INTO Ninos (nombre, apellido, fecha_nacimiento, codigo_unico, numero_documento, "
                    + " id_grupos, tipo_documento_id_tipo_documento) VALUES (?,?,?,?,?,?,?)";
              
            PreparedStatement ps =conn.prepareStatement(querySql);
            ps.setString(1, miNino.getNombre());
            ps.setString(2, miNino.getApellido());
            ps.setDate(3, (Date)miNino.getFechaNacimiento());
            ps.setInt(4, miNino.getCodigoUnico());
            ps.setString(5, miNino.getNumeroDocumento());
            ps.setInt(6, miNino.getIdGrupos());
            ps.setInt(7, miNino.getTipoDocumentoIdTipoDocumento());
          
                 
            
            ps.executeUpdate();
            insertar = true;
            System.out.println("Dato insertado");
            
        }catch (SQLException e) {
            System.out.println("Error al insertar niño" + e.getMessage());
        }
            return insertar;
    }
     public boolean actualizarNinos (Ninos miNino) {
        boolean actualizar = false;
        Connection conn = conect.getconn();
        
        try {
            String querySql = "UPDATE Ninos SET nombre = ?, apellido = ?, "
                    + " fecha_nacimiento = ?, codigo_unico = ?, numero_documento = ? WHERE id_ninos = ? ";
            
            PreparedStatement ps = conn.prepareStatement(querySql);
            ps.setString(1, miNino.getNombre());
            ps.setString(2,miNino.getApellido());
            ps.setDate(3, (Date)miNino.getFechaNacimiento());
            ps.setInt(4, miNino.getCodigoUnico());
            ps.setString(5, miNino.getNumeroDocumento());
            ps.setInt(6, miNino.getIdNinos());
            
            
            ps.executeUpdate();
            actualizar = true;
            System.out.println("Dato insertado");
        }catch (SQLException e) {
            System.out.println("Error al actualizar el niño" + e. getMessage());
            
        }
        return actualizar;
    }
    public boolean EliminarNinos (int id) {
        boolean eliminar = false;
        String querysql = "DELETE FROM Ninos WHERE id_ninos = ?";
        Connection conn = conect.getconn();
        
        try {
            PreparedStatement ps = conn.prepareStatement(querysql);
            ps.setInt(1,id);
            int filaAfectada = ps.executeUpdate();
            if(filaAfectada > 0) {
                eliminar = true;
              
            }else{
                System.out.println("No se encontro ID del niño");
            }
        }catch(SQLException e){
            System.out.println("No se pudo eliminar el niño" + e.getMessage());
        }
        return eliminar;
    }
}


     
    
 
        
