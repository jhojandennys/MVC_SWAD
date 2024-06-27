<%-- 
    Document   : nuevo
    Created on : 11 nov. 2023, 10:32:58
    Author     : Estudiante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo cliente</title>
    </head>
    <body>
        <h2>Nuevo Cliente</h2>
        <form action="Procesa" method="post">
            <!-- 
                cliente_id varchar(20) primary key,
                cliente_password varchar(30),
                cliente_nombre varchar(50),
                cliente_direccion varchar(100),
                cliente_telefono int
            -->
            <input type="hidden" name="grupo" value="cliente">
            <input type="hidden" name="opcion" value="agregar">
            ID <br>
            <input type="text" name="cliente_id" class="form-control" required>
            password <br>
            <input type="password" name="cliente_password" class="form-control" required>
            Nombre <br>
            <input type="text" name="cliente_nombre" class="form-control" required>
            Direccion <br>
            <input type="text" name="cliente_direccion" class="form-control" required>
            Telefono <br>
            <input type="tel" name="cliente_telefono" class="form-control" required>            
            <input type="submit" class="btn btn-success">
        </form>
    </body>
</html>
