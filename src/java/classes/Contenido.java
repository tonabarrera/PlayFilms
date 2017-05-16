/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tona
 */
public class Contenido {
    String nombre;
    int tipo;
    int categoria;
    String descripcion;
    float calificacion;
    int id;
    public Contenido() {
        
    }
    public Contenido(ResultSet rs) throws SQLException {
        rs.first();
        this.nombre = rs.getString("nombre");
        this.tipo = rs.getInt("nombre");
        this.categoria = rs.getInt("nombre");
        this.calificacion = rs.getFloat("nombre");
        this.id = rs.getInt("nombre");
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
