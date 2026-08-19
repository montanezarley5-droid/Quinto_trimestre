/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.PerfilesDAO;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaEliminarPerfil {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        PerfilesDAO dao = new PerfilesDAO();
        
        try{
            System.out.println("Ingrese el ID de eliminar perfil:  ");
            int id = sc.nextInt();
            
            if(dao.EliminarPerfil(id)){
            System.out.println("Se elimino perfil");
            }
    }catch(Exception e) {
        System.out.println("Error al eliminar el perfil");
       }
    }
}
