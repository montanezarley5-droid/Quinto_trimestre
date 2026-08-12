/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;


import Controlador.NinosDAO;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaEliminarNinos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        NinosDAO dao = new NinosDAO();
        
        try{
            System.out.println("Ingrese el ID del niño a eliminar:  ");
            int id = sc.nextInt();
            
            if(dao.EliminarNinos(id)){
                System.out.println("Se elimino el niño");
            }
    }catch(Exception e) {
        System.out.println("Error al eliminar el niño");
       }
    }
}
  
