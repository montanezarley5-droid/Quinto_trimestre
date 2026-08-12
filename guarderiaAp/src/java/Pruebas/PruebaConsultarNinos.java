/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.NinosDAO;
import Modelo.Ninos;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaConsultarNinos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        NinosDAO miNinoDAO = new NinosDAO();
        System.out.print("Ingrese el codigo unico del niño a consultar:   ");
        String busqueda = sc.nextLine();
        Ninos miNino = miNinoDAO.consultarNinos(busqueda);
        
        if(miNino != null){
            System.out.println("Nombre " + miNino.getNombre());
            System.out.println("Apellido " + miNino.getApellido());
            System.out.println("Fecha_Nacimiento " + miNino.getFechaNacimiento());
            System.out.println("Codigo_Unico " + miNino.getCodigoUnico());
            System.out.println("Numero_Documento " + miNino.getNumeroDocumento());            
        }
        else{
            System.out.println("No se encontro el niño");
        }
        
    }
}
    
    

