<%-- 
    Document   : serie_pelicula
    Created on : 15/05/2017, 09:32:57 PM
    Author     : tona
--%>

<%@page import="classes.Contenido"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /*Aqui se podra modificar la pelicula o borrarla*/
    /*ConnectionDB con = new ConnectionDB();
    con.connect();
    ResultSet rs = con.consultar("select * from contenido where idContenido="+request.getParameter("id"));
    Contenido elemento = new Contenido(rs);*/
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Pelicula</title>
    </head>
    <body>
        <form action="ModificarContenido" method="post">
            <input type="text" value="<%=request.getParameter("id")%>" disabled>
            <input type="submit" value="Borrar">
        </form>
    </body>
</html>
