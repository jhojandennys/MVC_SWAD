<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="model.Proveedor, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Proveedores</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    Proveedor C = new Proveedor();
    List<Proveedor> lista = new LinkedList<>();
    lista = C.getProveedores();
%>


<h1 class="text-black text-4xl font-bold">Proveedores</h1>
<div class="my-4"> 
    <table id="tablaProveedor" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>RUC</th>
                <th>Razon Social</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Proveedor prov : lista) {

            %>
            <tr class="bg-neutral-3000 text-center py-2  border-stone-500 border-y">                <td class="hidden"><%=prov.getId()%></td>
                <td><%= prov.getRuc()%></td>
                <td class="border-x border-stone-500"><%= prov.getEmpresa()%></td>
                <td><%= prov.getDireccion()%>
                <td class="border-x border-stone-500"><%= prov.getTelefono()%></td>
                <td  class="border-e border-stone-500"><%= prov.getCorreo()%></td>
                <td class="text-xl flex justify-center items-center gap-2 "             
                    data-id="<%= prov.getId()%>"
                    data-empresa="<%= prov.getEmpresa()%>"
                    data-telefono="<%= prov.getTelefono()%>"
                    data-ruc="<%= prov.getRuc()%>"
                    data-direc="<%= prov.getDireccion()%>"
                    data-email="<%= prov.getCorreo()%>">
                    <i class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       onclick="editProveedor(this.parentElement)"></i>
                    <i onclick="detailsProveedor(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                    <i onclick="deleteProveedor(this.parentElement)" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></i>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<button onclick="showModalCreate()" class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
        px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Proveedor
</button>
<div id="modalCreate" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalCreate()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Agregar Proveedor</h2>
        <form action="/Proveedor/add" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="crazon" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Razon Social</label>
                    <input id="crazon" name="razon" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cencargado" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Encargado</label>
                    <input id="cencargado" name="encargado" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="cruc" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">RUC:</label>
                    <input id="cruc" name="ruc" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cdirec" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Direccion:</label>
                    <input id="cdirec" name="direccion" type="text" class="bg-secondary-800 outline-none 
                           font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>

            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="cemail" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Correo:</label>
                    <input id="cemail" name="email" type="email" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 

            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
                <button onclick="closeModalCreate()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Registrar</button>
            </div>
        </form>
    </div>
</div>

<div id="modalEdit" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalEdit()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Editar Proveedor</h2>
        <form action="/Proveedor/edit" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <input id="eid" name="id" type="text" hidden="true">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="erazon" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Razon Social:</label>
                    <input id="erazon" name="razon" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="eencargado" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Encargado</label>
                    <input id="eencargado" name="encargado" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="eruc" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">RUC:</label>
                    <input id="eruc" name="ruc" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="edirec" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Direccion:</label>
                    <input id="edirec" name="direccion" type="text" class="bg-secondary-800 outline-none 
                           font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                    <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                        <label for="ecorreo" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Correo:</label>
                        <input id="ecorreo" name="email" type="email" class="bg-secondary-800 outline-none 
                               px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                    </div> 

                </div>

            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
                <button onclick="closeModalEdit()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Guardar Cambios</button>
            </div>
        </form>
    </div>
</div>
<div id="modalDelete" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[25rem] relative">
        <i onclick="closeModalDelete()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl text-center">Eliminar Proveedor</h2>
        <form action="/Proveedor/delete" method="post" class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este proveedor?</p>
            <input id="did" name="id" type="text" hidden>
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Razon:
                    </dt>
                    <dd class="text-end text-left" id="drazon">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Encargado:
                    </dt>
                    <dd class="text-end text-left" id="dencargado">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        RUC:
                    </dt>
                    <dd class="text-end text-left" id="druc">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Direccion:
                    </dt>
                    <dd class="text-end text-left" id="ddirec">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Email:
                    </dt>
                    <dd class="text-end text-left" id="demail">    
                    </dd>
                </div>


            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-between">
                <button onclick="closeModalDelete()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Eliminar</button>
            </div>
        </form>
    </div>
</div>
<div id="modalDetails" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[25rem] relative">
        <i onclick="closeModalDetails()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl text-center">Detalles Proveedor</h2>
        <div  class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Razon:
                    </dt>
                    <dd class="text-end text-left" id="ddrazon">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Encargado:
                    </dt>
                    <dd class="text-end text-left" id="ddencargado">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        RUC:
                    </dt>
                    <dd class="text-end text-left" id="ddruc">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Direccion:
                    </dt>
                    <dd class="text-end text-left" id="dddirec">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Email:
                    </dt>
                    <dd class="text-end text-left" id="ddemail">    
                    </dd>
                </div>


            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-between">
                <button onclick="closeModalDetails()" type="button" class="hover:bg-blue-800 cursor-pointer transition-all duration-500 bg-blue-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Volver</button>

            </div>
        </div>
    </div>
</div>
<script>
    const editProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';


        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('eid').value = id;
        document.getElementById('erazon').value = empresa;
        document.getElementById('eencargado').value = encargado;
        document.getElementById('eruc').value = ruc;
        document.getElementById('edirec').value = direc;
        document.getElementById('ecorreo').value = email;

        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('did').value = id;
        document.getElementById('drazon').textContent = empresa;
        document.getElementById('dencargado').textContent = encargado;
        document.getElementById('druc').textContent = ruc;
        document.getElementById('ddirec').textContent = direc;
        document.getElementById('demail').textContent = email;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('ddrazon').textContent = empresa;
        document.getElementById('ddencargado').textContent = encargado;
        document.getElementById('ddruc').textContent = ruc;
        document.getElementById('dddirec').textContent = direc;
        document.getElementById('ddemail').textContent = email;
        //Asegúrate de ajustar los demás campos según sea necesario
        // Muestra el modal de edición
        const modal = document.getElementById('modalDetails');
        modal.classList.remove('hidden');
    };
    const closeModalDetails = () => {
        limpiarModalDetails();
        const modal = document.getElementById('modalDetails');
        modal.classList.add('hidden');
    };
    const closeModalDelete = () => {
        limpiarModalDelete();
        const modal = document.getElementById('modalDelete');
        modal.classList.add('hidden');
    };
    const closeModalEdit = () => {
        limpiarModalEdit();
        const modal = document.getElementById('modalEdit');
        modal.classList.add('hidden');
    };
    const showModalCreate = () => {
        limpiarModalCreate();
        const modal = document.getElementById('modalCreate');
        modal.classList.remove('hidden');
    };
    const closeModalCreate = () => {
        const modal = document.getElementById('modalCreate');
        modal.classList.add('hidden');
        limpiarModalCreate();
    };
    const limpiarModalDetails = () => {
        document.getElementById('ddrazon').value = '';
        document.getElementById('ddencargado').value = '';
        document.getElementById('ddruc').value = '';
        document.getElementById('dddirec').value = '';
        document.getElementById('ddemail').value = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('drazon').value = '';
        document.getElementById('dencargado').value = '';
        document.getElementById('druc').value = '';
        document.getElementById('ddirec').value = '';
        document.getElementById('demail').value = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('crazon').value = '';
        document.getElementById('cencargado').value = '';
        document.getElementById('cruc').value = '';
        document.getElementById('cdirec').value = '';
        document.getElementById('cemail').value = '';
    };
    const limpiarModalEdit = () => {
        document.getElementById('erazon').value = '';
        document.getElementById('eencargado').value = '';
        document.getElementById('eruc').value = '';
        document.getElementById('edirec').value = '';
        document.getElementById('ecorreo').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaProveedor').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [1,6]},
                {searchable: false, targets: [2,6]},
                {width: "12%", targets: [1,4,6]},
                {width: "24%", targets: [3,2]}

            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun proveedor encontrado",
                infoEmpty: "No hay registros disponibles",
                infoFiltered: "(filtrando desde _MAX_ registros totales)",
                info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros."
            }

        });
        // Crea un nuevo div
        const div = document.createElement('DIV');
        // div.classList.add('overflow-auto');
        div.classList.add('snap-none');
        div.classList.add('scroll-p-0');
        div.classList.add('w-full');
        div.classList.add('rounded-md');
        div.classList.add('tabla-citas');
        div.id = 'newParentDiv';
        // Obtén la tabla original
        const table = document.getElementById('tablaProveedor');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>