package Controlador;

import Modelo.PerfilesYPermisos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PerfilesYPermisosDAO {

    private Conexion conect = new Conexion();

    public ArrayList<PerfilesYPermisos> consultarPerfilYPermiso(int id) {

        Connection conn = conect.getconn();
        ArrayList<PerfilesYPermisos> listaPermisos = new ArrayList<>();

        try {

            String querySql = "SELECT id_perfil, id_rol_permiso FROM perfiles_y_permisos WHERE id_perfil = ?";

            PreparedStatement ps = conn.prepareStatement(querySql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                PerfilesYPermisos miPerfil = new PerfilesYPermisos();

                miPerfil.setIdPerfil(rs.getInt("id_perfil"));
                miPerfil.setIdRolPermiso(rs.getInt("id_rol_permiso"));

                listaPermisos.add(miPerfil);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return listaPermisos;
    }
}