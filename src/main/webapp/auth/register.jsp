<body class="min-h-screen">  
    <main class="min-h-screen w-full flex-col gap-6 bg-primary-100 flex justify-center items-center px-3">
        <a class="max-w-52" href="/">
            <img src="./images/Logo.png" alt="Logo" class="w-full"></a>
        <div class=" w-full max-w-96 bg-white rounded-lg px-4 py-8 sm:px-8 sm:py-12 ">
            <h1 class="text-center font-semibold text-xl">Registrar Cuenta</h1>
            <form class="mt-8 flex flex-col gap-4">
                <div class="flex gap-2 flex-col">
                    <label for="nombre">Nombre</label>
                    <input class="font-sans border rounded-sm p-2 outline-none focus:border-green-500" 
                           type="text" id="nombre" name="nombre" placeholder="Juan">
                </div>
                <div class="flex gap-2 flex-col">
                    <label for="apellido">Apellidos</label>
                    <input class="font-sans border rounded-sm p-2 outline-none focus:border-green-500" 
                           type="text" id="apellido" name="apellido" placeholder="Pérez">
                </div>
                <div class="flex gap-2 flex-col">
                    <label for="dni">Dni</label>
                    <input class="font-sans border rounded-sm p-2 outline-none focus:border-green-500" 
                           type="number" id="dni" name="dni" placeholder="123456789">
                </div>
                <div class="flex gap-2 flex-col">
                    <label for="email">Correo</label>
                    <input class="font-sans border rounded-sm p-2 outline-none focus:border-green-500" 
                           type="email" id="email" name="email" placeholder="juanperez07@gmail.com">
                </div>
                <div class="flex gap-2 flex-col relative">
                    <label for="password">Contraseña</label>
                    <input class="font-sans border rounded-sm p-2 outline-none  focus:border-green-500" 
                           type="text" id="password" name="password" placeholder="**********">
                </div>
                <input type="submit" class="mt-4 transition-all duration-500 cursor-pointer bg-primary-100 rounded-sm 
                       hover:bg-primary-300 p-2 text-white font-semibold" value="Registrar"> 
                <p class="text-sm -mt-2">Ya tienes una cuenta? 
                    <a class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600" href="/auth">Inicia Sesión</a>
                </p>
            </form>
        </div>
    </main>
</body>
