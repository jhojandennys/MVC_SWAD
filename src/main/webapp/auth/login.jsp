<body class="min-h-screen">  
    <main class="min-h-screen w-full flex-col gap-6 bg-primary-100 flex justify-center items-center px-3">
        <div class=" w-full max-w-96 bg-white rounded-lg px-4 py-8 sm:px-8 sm:py-12 ">
            <div class="max-w-48 mx-auto">
                <a class="w-full max-h-full" href="/admin/">
                    <img src="./images/Logo.png" alt="Logo" class="w-full">
                </a>
            </div>
            <h1 class="text-center font-semibold text-xl">
                Iniciar Sesión
            </h1>
            <form
                class="mt-8 flex flex-col gap-4"
                action="Autentica" method="post">
                <div class="flex gap-2 flex-col">
                    <label for="email">Correo</label>
                    <input class="font-sans border rounded-sm p-2 outline-none focus:border-green-500" 
                           type="email" id="email" name="correo"  placeholder="juanperez07@gmail.com" autocomplete="username">

                </div>
                <div class="flex gap-2 flex-col relative">
                    <label for="password">Contraseña</label>
                    <input
                        class="font-sans border rounded-sm p-2 outline-none  focus:border-green-500"
                        type="password"
                        id="password"
                        name="password"
                        autocomplete="current-password"
                        />

                </div>
                <p class="text-sm ">
                    <Link
                        to={"registrar"}
                        class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600"
                        >
                    ¿Has olvidado tu contraseña?
                    </Link>
                </p>
                <input
                    type="submit"
                    value="Iniciar Sesión"
                    class="mt-4 transition-all duration-500 cursor-pointer bg-primary-100 rounded-sm hover:bg-primary-300 p-2 text-white font-semibold"
                    />
                <p class="text-sm -mt-2">
                    No tienes una cuenta?
                    <a
                        href="registrar.jsp"
                        class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600"
                        >
                        Registrate
                    </a>
                </p>
            </form>
        </div>

    </main>
</body>
