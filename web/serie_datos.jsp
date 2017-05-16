<%-- 
    Document   : serie_formulario
    Created on : 15/05/2017, 09:32:23 PM
    Author     : tona
--%>
<%
    /*Aqui se podra modificar la serie o borrarla*/
    /*ConnectionDB con = new ConnectionDB();
    con.connect();
    ResultSet rs = con.consultar("select * from contenido where idContenido="+request.getParameter("id"));
    Contenido elemento = new Contenido(rs);*/
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Serie</title>
    </head>
    <body>
        <form action="ModificarContenido" method="post">
            <input type="text" value="<%=request.getParameter("id")%>" disabled>
            <input type="submit" value="Borrar">
        </form>
    </body>
</html>
