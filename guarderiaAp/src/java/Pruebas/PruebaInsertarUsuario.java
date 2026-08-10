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
public class PruebaInsertarUsuario {
    
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        Usuario miUsuario = new Usuario();
        UsuariosDAO dao = new UsuariosDAO();
        
        System.out.println("Por favor ingrese su nombre: ");
        miUsuario.setNombre(sc.nextLine());
        System.out.println("Por favor ingrese su apellido: ");
        miUsuario.setApellido(sc.nextLine());
        System.out.println("Por favor ingrese su numero de documento: ");
        miUsuario.setNumeroDocumento(sc.nextLine());
        System.out.println("Por favor ingrese su numero de telefono: ");
        miUsuario.setTelefono(sc.nextLine());
        System.out.println("Por favor ingrese su correo: ");
        miUsuario.setCorreo(sc.nextLine());
        System.out.println("Por favor ingrese su contrasena: ");
        miUsuario.setContrasena(sc.nextLine());
        System.out.println("Por favor ingrese un ID para el tipo de documento: ");
        miUsuario.setTipoDocumentoIdTipoDocumento(sc.nextInt());
        System.out.println("Por favor ingrese un ID para el rol: ");
        miUsuario.setIdRol(sc.nextInt());
        
        boolean resultado = dao.InsertarUsuario(miUsuario);
        if(resultado){
            System.out.println("El usuario se guardo correctamente");
        }else {
            System.out.println("El usuario no se pudo registrar");
        }
        
        
        
    }
    
}