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


        <div class="w-full mb-4 bg-white shadow-md border border-gray-200 py-4 px-4 flex justify-end items-start">

            <div class="flex flex-nowrap space-x-2">
                <button class="px-2 py-1 bg-gray-300 text-gray-700 rounded">1</button>
                <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">2</button>
                <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">3</button>
            </div>
        </div>

        <div class="grid grid-cols-3 xl:grid-cols-4 gap-5">
            <!-- Producto 1 -->
            <div class="p-4 bg-white border text-center shadow rounded">
                <a href="?pagina=detalle"  class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Cama Tornillo 2plz</a>
                <div class="max-h-[250px] flex items-center justify-center h-full object-fit overflow-hidden">
                    <img src="img/Camas/Cama1.5Espacio.jpg"  alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>                
                <h6 class="text-lg font-medium text-gray-600">Cama Tornillo con cabecera espaciadora</h6>
                <p class="text-center font-semibold text-lg">S/900.00</p>
            </div>

            <!-- Producto 2 -->
            <div class="p-4 bg-white text-center border shadow rounded">
                <a href="?pagina=detalle"  class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Cama Jade 1.5plz</a>
                <div class="max-h-[250px] flex items-center justify-center h-full object-fit overflow-hidden">
                    <img src="img/Camas/Cama1.5Jade.jpg"  alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>            
                <h6 class="text-lg font-medium text-gray-600">Cama Jade de 1.5 plazas</h6>
                <p class="text-center font-semibold text-lg">S/700.00</p>
            </div>

            <!-- Producto 3 -->
            <div class="p-4 bg-white text-center border shadow rounded">
                <a href="?pagina=detalle"  class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Cama con Cajones</a>
                <div class="max-h-[250px] object-fit overflow-hidden">
                    <img src="img/Camas/Cama1.5Madera.jpg"alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>
                <h6 class="text-lg font-medium text-gray-600">Cama con cajones</h6>
                <p class="text-center font-semibold text-lg">S/549.99.00</p>
            </div>

            <!-- Producto 4 -->
            <div class="p-4 bg-white text-center border shadow rounded">
                <a href="?pagina=detalle"  class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Sofá cama matrimonial</a>
                <div class="max-h-[250px] object-fit overflow-hidden">
                    <img src="img/Camas/Cama1.5N.jpg" alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>
                <h6 class="text-lg font-medium text-gray-600">Sofá que se convierte en cama tamaño matrimonial</h6>
                <p class="text-center font-semibold text-lg">S/899.99.00</p>
                <button>Comprar</button>
            </div>

            <!-- Producto 5 -->
            <div class="p-4 bg-white border text-center shadow rounded">
                <a href="?pagina=detalle" class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Cama 1plz Tornillo Clasica</a>
                <div class="max-h-[250px] object-fit overflow-hidden">
                    <img  src="img/Camas/Cama1.5Tornillo.jpg" alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                </div>
                <h6 class="text-lg font-medium text-gray-600">Cama clasica tornillo luminoza</h6>
                <p class="text-center font-semibold text-lg">S/600.00</p>
            </div>

            <!-- Producto 6 -->
            <div class="p-4 bg-white border text-center shadow rounded">
                <a href="?pagina=detalle"  class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">Cama Queen 1.5plza>
                    <div class="max-h-[250px] object-fit overflow-hidden">
                        <img src="img/Camas/Cama1.5W.jpg" alt="Producto" class="w-2/3 mx-auto h-auto object-cover mb-2">
                    </div>
                    <h6 class="text-lg font-medium text-gray-600">Cama queen con cabecera espaciadora</h6>
                    <p class="text-center font-semibold text-lg">S/750.00</p>
            </div>

        </div>
    </div>
</div>
