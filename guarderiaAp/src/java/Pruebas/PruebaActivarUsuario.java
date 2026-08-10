/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.UsuariosDAO;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaActivarUsuario {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner sc = new Scanner (System.in);
        UsuariosDAO dao = new UsuariosDAO();
        
        try{
            System.out.println("Ingrese el ID del usuario a activar");
            int id = sc.nextInt();
            
            if (dao.ActivarUsuario(id)) {
                System.out.println("Se activo con exito");
                
            }
        }catch(Exception e){
            System.out.println("Error al encontrar el usuario");
        }
    }
}
