<%-- 
    Document   : adminsite
    Created on : 6/05/2017, 04:20:04 PM
    Author     : tona
--%>

<%@page import="classes.Contenido"%>
<%@page import="classes.Catalogo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.ConnectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String tipo = (String) sesion.getAttribute("tipo");
    ConnectionDB con;
    if(tipo == null || !tipo.equals("admin")) {
        response.sendRedirect("/PlayFilms");
        return;
    } else {
        con = new ConnectionDB();
        con.connect();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sitio del administrador</title>
    </head>
    <body>
        <h1>Administración de contenido</h1>
        <a href="alta_pelicula.jsp">Subir Pelicula</a>
        <a href="alta_serie.jsp">Subir Serie</a>
        <ul>
        <%
            ResultSet rs = con.consultar("call spCatalogo();");
            Catalogo cat = new Catalogo();
            cat.setContenido(rs);
            for(Contenido conte : cat.contenido) { 
        %>
        <li><a href="Contenido?id=<%=conte.getId()%>"><%=conte.getNombre()%></li>
        <%
            }
        %>
        </ul>
        
    </body>
</html>
