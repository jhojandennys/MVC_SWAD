<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="model.Cliente,dao.ClienteDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Clientes</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ClienteDAO C = new ClienteDAO();
    List<Cliente> lista = new LinkedList<>();
    lista = C.getClientes();
%>


<h1 class="text-black text-4xl font-bold">Clientes</h1>

<div class="my-4"> 
    <table id="tablaCliente" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>DNI</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Cliente cl : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=cl.getId()%></td>
                <td><%= cl.getNombre()%></td>
                <td class="border-x border-stone-500"><%= cl.getApellPaterno()%> <%= cl.getApellMaterno()%></td>
                <td><%= cl.getTelefono()%></td>
                <td class="border-x border-stone-500"><%= cl.getCorreo()%></td>
                <td class="border-e border-stone-500"><%= cl.getDni()%></td>
                <td class="text-xl  flex justify-center items-center gap-2 "             
                    data-id="<%= cl.getId()%>"
                    data-nombre="<%= cl.getNombre()%>"
                    data-apPaterno="<%= cl.getApellPaterno()%>"
                    data-apMaterno="<%= cl.getApellMaterno()%>"
                    data-telf="<%= cl.getTelefono()%>"
                    data-correo="<%= cl.getCorreo()%>"
                    data-dni="<%= cl.getDni()%>">
                    <i class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       onclick="editCliente(this.parentElement)"></i>
                    <i onclick="detailsCliente(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                    <i onclick="deleteCliente(this.parentElement)" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></i>
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
    Nuevo Cliente
</button>

<div id="modalCreate" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalCreate()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Agregar Cliente</h2>
        <form action="/Cliente/add" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cnombre" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre: </label>
                    <input id="cnombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cpaterno" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Apell. Paterno:</label>
                    <input id="cpaterno" name="apaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="cmaterno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apell. Materno:</label>
                    <input id="cmaterno" name="amaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="cdni" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Dni:</label>
                    <input id="cdni" name="dni" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="cdirec" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Dirección:</label>
                    <input id="cdirec" name="direccion" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="ctelf" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Telefono:</label>
                    <input id="ctelf" name="telefono" type="text" class="bg-secondary-800 outline-none 
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
        <h2 class="font-bold text-2xl">Editar Cliente</h2>
        <form action="/Cliente/edit" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <input id="eid" name="id" type="text" hidden="true">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="enombre" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre: </label>
                    <input id="enombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="epaterno" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Apell. Paterno:</label>
                    <input id="epaterno" name="apaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="ematerno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apell. Materno:</label>
                    <input id="ematerno" name="amaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>


            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="edni" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Dni:</label>
                    <input id="edni" name="dni" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="edirec" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Dirección:</label>
                    <input id="edirec" name="direccion" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="etelf" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Telefono:</label>
                    <input id="etelf" name="telefono" type="text" class="bg-secondary-800 outline-none 
                           font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
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
        <h2 class="font-bold text-2xl text-center">Eliminar Cliente</h2>
        <form action="/Cliente/delete" method="post" class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este cliente?</p>
            <input id="did" name="id" type="text" hidden="true">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="dnombre">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apell. Paterno:
                    </dt>
                    <dd class="text-end text-left" id="dpaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apell. Materno:
                    </dt>
                    <dd class="text-end text-left" id="dmaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Telefono:
                    </dt>
                    <dd class="text-end text-left" id="dtelf">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Direccion;
                    </dt>
                    <dd class="text-end text-left" id="ddirec">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        DNI:
                    </dt>
                    <dd class="text-end text-left" id="ddni">    
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
        <h2 class="font-bold text-2xl text-center">Detalles Cliente</h2>
        <div  class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="ddnombre">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apell. Paterno:
                    </dt>
                    <dd class="text-end text-left" id="ddpaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apell. Materno:
                    </dt>
                    <dd class="text-end text-left" id="ddmaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Telefono:
                    </dt>
                    <dd class="text-end text-left" id="ddtelf">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Direccion;
                    </dt>
                    <dd class="text-end text-left" id="dddirec">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        DNI:
                    </dt>
                    <dd class="text-end text-left" id="dddni">    
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
    const editCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('eid').value = id;
        document.getElementById('enombre').value = nombre;
        document.getElementById('epaterno').value = paterno;
        document.getElementById('ematerno').value = materno;
        document.getElementById('etelf').value = telf;
        document.getElementById('edirec').value = direc;
        document.getElementById('edni').value = dni;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('did').value = id;
        document.getElementById('dnombre').textContent = nombre;
        document.getElementById('dpaterno').textContent = paterno;
        document.getElementById('dmaterno').textContent = materno;
        document.getElementById('dtelf').textContent = telf;
        document.getElementById('ddirec').textContent = direc;
        document.getElementById('ddni').textContent = dni;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('ddnombre').textContent = nombre;
        document.getElementById('ddpaterno').textContent = paterno;
        document.getElementById('ddmaterno').textContent = materno;
        document.getElementById('ddtelf').textContent = telf;
        document.getElementById('dddirec').textContent = direc;
        document.getElementById('dddni').textContent = dni;
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
        document.getElementById('ddnombre').value = '';
        document.getElementById('ddpaterno').value = '';
        document.getElementById('ddmaterno').value = '';
        document.getElementById('ddtelf').value = '';
        document.getElementById('dddirec').value = '';
        document.getElementById('dddni').value = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('did').value = '';
        document.getElementById('dnombre').value = '';
        document.getElementById('dpaterno').value = '';
        document.getElementById('dmaterno').value = '';
        document.getElementById('dtelf').value = '';
        document.getElementById('ddirec').value = '';
        document.getElementById('ddni').value = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('cnombre').value = '';
        document.getElementById('cpaterno').value = '';
        document.getElementById('cmaterno').value = '';
        document.getElementById('ctelf').value = '';
        document.getElementById('cdirec').value = '';
        document.getElementById('cdni').value = '';
    };
    const limpiarModalEdit = () => {
        document.getElementById('enombre').value = '';
        document.getElementById('epaterno').value = '';
        document.getElementById('ematerno').value = '';
        document.getElementById('etelf').value = '';
        document.getElementById('edirec').value = '';
        document.getElementById('edni').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaCliente').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 3, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [5, 3, 4, 6]},
                {searchable: false, targets: [0, 6]},
                {width: "18%", targets: [2, 5]},
                {width: "14%", targets: [1, 3]},
                {width: "25%", targets: [4]}


            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun cliente encontrado",
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
        const table = document.getElementById('tablaCliente');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>