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
public class PruebaActualizarPerfil {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Perfiles miPerfil = new Perfiles();
        PerfilesDAO dao = new PerfilesDAO();
        
        System.out.println("Ingrese el ID del perfil que desea actualizar: ");
        int actualizar = sc.nextInt();
        
        miPerfil.setIdPerfil(actualizar);
        sc.nextLine();
        System.out.println("Por favor ingrese el nombre actualizar:  ");
        miPerfil.setNombrePerfil(sc.nextLine());
    boolean resultado = dao.actualizarPerfil(miPerfil);
    if(resultado){
        System.out.println("El perfil se actualizo cortrectamente");
    
    }else{
        System.out.println("El perfil no se pudo actualizar");
    }
        
    }
    
}
