<%-- 
    Document   : Admin Layout
    Created on : 4 nov. 2023, 13:06:56
    Author     : Hansel Chavez Garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="referencias.jsp" %>
        <title>Admin</title>
    </head>
    <%
        String pagina = request.getParameter("pagina");
    %>
    <body>        
        <header class="min-h-24 flex items-center justify-between gap-2 bg-secondary-800 text-white py-4 px-4">
            <div class="flex gap-2 items-center"><div class="hover:bg-secondary-900 rounded-full transition-all duration-500 p-2">
                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" 
                         stroke-linejoin="round" class="text-2xl md:hidden   cursor-pointer text-white " height="1em" 
                         width="1em" xmlns="http://www.w3.org/2000/svg">
                    <line x1="4" x2="20" y1="12" y2="12"></line>
                    <line x1="4" x2="20" y1="6" y2="6"></line>
                    <line x1="4" x2="20" y1="18" y2="18"></line>
                    </svg>
                </div>
                <div class="max-w-24">
                    <a class="max-w-12 max-h-full" href="/admin/">
                        <img src="./images/Logo.png" alt="Logo" class="w-full">
                    </a>
                </div>
            </div>
            <div class="flex gap-2 items-center">
                <div class="text-2xl p-2 rounded-full hover:bg-secondary-900 duration-500 transition-all cursor-pointer">
                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em"
                         width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" 
                          d="M160 136c0-30.62 4.51-61.61 16-88C99.57 81.27 48 159.32 48 248c0 119.29 96.71
                          216 216 216 88.68 0 166.73-51.57 200-128-26.39 11.49-57.38 16-88 16-119.29 0-216-96.71-216-216z">

                    </path>
                    </svg>
                </div>
                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 496 512" 
                     class="text-3xl transition-all duration-500 cursor-pointer hover:text-contrast-600" 
                     height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path d="M248 8C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm0 96c48.6 0 88 39.4 88 
                      88s-39.4 88-88 88-88-39.4-88-88 39.4-88 88-88zm0 344c-58.7 0-111.3-26.6-146.5-68.2 18.8-35.4 
                      55.6-59.8 98.5-59.8 2.4 0 4.8.4 7.1 1.1 13 4.2 26.6 6.9 40.9 6.9 14.3 0 28-2.7 40.9-6.9 2.3-.7 
                      4.7-1.1 7.1-1.1 42.9 0 79.7 24.4 98.5 59.8C359.3 421.4 306.7 448 248 448z"></path>
                </svg>
            </div>
        </header>
        <main class="w-full flex min-h-[calc(100vh-6rem)] relative">
            <aside class="-left-72 bg-secondary-800 transition-all duration-700 absolute md:static min-h-[calc(100vh-6rem)] 
                   min-w-64 md:block w-64  text-white ">
                <ul>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("dashboard")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"  href="admin.jsp?pagina=dashboard">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" 
                                 width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" d="M0 0h24v24H0z"></path>
                            <path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Dashboard</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center 
                           gap-3 md:justify-start  w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("cita")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>" 
                           href="admin.jsp?pagina=cita">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 
                                  2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5m9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 
                                  .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5M11.5 7a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z">

                            </path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Citas</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-secondary-900 rounded-r-3xl hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("usuario")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>" href="admin.jsp?pagina=usuario">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg"><path d="M256 288A144 144 0 1 0 256 0a144 144 0 1 0 0 288zm-94.7 32C72.2 320 
                                 0 392.2 0 481.3c0 17 13.8 30.7 30.7 30.7H481.3c17 0 30.7-13.8 30.7-30.7C512 392.2 439.8 320 350.7 320H161.3z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Usuarios</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("paciente")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=paciente">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" 
                                 height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M48 0C21.5 0 0 21.5 0 48V256H144c8.8 0 16 7.2 16 16s-7.2 16-16 16H0v64H144c8.8 0 16 7.2 16 
                                  16s-7.2 16-16 16H0v80c0 26.5 21.5 48 48 48H265.9c-6.3-10.2-9.9-22.2-9.9-35.1c0-46.9 25.8-87.8 
                                  64-109.2V271.8 48c0-26.5-21.5-48-48-48H48zM152 64h16c8.8 0 16 7.2 16 16v24h24c8.8 0 16 7.2 16 
                                  16v16c0 8.8-7.2 16-16 16H184v24c0 8.8-7.2 16-16 16H152c-8.8 0-16-7.2-16-16V152H112c-8.8 0-16-7.2-16-16V120c0-8.8 
                                  7.2-16 16-16h24V80c0-8.8 7.2-16 16-16zM512 272a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM288 477.1c0 
                                  19.3 15.6 34.9 34.9 34.9H541.1c19.3 0 34.9-15.6 34.9-34.9c0-51.4-41.7-93.1-93.1-93.1H381.1c-51.4 0-93.1 41.7-93.1 93.1z">

                            </path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Pacientes</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start  
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("producto")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=producto">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 256 256" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M231.12,107.72a35.91,35.91,0,0,1-46.19,6.8.14.14,0,0,0-.1,0l-70.35,70.36s0,0,0,.08a36,36,0,1,1-66.37
                                  ,22.92,36,36,0,1,1,22.92-66.37.14.14,0,0,0,.1,0l70.35-70.36s0,0,0-.08a36,36,0,1,1,66.37-22.92,36,36,0,0,1,23.27,59.57Z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Productos</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("proveedor")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=proveedor">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 640 512" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M48 0C21.5 0 0 21.5 0 48V368c0 26.5 21.5 48 48 48H64c0 53 43 96 96 96s96-43 96-96H384c0 53 43 96 96 96s96-43 
                                  96-96h32c17.7 0 32-14.3 32-32s-14.3-32-32-32V288 256 237.3c0-17-6.7-33.3-18.7-45.3L512 114.7c-12-12-28.3-18.7-45.3-18.
                                  7H416V48c0-26.5-21.5-48-48-48H48zM416 160h50.7L544 237.3V256H416V160zM112 416a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm368-48a48 
                                  48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Proveedores</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("inventario")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=inventario">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg"><path d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 
                                 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h
                                 -80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16
                                 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Inventario</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("venta")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=venta">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" d="M0 0h24v24H0z"></path>
                            <path d="M17 2H7c-1.1 0-2 .9-2 2v2c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 4H7V4h10v2zm3 16H4c-1.1 0-2-.9-2-2v-1h20v1c0 
                                  1.1-.9 2-2 2zm-1.47-11.81A2.008 2.008 0 0 0 16.7 9H7.3c-.79 0-1.51.47-1.83 1.19L2 18h20l-3.47-7.81zM9.5 16h-1c-.28 0-.5-.22-.
                                  5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm0-2h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm0-2h-1c
                                  -.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm3 4h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.
                                  5-.5.5zm0-2h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm0-2h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 
                                  .5.22.5.5s-.22.5-.5.5zm3 4h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm0-2h-1c-.28 0-.5-.22-.5-.5s.22-.
                                  5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5zm0-2h-1c-.28 0-.5-.22-.5-.5s.22-.5.5-.5h1c.28 0 .5.22.5.5s-.22.5-.5.5z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Ventas</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center  gap-3 md:justify-start w-full 
                           hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("ordencompra")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=ordencompra">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" d="M0 0h24v24H0z"></path>
                            <path d="M14 19.88V22h2.12l5.17-5.17-2.12-2.12zM20 8l-6-6H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H12v-2.95l8-8V8zm-7
                                  1V3.5L18.5 9H13zM22.71 14l-.71-.71a.996.996 0 0 0-1.41 0l-.71.71L22 16.12l.71-.71a.996.996 0 0 0 0-1.41z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Orden de Compra</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("kardex")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900 
                           <%}%>"
                           href="admin.jsp?pagina=kardex">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" 
                                 xmlns="http://www.w3.org/2000/svg">
                            <path d="M464 352H320a16 16 0 0 0-16 16 48 48 0 0 1-96 0 16 16 0 0 0-16-16H48a16 16 0 0 0-16 16v64a64.07 64.07 0 0 0 64 
                                  64h320a64.07 64.07 0 0 0 64-64v-64a16 16 0 0 0-16-16zm15.46-164.12L447.61 68.45C441.27 35.59 417.54 16 384 16H128c-16.8
                                  0-31 4.69-42.1 13.94S67.66 52 64.4 68.4L32.54 187.88A15.9 15.9 0 0 0 32 192v48c0 35.29 28.71 80 64 80h320c35.29 0 64-44.71
                                  64-80v-48a15.9 15.9 0 0 0-.54-4.12zM440.57 176H320a15.92 15.92 0 0 0-16 15.82 48 48 0 1 1-96 0A15.92 15.92 0 0 0 192 176H71
                                  .43a2 2 0 0 1-1.93-2.52L95.71 75c3.55-18.41 13.81-27 32.29-27h256c18.59 0 28.84 8.53 32.25 26.85l26.25 98.63a2 2 0 0 1-1.93 2.52z"></path>
                            </svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Kardex</span>
                        </a>
                    </li>
                </ul>
            </aside>
            <div class=" bg-secondary-900 p-4 w-full md:w-[calc(100%-16rem)]">
                <div> 

                    <%
                        String opcion = request.getParameter("opcion");
                        String correo = request.getParameter("correo");
                        String ruta = "";
                        if (pagina != null && pagina.equals("usuario")) {
                            if (opcion != null && opcion.equals("agregar")) {
                    %><%@include file="usuario/agregar.jsp" %><%
                    } else {
                    %><%@include file="usuario/listar.jsp" %><%                                                    }
                        }
                    %>
                </div>                
            </div>
        </main>

    </body>
</html>
