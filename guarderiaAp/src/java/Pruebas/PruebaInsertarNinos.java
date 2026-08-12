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
public class PruebaInsertarNinos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Ninos miNino = new Ninos();
        NinosDAO dao = new NinosDAO();
        
        System.out.print("Por favor ingrese su nombre: ");
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
        System.out.print("Por favor ingrese un ID para grupos: ");
        miNino.setIdGrupos(sc.nextInt());
        System.out.print("Por favor ingrese un ID para el tipo de documento: ");
        miNino.setTipoDocumentoIdTipoDocumento(sc.nextInt());
 
        
        boolean resultado = dao.InsertarNinos(miNino);
        if(resultado){
            System.out.println("El niño se guardo correctamente");
        }else {
            System.out.println("El niño no se pudo registrar");
        }
    }
}
  