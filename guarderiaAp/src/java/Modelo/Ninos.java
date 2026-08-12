/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import java.time.LocalDate;
import java.util.Date;
/**
 *
 * @author Aprendiz
 */
public class Ninos {

    public int getIdNinos() {
        return idNinos;
    }

    public void setIdNinos(int idNinos) {
        this.idNinos = idNinos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getCodigoUnico() {
        return codigoUnico;
    }

    public void setCodigoUnico(int codigoUnico) {
        this.codigoUnico = codigoUnico;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public int getIdGrupos() {
        return idGrupos;
    }

    public void setIdGrupos(int idGrupos) {
        this.idGrupos = idGrupos;
    }

    public int getTipoDocumentoIdTipoDocumento() {
        return tipoDocumentoIdTipoDocumento;
    }

    public void setTipoDocumentoIdTipoDocumento(int tipoDocumentoIdTipoDocumento) {
        this.tipoDocumentoIdTipoDocumento = tipoDocumentoIdTipoDocumento;
    }
    private int idNinos;
    private String nombre;
    private String apellido;
    private Date fechaNacimiento;
    private int codigoUnico;
    private String numeroDocumento;
    private int idGrupos;
    private int tipoDocumentoIdTipoDocumento;

    
}
