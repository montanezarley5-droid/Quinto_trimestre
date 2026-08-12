/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Aprendiz
 */
public class UsuariosDAO {
    
    private Conexion conect = new Conexion();
    
    public Usuario consultarUsuario(String correo){
        Connection conn = conect.getconn();
        
        Usuario miUsuario = null;
        
        try {
            String querySql = "SELECT id_usuario, nombre, apellido, numero_documento, telefono, correo, "
                    +"tipo_documento_id_tipo_documento, id_rol, contrasena FROM usuario WHERE correo = ?";
            
            PreparedStatement ps = conn.prepareStatement(querySql);
            
            ps.setString(1,correo);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                miUsuario = new Usuario();
                
                miUsuario.setIdUsuario(rs.getInt("id_usuario"));
                miUsuario.setNombre(rs.getString("nombre"));
                miUsuario.setApellido(rs.getString("apellido"));
                miUsuario.setNumeroDocumento(rs.getString("numero_documento"));
                miUsuario.setTelefono(rs.getString("telefono"));
                miUsuario.setCorreo(rs.getString("correo"));
                miUsuario.setTipoDocumentoIdTipoDocumento(rs.getInt("tipo_documento_id_tipo_documento"));
                miUsuario.setIdRol(rs.getInt("id_rol"));
                miUsuario.setContrasena(rs.getString("contrasena"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return miUsuario;
        }
        return miUsuario;
    }
    public boolean InsertarUsuario(Usuario miUsuario){
        boolean insertar = false;
        Connection conn = conect.getconn();
        
        try {
            String querySql = "INSERT INTO Usuario (nombre, apellido, numero_documento,telefono, correo, contrasena,"
                    + " tipo_documento_id_tipo_documento, id_rol) VALUES (?,?,?,?,?,?,?,?)";
              
            PreparedStatement ps =conn.prepareStatement(querySql);
            ps.setString(1, miUsuario.getNombre());
            ps.setString(2, miUsuario.getApellido());
            ps.setString(3, miUsuario.getNumeroDocumento());
            ps.setString(4, miUsuario.getTelefono());
            ps.setString(5, miUsuario.getCorreo());
            ps.setString(6, miUsuario.getContrasena());
            ps.setInt(7, miUsuario.getTipoDocumentoIdTipoDocumento());
            ps.setInt(8, miUsuario.getIdRol());
                 
            
            ps.executeUpdate();
            insertar = true;
            System.out.println("Dato insertado");
            
        }catch (SQLException e) {
            System.out.println("Error al insertar usuario" + e.getMessage());
        }
              return insertar;
    }
    public boolean actualizarUsuario (Usuario miUsuario) {
        boolean actualizar = false;
        Connection conn = conect.getconn();
        
        try {
            String querySql = "UPDATE Usuario SET nombre = ?, apellido = ?, "
                    + " numero_documento = ?, telefono = ?, correo = ?, contrasena = ? WHERE id_usuario = ? ";
            
            PreparedStatement ps = conn.prepareStatement(querySql);
            ps.setString(1, miUsuario.getNombre());
            ps.setString(2,miUsuario.getApellido());
            ps.setString(3, miUsuario.getNumeroDocumento());
            ps.setString(4,miUsuario.getTelefono());
            ps.setString(5,miUsuario.getCorreo());
            ps.setString(6, miUsuario.getContrasena());
            ps.setInt(7, miUsuario.getIdUsuario());
            
            
            ps.executeUpdate();
            actualizar = true;
            System.out.println("Dato insertado");
        }catch (SQLException e) {
            System.out.println("Error al actualizar el usuario" + e. getMessage());
            
        }
        return actualizar;
                
    }
    public boolean inactivarUsuario (int id) {
        boolean inactivar = false;
        String querysql = "UPDATE Usuario SET estado = 0 WHERE id_usuario = ? ";
        Connection conn = conect.getconn();
        
        try{ 
            PreparedStatement ps = conn.prepareStatement(querysql);
            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                inactivar = true;
            }
        } catch (Exception e) {
            System.out.println("Error al inactivar el usuario ");
        }
        return inactivar;
        
    }
    public boolean ActivarUsuario (int id) {
    boolean activar = false;
    String querysql = "UPDATE Usuario SET estado = 1 WHERE id_usuario = ? ";
    Connection conn = conect.getconn();
        
        try{ 
            PreparedStatement ps = conn.prepareStatement(querysql);
            ps.setInt(1, id);
            if (ps.executeUpdate() < 1) {
                activar = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar el usuario ");
        }
        return activar;
    }
    public boolean EliminarUsuario (int id) {
        boolean eliminar = false;
        String querysql = "DELETE FROM usuario WHERE id_usuario = ?";
        Connection conn = conect.getconn();
        
        try {
            PreparedStatement ps = conn.prepareStatement(querysql);
            ps.setInt(1,id);
            int filaAfectada = ps.executeUpdate();
            if(filaAfectada > 0) {
                eliminar = true;
              
            }else{
                System.out.println("No se encontro ID del usuario");
            }
        }catch(SQLException e){
            System.out.println("No se pudo eliminar usuario" + e.getMessage());
        }
        return eliminar;
    }
 }
  

  
