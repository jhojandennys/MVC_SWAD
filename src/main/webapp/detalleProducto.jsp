<%-- 
    Document   : detalleProducto
    Created on : 21 set. 2024, 00:12:55
    Author     : Chavez
--%>

<title>Detalles del Producto</title>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="max-w-[1200px] mt-28 mx-auto p-5">
    <!-- Breadcrumb -->
    <div class="text-sm mb-4">
        <a href="?pagina=productos" class=" text-black hover:text-blue-600 transition-all duration-500 easy-in-out">Productos</a> 
        <span class="mx-2"> >> </span>
        <span class="text-gray-600 ">Nombre Producto</span>
    </div>

    <div class="flex w-auto mx-auto flex-wrap md:flex-nowrap gap-5">
        <!-- Left Section: Image Gallery -->
        <div class="flex flex-row gap-4 items-start">
            <div class="w-[30rem] border-gray-400 h-[30rem] border p-4"> 
                <img src="img/Camas/Cama1.5Jade.jpg" alt="Cama" class="object-cover w-full h-full ">
            </div>
            <div class="flex flex-col gap-2.5 items-start justify-center">
                <img src="img/Camas/Cama1.5Jade.jpg" alt="Thumbnail" class="w-28 border-gray-400  h-28 object-cover border">
                <img src="img/Camas/Cama1.5Jade.jpg" alt="Thumbnail" class="w-28 border-gray-400  h-28 object-cover border">
                <img src="img/Camas/Cama1.5Jade.jpg" alt="Thumbnail" class="w-28 border-gray-400  h-28 object-cover border">
                <img src="img/Camas/Cama1.5Jade.jpg" alt="Thumbnail" class="w-28 border-gray-400  h-28 object-cover border">
            </div>
        </div>

        <!-- Right Section: Product Info -->
        <div class="flex-1">
            <h1 class="text-2xl font-bold">Cama Box gris 1.5 PLZ</h1>
            <p class="text-lg text-green-600 mb-2">S/512</p>
            <p class="text-gray-700 mb-4">Estructura interna en madera | La madera Cuenta con tratamiento de secado al horno|Perfecto para cachudos
                |Forrado en tela velvet en los lados y notex en la tapa | Cuenta con 4 pernos para la adaptación de cabeceros | 4 patas cromadas +
                | Estructura interna en madera pino y nordex de 3m.m | Espuma de 2 pulgadas | Tapizada en tela velvet | 18 botones en la tapa</p>

            <!-- Medidas -->
            <div class="mb-4">
                <span class="font-bold">Cantidad:</span>
                <input type="number" value="2" min="1" max="5" class="w-16 ml-2 border p-1 text-center">
            </div>

            <!-- Calificación -->
            <div class="mb-4">
                <span class="font-bold">Calificación:</span>
                <div class="inline-block ml-2">
                    <span class="text-yellow-400">&#9733;</span>
                    <span class="text-yellow-400">&#9733;</span>
                    <span class="text-yellow-400">&#9733;</span>
                    <span class="text-gray-400">&#9733;</span>
                    <span class="text-gray-400">&#9733;</span>
                </div>
            </div>

            <!-- Código de Producto -->
            <p class="mb-4"><strong>Cod:</strong> PROD0001</p>

            <!-- Botones -->
            <div class="flex gap-4 mb-4">
                <a href="#" class="hover:bg-green-600 easy-in-out duration-500 transition-all bg-green-500 flex gap-2 text-white px-4 py-2 rounded-md flex items-center">
                    <i class="fa-brands fa-whatsapp text-2xl"></i>
                    Compra por Whatsapp
                </a>
                <button class="border easy-in-out duration-500 transition-all hover:border-red-400  px-4 py-2 rounded-md gap-2 flex items-center">
                    <i class="fa-solid fa-heart text-2xl text-red-700"></i>
                    Añadir a Favoritos
                </button>
            </div>

            <!-- Compartir -->
            <div class="flex items-center gap-3 mb-6">
                <span class="font-bold">Compartir:</span>
                <a href="#" class="text-blue-600"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-gray-600"><i class="fas fa-times"></i></a>
            </div>

            <!-- Características del producto -->

        </div>
    </div>
    <p class=" border-t border-gray-400 my-4 block"></p>
    <div>
        <h2 class="text-xl mt-4 font-bold mb-2">Características del producto</h2>
        <ul class="ml-8 list-disc text-gray-600 flex gap-2 flex-col">
            <li>
                Diseño Moderno: Cama con un diseño contemporáneo que presenta una cabecera rectangular grande con detalles capitonados, aportando un toque de elegancia y sofisticación.
            </li>
            <li>
                Tapizado de Calidad: Estructura y cabecera tapizadas en tela de color gris oscuro, ofreciendo una apariencia suave y una durabilidad excepcional.
            </li>
            <li>
                Detalles Elegantes: La cabecera cuenta con un acabado capitoné que añade un aspecto clásico y atemporal, ideal para cualquier decoración de dormitorio.
                Perfecto para escolares 
            </li>
            <li>
                Patas Contemporáneas: Soportada por cuatro patas cilíndricas de cromo visibles que brindan un contraste moderno y mejoran la estética general de la cama.
            </li>
            <li>
                Construcción Robusta: La cama está diseñada para ofrecer un soporte firme y una larga vida útil, gracias a su sólida construcción y materiales de alta calidad.
            </li>
        </ul>
    </div>

    <h2 class="text-xl font-bold mb-4 mt-4">Clientes que vieron este producto también vieron</h2>
    <div class="flex items-center justify-between mt-8">
        <!-- Left Arrow -->
        <button class="text-2xl">&#10094;</button>

        <!-- Product Cards Row 1 -->
        <div class="flex overflow-x-auto space-x-4">
            <div class="min-w-[150px]">
                <img src="img/Productos/1.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                </div>
            </div>
            <div class="min-w-[150px]">
                <img src="img/Productos/2.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
            </div>
            <div class="min-w-[150px]">
                <img src="img/Productos/3.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
            </div>
            <div class="min-w-[150px]">
                <img src="img/Productos/4.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
            </div>


            <!-- Repeat for more products -->
        </div>

        <!-- Right Arrow -->
        <button class="text-2xl">&#10095;</button>
    </div>

    <!-- Section 2: Tenemos más productos similares para ti -->
    <h2 class="text-xl font-bold mt-8 mb-4">Tenemos más productos similares para ti</h2>
    <div class="flex items-center justify-between mt-8">
        <!-- Left Arrow -->
        <button class="text-2xl">&#10094;</button>

        <!-- Product Cards Row 2 -->
        <div class="flex overflow-x-auto space-x-4">
            <div class="min-w-[150px]">
                <img src="img/Productos/7.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                </div>
            </div>
            <div class="min-w-[150px]">
                <img src="img/Productos/8.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
            </div>
            <div class="min-w-[150px]">
                <img src="img/Productos/13.png" alt="Producto" class="w-full h-40 object-cover">
                <p class="font-bold">Dayanara</p>
                <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                <p class="text-lg font-semibold text-gray-600">$799</p>
                <div class="flex">
                    <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                </div>
            </div>

            <!-- Repeat for more products -->
        </div>

        <!-- Right Arrow -->
        <button class="text-2xl">&#10095;</button>
    </div>


    <div class="mx-auto border shadow-xl mt-10 p-6 ">
        <!-- Title -->
        <h2 class="text-2xl font-bold mb-4">Puntuación</h2>

        <!-- General Rating Section -->
        <div class="flex flex-row justify-between mb-4">

            <div class="flex items-center">
                <div>
                    <p class="text-lg">Calificación General:</p>
                    <div class="flex text-yellow-400">
                        <!-- Star icons for rating -->
                        <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                    </div>
                </div>
                <div class="text-5xl font-semibold ml-6">3/5</div>
            </div>
            <div class="flex justify-end ">
                <div class="px-4 flex items-center flex-col justify-center ">
                    <p class="text-lg">60</p>
                    <p class="text-gray-600">Comentarios</p>
                </div>
                <div class="border-x  flex items-center flex-col justify-center border-x-black px-4">
                    <p class="text-lg">0</p>
                    <p class="text-gray-600">Preguntas</p>
                </div>
                <div class="px-4 flex items-center flex-col justify-center ">
                    <p class="text-lg">0</p>
                    <p class="text-gray-600">Respuestas</p>
                </div>
            </div>

        </div>

        <!-- Individual Reviews -->
        <div class="space-y-6">
            <!-- Review 1 -->
            <div>
                <div class="flex items-center space-x-2">
                    <p class="font-bold">Gian Valdivia</p>
                    <div class="flex text-yellow-400">
                        <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                    </div>
                </div>
                <p class="text-gray-700">
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                </p>
            </div>

            <!-- Review 2 -->
            <div>
                <div class="flex items-center space-x-2">
                    <p class="font-bold">Kelvin Vasquez</p>
                    <div class="flex text-yellow-400">
                        <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                    </div>
                </div>
                <p class="text-gray-700">
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                </p>
            </div>

            <!-- Review 3 -->
            <div>
                <div class="flex items-center space-x-2">
                    <p class="font-bold">Seth Lopez</p>
                    <div class="flex text-yellow-400">
                        <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                    </div>
                </div>
                <p class="text-gray-700">
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                </p>
            </div>
        </div>

        <!-- More Comments Button -->
        <div class="mt-6 mx-auto flex items-center justify-center" >
            <button class="px-14 mx-auto font-bold  py-3 bg-gray-100 hover:bg-gray-300 transition-all duration-500 easy-in-out text-black rounded-full">
                Ver más
            </button>
        </div>
    </div>

</div>