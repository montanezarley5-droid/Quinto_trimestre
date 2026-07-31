/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import java.util.Date;
/**
 *
 * @author Aprendiz
 */
public class NinosHasActividades {

    public int getIdNinos() {
        return idNinos;
    }

    public void setIdNinos(int idNinos) {
        this.idNinos = idNinos;
    }

    public int getIdActividades() {
        return idActividades;
    }

    public void setIdActividades(int idActividades) {
        this.idActividades = idActividades;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    private int idNinos;
    private int idActividades;
    private Date fecha;
    private String observacion;
}
