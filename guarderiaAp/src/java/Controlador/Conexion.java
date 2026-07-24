/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import com.sun.tools.xjc.Driver;
import jakarta.jms.Connection;

/**
 *
 * @author Aprendiz
 */
public class Conexion {
    
private Connection conn;
private String driver = "com.mysql.cj.jdbc.Driver";
private String user = "root";
private String password = "";
private String basedatos = "guarderia";
private String url = "jdbc:mysql://localhost:3307/" + basedatos + "?useTimezo=true&severTimezo=UTC";
}
