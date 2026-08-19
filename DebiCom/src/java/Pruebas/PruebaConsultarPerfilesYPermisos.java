package Pruebas;

import Controlador.PerfilesYPermisosDAO;
import Modelo.PerfilesYPermisos;
import java.util.ArrayList;
import java.util.Scanner;

public class PruebaConsultarPerfilesYPermisos {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        PerfilesYPermisosDAO miPerfilDAO = new PerfilesYPermisosDAO();

        System.out.println("Ingrese el ID del perfil para consultar los permisos: ");
        int busqueda = sc.nextInt();

        ArrayList<PerfilesYPermisos> listaPermisos =
                miPerfilDAO.consultarPerfilYPermiso(busqueda);

        if (!listaPermisos.isEmpty()) {

            System.out.println("Permisos asociados al perfil " + busqueda + ":");

            for (PerfilesYPermisos permiso : listaPermisos) {

                System.out.println("id_perfil: " + permiso.getIdPerfil());
                System.out.println("id_rol_permiso: " + permiso.getIdRolPermiso());
               
            }

        } else {

            System.out.println("No se encontraron permisos para el perfil.");
        }
    }
}