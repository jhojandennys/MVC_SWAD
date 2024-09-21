<head>
    <title>Productos</title>
</head>

<section class="py-14 container-fluid mx-auto text-center" id="body">
    <div>
        <h1 class="text-primario text-2xl">
            Nuestra identidad
            <span class="block text-5xl">Productos Actuales</span>
        </h1>
    </div>
</section>

<div class="flex">
  <!-- Sidebar: Filtros -->
  <div class="w-1/4 p-4 bg-gray-100">
    <!-- Filtro de Precio -->
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

  <!-- Productos -->
  <div class="w-7/4 p-4">

    <div class="flex items-medium justify-between mb-4">
      <div class="flex space-x-2">
        <button class="px-3 py-1 bg-yellow-400 text-white rounded">Camas</button>
        <button class="px-3 py-1 bg-white text-gray-700 border border-gray-300 rounded">Box</button>
        <button class="px-3 py-1 bg-white text-gray-700 border border-gray-300 rounded">Dormitorios</button>
        <button class="px-3 py-1 bg-white text-gray-700 border border-gray-300 rounded">Colchones</button>
      </div>

      <div class="flex flex-nowrap space-x-2">
        <button class="px-2 py-1 bg-gray-300 text-gray-700 rounded">1</button>
        <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">2</button>
        <button class="px-2 py-1 bg-white text-gray-700 border border-gray-300 rounded">3</button>
      </div>
    </div>
    
    <div class="grid grid-cols-3 gap-5">
      <!-- Producto 1 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Cama Tornillo 2plz</h1>
        <img src="img/Camas/Cama1.5Espacio.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Cama Tornillo con cabecera espaciadora</h6>
        <p class="text-center">S/900.00</p>
      </div>

      <!-- Producto 2 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Cama Jade 1.5plz</h1>
        <img src="img/Camas/Cama1.5Jade.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Cama Jade de 1.5 plazas</h6>
        <p class="text-center">S/700.00</p>
      </div>

      <!-- Producto 3 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Cama con Cajones</h1>
        <img src="img/Camas/Cama1.5Madera.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Cama con cajones</h6>
        <p class="text-center">S/549.99.00</p>
      </div>

      <!-- Producto 4 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Sofá cama matrimonial</h1>
        <img src="img/Camas/Cama1.5N.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Sofá que se convierte en cama tamaño matrimonial</h6>
        <p class="text-center">S/899.99.00</p>
      </div>

      <!-- Producto 5 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Cama 1plz Tornillo Clasica</h1>
        <img src="img/Camas/Cama1.5Tornillo.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Cama clasica tornillo luminoza</h6>
        <p class="text-center">S/600.00</p>
      </div>

      <!-- Producto 6 -->
      <div class="p-4 bg-white shadow rounded">
        <h1 class="text-xl">Cama Queen 1.5plz</h1>
        <img src="img/Camas/Cama1.5W.jpg" alt="Producto" class="w-full h-48 object-cover mb-2">
        <h6 class="text-lg font-medium text-gray-600">Cama queen con cabecera espaciadora</h6>
        <p class="text-center">S/750.00</p>
      </div>
      
    </div>
  </div>
</div>
