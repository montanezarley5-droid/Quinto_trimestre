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
public class PruebaInsertarPerfil {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Perfiles miPerfil = new Perfiles();
        PerfilesDAO dao = new PerfilesDAO();
        
        
        System.out.println("Por favor ingrese el nombre:  ");
        miPerfil.setNombrePerfil(sc.nextLine());
        
      
   
    boolean resultado = dao.InsertarPerfil(miPerfil);
    if(resultado){
        System.out.println("El perfil se agrego cortrectamente");
    
    }else{
        System.out.println("El perfil no se pudo agregar");
    }
        
    }
    
}
