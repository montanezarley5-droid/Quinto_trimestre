/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.PerfilesDAO;
import Modelo.Perfiles;
import java.sql.SQLException;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaConsultarPerfil {
    PerfilesDAO miperfil = new PerfilesDAO();
    public static void main(String[] args) throws SQLException {
       Scanner sc = new Scanner(System.in);
       PerfilesDAO dao = new PerfilesDAO();
       
       System.out.print("Ingrese el ID del perfil a consultar");
       String busqueda = sc.nextLine();
       Perfiles miperfil = dao.consultarPerfil(busqueda);
       
       if(miperfil !=null){
           
           System.out.print("Nombre perfil: " + miperfil.getNombrePerfil());
           System.out.print("Id perfil: " + miperfil.getIdPerfiles());
       }else{
           
       }
    }
    
}
