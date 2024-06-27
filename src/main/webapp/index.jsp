<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
    </head>
    <body id="body" class="font-raleway overflow-x-hidden">     
        <%
            String pagina = request.getParameter("pagina");
        %> 
        <header class="bg-primary-100 w-full h-28 md:h-32  fixed shadow-sm shadow-neutral-700 z-50 ">
            <div class="container h-full flex justify-between p-2 md:p-4 items-center ">
                <a class="w-28 xs:w-32  md:w-40" href="?pagina=inicio">
                    <img class="w-full max-w-32 xs:max-w-36 md:max-w-40" src="./images/Logo.png" alt="img">
                </a>
                <div class="flex gap-2 items-center">
                    <nav class="hidden lg:flex gap-5 mr-5 text-white ">
                        <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="?pagina=inicio">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina == null || pagina.equals("inicio")) { %> text-black <%}%>">Inicio</span>
                        </a>
                        <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="?pagina=nosotros">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("nosotros")) { %> text-black <%}%>">Nosotros</span>
                        </a>
                        <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start " 
                           href="?pagina=servicios">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("servicios")) { %> text-black <%}%>">Servicios</span>
                        </a>
                        <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 
                           flex justify-center items-center  gap-2 md:justify-start  " href="?pagina=reservas">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("reservas")) { %> text-black <%}%>">Reservas</span>
                        </a>
                        <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500
                           flex justify-center items-center  gap-2 md:justify-start" href="?pagina=productos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("productos")) { %> text-black <%}%>">Productos</span>
                        </a>
                    </nav>
                    <div class="relative">
                        <button style="all:unset;" onclick="clickLogButton()">
                            <i class="fa-solid fa-user text-2xl text-white cursor-pointer hover:text-black transition-all duration-500"></i>
                        </button>
                        <div id="logbutton"  class="hidden absolute bg-white text-black right-0 top-12 w-40 flex flex-col">
                            <a class=" transition-all text-center duration-500 w-full hover:text-white hover:bg-black
                               py-2  font-semibold" href="/auth/login.jsp">Iniciar Sesion</a>
                        </div>
                    </div>
                    <div class="overflow-hidden lg:hidden">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round"
                             stroke-linejoin="round" class="text-3xl lg:hidden hover:text-black transition-all duration-500 
                             cursor-pointer text-white " height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                        <line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line>
                        <line x1="4" x2="20" y1="18" y2="18"></line>
                        </svg>
                        <nav class="fixed min-h-screen top-0 right-0 bg-primary-300 flex flex-col max-w-96 duration-500
                             overflow-hidden w-full px-8 py-20 z-50 gap-3 translate-x-full ">
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500
                               flex justify-center items-center  gap-2 md:justify-start" href="?pagina=inicio">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <% if (pagina == null || pagina.equals("inicio")) { %> text-black <%}%>">Inicio</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="?pagina=nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <% if (pagina != null && pagina.equals("nosotros")) { %> text-black <%}%>">Nosotros</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="?pagina=servicios">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full<% if (pagina != null && pagina.equals("servicios")) { %> text-black <%}%>">Servicios</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="?pagina=reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full<% if (pagina != null && pagina.equals("reservas")) { %> text-black <%}%>">Reservas</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex 
                               justify-center items-center  gap-2 md:justify-start" href="?pagina=productos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full<% if (pagina != null && pagina.equals("productos")) { %> text-black <%}%>">Productos</span>
                            </a>
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 1024 1024" 
                                 fill-rule="evenodd" class="absolute text-neutral-700 top-10 text-3xl right-4 hover:text-black
                                 transition-all cursor-pointer " height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M799.855 166.312c.023.007.043.018.084.059l57.69 57.69c.041.041.052.06.059.084a.118.118 0 
                                  0 1 0 .069c-.007.023-.018.042-.059.083L569.926 512l287.703 287.703c.041.04.052.06.059.083a
                                  .118.118 0 0 1 0 .07c-.007.022-.018.042-.059.083l-57.69 57.69c-.041.041-.06.052-.084.059a.
                                  118.118 0 0 1-.069 0c-.023-.007-.042-.018-.083-.059L512 569.926 224.297 857.629c-.04.041-.
                                  06.052-.083.059a.118.118 0 0 1-.07 0c-.022-.007-.042-.018-.083-.059l-57.69-57.69c-.041-.041-
                                  .052-.06-.059-.084a.118.118 0 0 1 0-.069c.007-.023.018-.042.059-.083L454.073 512 166.371 224
                                  .297c-.041-.04-.052-.06-.059-.083a.118.118 0 0 1 0-.07c.007-.022.018-.042.059-.083l57.69-57.
                                  69c.041-.041.06-.052.084-.059a.118.118 0 0 1 .069 0c.023.007.042.018.083.059L512 454.073l287
                                  .703-287.702c.04-.041.06-.052.083-.059a.118.118 0 0 1 .07 0Z"></path>
                            </svg>
                        </nav>
                        <div class="w-screen z-0 h-screen absolute bg-black opacity-40 top-0 left-0 transition-all duration-500 hidden">
                        </div>

                    </div>

                </div>

            </div>
        </header>
        <main class="pt-28 md:pt-32 ">
            <%  if (pagina == null || pagina.equals("inicio")) {
            %>  <%@include file = "/inicio.jsp" %><%
            } else if (pagina != null && pagina.equals("nosotros")) {
            %>  <%@include file = "/nosotros.jsp" %><%
            } else if (pagina != null && pagina.equals("servicios")) {
            %>  <%@include file = "/servicios.jsp" %><%
            } else if (pagina != null && pagina.equals("reservas")) {
            %>  <%@include file = "/reservas.jsp" %><%
            } else if (pagina != null && pagina.equals("productos")) {
            %>  <%@include file = "/productos.jsp" %><%
                }%>
        </main>
        <footer class="bg-primary-100 w-full px-4 py-10">
            <div class="container flex flex-col md:flex-row xl:grid xl:grid-cols-4 md:items-start justify-center text-center gap-2 md:text-left xl:gap-0">
                <a class="w-36 xs:w-36 md:w-1/4 xl:w-auto self-center" href="/">
                    <img class="w-full max-w-36 xs:max-w-36 md:max-w-40" src="./images/Logo.png" alt="img">
                </a>
                <div class="md:w-1/4 xl:w-auto">
                    <h4 class="text-2xl font-bold">Enlaces Rapidos</h4>
                    <ul class="text-white mt-4 text-xl flex flex-col gap-2">
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="?pagina=inicio">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina == null || pagina.equals("inicio")) { %> text-black <%}%>">Inicio</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center  
                               gap-2 md:justify-start" href="?pagina=nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("nosotros")) { %> text-black <%}%>">Nosotros</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="?pagina=servicios">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("servicios")) { %> text-black <%}%>">Servicios</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center  
                               gap-2 md:justify-start  " href="?pagina=reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("reservas")) { %> text-black <%}%>">Reservas</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center  
                               gap-2 md:justify-start  " href="?pagina=productos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("productos")) { %> text-black <%}%>">Productos</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="md:w-1/4 xl:w-auto">
                    <h4 class="text-2xl font-bold">Reservar</h4>
                    <ul class="text-white mt-4 text-xl flex flex-col gap-2">
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">Aseo</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">Esterilización</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">Tratamientos</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">Vacunas</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center  
                               gap-2 md:justify-start  " href="/reservas">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">Emergencias</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="md:w-1/4 xl:w-auto">
                    <h4 class="text-2xl font-bold">Contáctanos</h4>
                    <ul class="text-white mt-4 text-xl flex flex-col gap-2">
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/ulr">
                                <i class="fa-solid fa-phone"></i>
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">+51 980 771 290</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center  
                               gap-2 md:justify-start  " href="/ulr">
                                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="text-2xl min-w-10" height="1em" 
                                     width="1em" xmlns="http://www.w3.org/2000/svg">
                                <path fill="none" d="M0 0h24v24H0z"></path>
                                <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 14H4V8l8 5 8-5v10zm-8-7L4 
                                      6h16l-8 5z"></path>
                                </svg>
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">animaliainfo@gmail.com</span>
                            </a>
                        </li>
                        <li>
                            <a class="text-white hover:text-black font-semibold text-xl  transition-all duration-500 flex justify-center items-center 
                               gap-2 md:justify-start  " href="/ulr">
                                <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" 
                                     class="text-2xl min-w-10" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                <polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon>
                                <line x1="8" y1="2" x2="8" y2="18"></line>
                                <line x1="16" y1="6" x2="16" y2="22"></line>
                                </svg>
                                <span class="font-sans salto md:max-w-40 xl:max-w-full ">15457 Campoy, San Juan de Lurigancho, Lima, Perú</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
        <button class="text-white rounded-full w-12 h-12 md:w-16 md:h-16 flex justify-center items-center text-center bg-primary-300 text-xl md:text-3xl fixed z-20 
                right-4 bottom-4 cursor-pointer transition-all duration-500">
            <i class="fa-solid fa-cart-shopping"></i>
        </button>
        <button class="text-white rounded-full w-12 h-12 md:w-16 md:h-16 flex justify-center items-center bg-green-500 text-2xl md:text-4xl fixed z-20  right-4 
                bottom-20 cursor-pointer transition-all duration-500 md:bottom-24">
            <i class="fa-brands fa-whatsapp"></i>
        </button>
    </div>
</body>
</html>
