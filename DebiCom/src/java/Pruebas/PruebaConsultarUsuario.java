/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pruebas;
import Controlador.UsuarioDAO;
import Modelo.Usuarios;
import java.util.Scanner;
/**
 *
 * @author Jesus
 */
public class PruebaConsultarUsuario {
    UsuarioDAO miUsuario = new UsuarioDAO();
    public static void main(String[] args) {
        Scanner sc = new Scanner (System.in);
        UsuarioDAO miUsuarioDAO = new UsuarioDAO();
        
        System.out.print("Ingrese el ID del usuario que desea buscar: ");
        String busqueda = sc.nextLine();
        Usuarios miUsuario = miUsuarioDAO.consultarUsuario(busqueda);
        
        if(miUsuario != null){
            System.out.println("Nombre: " + miUsuario.getNombre());
            System.out.println("Apellido: " + miUsuario.getApellido());
            System.out.println("Identificacion: " + miUsuario.getIdentificacion());
            System.out.println("Fecha de nacimiento: " + miUsuario.getFechaNacimiento());
            System.out.println("Correo: " + miUsuario.getCorreo());
            System.out.println("Telefono: " + miUsuario.getTelefono());
            System.out.println("Direccion: "+ miUsuario.getDireccion());
            System.out.println("Correo: " + miUsuario.getCorreo());
            System.out.println("Contrasena: " + miUsuario.getPassword());
            System.out.println("Autoriza datos: " + miUsuario.getAutorizaDatos());
            System.out.println("Tipo identificacion: " + miUsuario.getIdTipoIdentificacion());
            System.out.println("Perfil: " + miUsuario.getIdPerfil());
        }else{
            System.out.println("No se encontro el Usuario");
        }
    }
}
