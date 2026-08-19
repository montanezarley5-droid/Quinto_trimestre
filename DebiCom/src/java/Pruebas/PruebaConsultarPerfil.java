/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.PerfilesDAO;
import Modelo.Perfiles;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaConsultarPerfil {
    public static void main(String[] args){
       Scanner sc = new Scanner(System.in);
       PerfilesDAO miPerfilDAO = new PerfilesDAO();
       
       System.out.print("Ingrese el ID del perfil a consultar: ");
       int busqueda = sc.nextInt();
       Perfiles miperfil = miPerfilDAO.consultarPerfil(busqueda);
       
       if(miperfil !=null){
           
           System.out.println("Nombre perfil: " + miperfil.getNombrePerfil());
           System.out.println("Id perfil: " + miperfil.getIdPerfil());
       }else{
           System.out.println("no se encontro el perfil");
       }
    }
    
}