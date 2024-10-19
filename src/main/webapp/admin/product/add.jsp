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
    ProductoDAO C = new ProductoDAO();
    List<Producto> lista = new LinkedList<>();
    lista = C.getProducts();
    CategoriaDAO CT = new CategoriaDAO();
    List<Categoria> categorias = new LinkedList<>();
    categorias = CT.getCategories();
    ProveedorDAO P = new ProveedorDAO();
    List<Proveedor> proveedores = new LinkedList<>();
    proveedores = P.getProveedores();
    EstadoProductoDAO EP = new EstadoProductoDAO();
    List<EstadoProducto> estados = new LinkedList<>();
    estados = EP.getEstados();
%>


<h1 class="text-4xl font-bold text-black">Agregar Producto</h1>

<form action="/Producto/add" method="post" class="text-black my-6 flex gap-y-4 max-w-[70rem] md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
            <label for="cnombre"class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Nombre</label>
            <input id="cnombre" name="nombre" type="text" class="bg-transparent outline-none font-sans 
                   px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="cdescrip" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Descripcion</label>
            <textarea id="cdescrip" name="descripcion"  class="bg-transparent outline-none 
                      font-sans px-2 py-1 w-full border border-secondary-300 rounded-md "  rows="3"></textarea>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="cestado" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Estado</label>
            <select  name="estado" id="cestado" class="bg-transparent outline-none 
                     font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " >
                <%
                    if (lista != null && estados != null) {
                        for (EstadoProducto ep : estados) {

                %>
                <option value="<%=ep.getId()%>" ><%=ep.getNombre()%> </ </option>
                <%                                }
                    }
                %>
            </select>
        </div>
    </div>
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="ccateg" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Categoria</label>
            <select  name="categoria" id="ccateg" class="bg-transparent outline-none 
                     font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " >
                <%
                    if (lista != null && categorias != null) {
                        for (Categoria ct : categorias) {

                %>
                <option value="<%=ct.getId()%>" ><%=ct.getNombre()%> </ </option>
                <%                                }
                    }
                %>
            </select>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="cprov" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Proveedor</label>
            <select  name="proveedor" id="cprov" class="bg-transparent outline-none 
                     font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " >
                <%
                    if (lista != null && proveedores != null) {
                        for (Proveedor p : proveedores) {

                %>
                <option value="<%=p.getId()%>" ><%=p.getEmpresa()%> </ </option>
                <%                                }
                    }
                %>
            </select>
        </div>


        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="ccompra" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Prec. Compra</label>
            <input id="ccompra" name="pcompra" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
        </div> 
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="cventa" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Prec. Venta</label>
            <input id="cventa" name="pventa" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
        </div> 
    </div>

    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=producto" class="hover:bg-red-800 text-white cursor-pointer transition-all duration-500 bg-red-600 
           px-8 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer text-white transition-all duration-500 bg-green-600 
                px-8 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Registrar</button>
    </div>
</form>
