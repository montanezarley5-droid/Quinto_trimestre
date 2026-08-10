/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Pruebas;

import Controlador.UsuariosDAO;
import Modelo.Usuario;
import java.util.Scanner;

/**
 *
 * @author Aprendiz
 */
public class PruebaActualizarUsuario {
    public static void main(String[] args){
        
        Scanner sc = new Scanner(System.in);
        Usuario miUsuario = new Usuario();
        UsuariosDAO dao = new UsuariosDAO();
        
        
       System.out.println("Ingrese el ID del usuario que desea actualizar ");
       int actualizar = sc.nextInt();
       sc.nextLine();
       miUsuario.setIdUsuario (actualizar);
       
        System.out.println("Por favor ingrese su nombre acualizar: ");
        miUsuario.setNombre(sc.nextLine());
        
        System.out.println("Por favor ingrese su apellido actualizar: ");
        miUsuario.setApellido(sc.nextLine());
        
        System.out.println("Por favor ingrese su numero de documento actualizar: ");
        miUsuario.setNumeroDocumento(sc.nextLine());
        
        System.out.println("Por favor ingrese su numero de telefono actualizar: ");
        miUsuario.setTelefono(sc.nextLine());
        
        System.out.println("Por favor ingrese su correo actualizar: ");
        miUsuario.setCorreo(sc.nextLine());
        
        System.out.println("Por favor ingrese su contrasena actualizar: ");
        miUsuario.setContrasena(sc.nextLine());
        
        boolean resultado = dao.actualizarUsuario(miUsuario);
        if(resultado){
            System.out.println("El usuario se actualizo correctamente");
        }else {
            System.out.println("El usuario no se pudo actualizar");
        }
        
        
        
    }
    
}
    