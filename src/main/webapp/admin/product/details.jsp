<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="dao.EstadoProductoDAO"%>
<%@page import="dao.ProveedorDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.EstadoProducto"%>
<%@page import="model.Proveedor"%>
<%@page import="model.Categoria"%>
<%@page import="model.Producto, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Productos</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ProductoDAO PD = new ProductoDAO();
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Producto producto = PD.getProductById(id);
%>


<h1 class="text-4xl font-bold text-black">Detalles de Producto</h1>
<div  class="text-black my-6 flex gap-y-4 max-w-[35rem]  flex-col xs:flex-row  flex-wrap w-full">
    <div class="flex flex-col gap-y-2  w-full  ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Nombre:
            </dt>
            <dd class="text-end text-left" id="ddnombre">  
                <%=producto.getNombre()%>
            </dd>
        </div><div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Descripción:
            </dt>
            <dd class="text-end text-left" id="dddescrip">                  
                <%=producto.getDescripcion()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Categoría:
            </dt>
            <dd class="text-end text-left" id="ddcateg">    
                <%=producto.getCategoria().getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Proveedor:
            </dt>
            <dd class="text-end text-left" id="ddprov">    
                <%=producto.getProveedor().getEmpresa()%>
            </dd>
        </div>      
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Estado
            </dt>
            <dd class="text-end text-left" id="ddestado"> 
                <%=producto.getEstado().getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                P.Compra:
            </dt>
            <dd class="text-end text-left" id="ddcompra">    
                <%=producto.getPrecioCompra()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                P.Venta:
            </dt>
            <dd class="text-end text-left" id="ddventa">  
                <%=producto.getPrecioVenta()%>
            </dd>
        </div>
    </div>
    <div class="flex flex-col text-white xs:flex-row w-full gap-4 justify-between">
        <a href="/admin?pagina=producto" class="hover:bg-blue-800 cursor-pointer transition-all duration-500 bg-blue-600 
           px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Volver</a>

    </div>
</div>