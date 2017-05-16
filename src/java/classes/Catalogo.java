/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tona
 */
public class Catalogo {
    public ArrayList<Contenido> contenido;
    
    public Catalogo(){
        contenido = new ArrayList<>();
    }
    
    public void setContenido(ResultSet rs) throws SQLException {
        Contenido elemento = new Contenido();
        while(rs.next()){
            elemento.setId(rs.getInt("id"));
            elemento.setNombre(rs.getString("nombre"));
            elemento.setDescripcion(rs.getString("descripcion"));
            elemento.setTipo(rs.getInt("tipo"));
            elemento.setCategoria(rs.getInt("categoria"));
            elemento.setCalificacion(rs.getFloat("calificacion"));
            contenido.add(elemento);
        }
    }
}
