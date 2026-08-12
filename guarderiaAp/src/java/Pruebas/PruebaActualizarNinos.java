/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.NinosDAO;
import Modelo.Ninos;
import java.sql.Date;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaActualizarNinos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        Scanner sc = new Scanner(System.in);
        Ninos miNino = new Ninos();
        NinosDAO dao = new NinosDAO();
        
        System.out.print("Ingrese el ID del niño que desea actualizar ");
        int actualizar = sc.nextInt();
        sc.nextLine();
        miNino.setIdNinos(actualizar);
        
        System.out.print("Por favor ingrese su nombre actualizar: ");
        miNino.setNombre(sc.nextLine());
        System.out.print("Por favor ingrese su apellido: ");
        miNino.setApellido(sc.nextLine());
        
        System.out.print("Ingrese su fecha de nacimiento (AAAA-MM-DD): ");
        String fechaTexto = sc.nextLine();
        Date fechaSql = Date.valueOf(fechaTexto);
        miNino.setFechaNacimiento(fechaSql);
        
        System.out.print("Por favor ingrese el codigo unico: ");
        miNino.setCodigoUnico(sc.nextInt());
        sc.nextLine();
        System.out.print("Por favor ingrese su numero de documento: ");
        miNino.setNumeroDocumento(sc.nextLine());
       
 
        boolean resultado = dao.actualizarNinos(miNino);
        if(resultado){
            System.out.println("El niño se actualizo correctamente");
        }else {
            System.out.println("El niño no se pudo actualizar");
        }
    }
}
    
    


