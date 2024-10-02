<%@page import="model.Producto"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<head>
    <title>Productos</title>
</head>


<div class="flex">
    <div class="w-2/12 p-4 bg-gray-100">
        <div class="mb-4">
            <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
            <input id="price" type="range" class="w-full h-2 bg-gray-300 rounded-lg appearance-none cursor-pointer" min="0" max="500" step="10">
            <span class="text-sm text-gray-500">$340</span>
        </div>

        <!-- Filtro por Color -->
        <div class="mb-7">
            <h3 class="text-sm font-medium text-gray-700">Filtrar por Color</h3>
            <div class="flex flex-col space-y-2">
                <label class="inline-flex items-center">
                    <input type="checkbox" class="form-checkbox text-blue-500" value="rojo">
                    <span class="ml-2 text-gray-700">Rojo</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" class="form-checkbox text-blue-500" value="azul">
                    <span class="ml-2 text-gray-700">Azul</span>
                </label>
                <label class="inline-flex items-center">
                    <input type="checkbox" class="form-checkbox text-blue-500" value="verde">
                    <span class="ml-2 text-gray-700">Verde</span>
                </label>
            </div>
        </div>
    </div>

    <div class="w-10/12 p-4">
        <h1 class="text-primario text-center text-2xl">
            <span class="block text-5xl">Productos Actuales</span>
        </h1>
        <div class="flex items-start w-full justify-end gap-1 mb-4  font-semibold">
            <button class="px-3 py-1 border-b-yellow-500 border-b-4 text-yellow-500  ">Camas</button>
            <button class="px-3 py-1 bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700 ">Box</button>
            <button class="px-3 py-1 bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700 ">Dormitorios</button>
            <button class="px-3 py-1 bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700 ">Colchones</button>
        </div>


        <!--<div class="w-full mb-4 bg-white shadow-md border border-gray-200 py-4 px-4 flex justify-end items-start">

            <div class="flex flex-nowrap space-x-2">
                <button class="px-2 py-1 bg-gray-300 text-gray-700 rounded">1</button>
                <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">2</button>
                <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">3</button>
            </div>
        </div>
        -->
        <div class="flex items-start w-full justify-end gap-1 mb-4 font-semibold">
            <%-- Suponiendo que tienes una lista de categorías --%>
            <%
                // Obtenemos la lista de categorías desde el DAO
                List<Categoria> categorias = new Categoria().getCategories();
                long categoriaSeleccionada = 0;
                String categoriaParam = request.getParameter("idCategoria");
                if (categoriaParam != null) {
                    categoriaSeleccionada = Long.parseLong(categoriaParam);
                }
            %>
            <% for (Categoria categoria : categorias) {%>
            <form method="get" action="?pagina=productos" style="display:inline;"> 
                <input type="hidden" name="idCategoria" value="<%= categoria.getId()%>">
                <button type="submit" 
                        class="px-3 py-1 
                        <% if (categoria.getId() == categoriaSeleccionada) { %>
                        border-b-yellow-500 border-b-4 text-yellow-500
                        <% } else { %>
                        bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700
                        <% }%>">
                    <%= categoria.getNombre()%>
                </button>
            </form>
            <% }%>
        </div>

        <%
            // Obtener el idCategoria de los parámetros
            String idCategoriaParam = request.getParameter("idCategoria");
            long idCategoria = 0; // Por defecto, mostrar todos los productos
            if (idCategoriaParam != null) {
                idCategoria = Long.parseLong(idCategoriaParam);
            }

            // Obtener los productos según la categoría seleccionada
            List<Producto> productos;
            if (idCategoria > 0) {
                productos = new Producto().getProductosByCategoriaId(idCategoria);
            } else {
                productos = new Producto().getProducts(); // Método que obtiene todos los productos
            }
        %>
        <div class="grid grid-cols-3 xl:grid-cols-4 gap-5">
            <% for (Producto producto : productos) {%>
            <div class="p-4 bg-white border text-center shadow rounded">
                <a href="?pagina=detalle&idProducto=<%= producto.getId()%>" class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">
                    <%= producto.getNombre()%>
                </a>
                <div class="max-h-[250px] flex items-center justify-center h-full object-fit overflow-hidden">
                    <img src="img/<%= producto.getCategoria().getNombre()%>/<%= producto.getImagen()%>" alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>
                <h6 class="text-lg font-medium text-gray-600"><%= producto.getDescripcion()%></h6>
                <p class="text-center font-semibold text-lg">S/<%= producto.getPrecioVenta()%></p>
            </div>
            <% }%>
        </div>
    </div>
</div>
