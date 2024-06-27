<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="model.Usuario, java.util.List, java.util.LinkedList" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Clientes</title>        
</head>
<%
    Usuario C = new Usuario();
    List<Usuario> lista = new LinkedList<>();
    lista = C.getUsers();
%>


<div class="container">            
    <h2>Listado de clientes</h2>
    <a href="Procesa?grupo=cliente&opcion=agregar" class="btn btn-primary">Nueva Venta</a>
    <br><br>
    <table class="table table-light table-striped table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Correo</th>
                <th>Telefono</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (lista != null) {
                    for (int i = 0; i < lista.size(); i++) {
            %>                
            <tr>
                <td><%= lista.get(i).getId()%></td>
                <td><%= lista.get(i).getNombre()%></td>
                <td><%= lista.get(i).getApellidoPat()%>  <%= lista.get(i).getApellidoMat()%></td>
                <td><%= lista.get(i).getCorreo()%></td>
                <td><%= lista.get(i).getTelefono()%></td>
                <td><a href="dashboard.jsp?grupo=cliente&opcion=editar&cliente_id=<%= lista.get(i).getId()%>" class="btn btn-warning">Editar</a></td>
                <td><a href="dashboard.jsp?grupo=cliente&opcion=eliminar&cliente_id=<%= lista.get(i).getId()%>" class="btn btn-danger">Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
