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
    
    public Usuario consularUsuario(String correo){
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
}