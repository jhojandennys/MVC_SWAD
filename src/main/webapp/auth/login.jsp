<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="../referencias.jsp" %>
        <title>Register</title>
    </head>
    <body class="min-h-screen">  
        <main class="min-h-screen w-full bg-image flex-col gap-6 flex justify-center items-center px-3">
            <div class="w-full max-w-96 bg-primario rounded-lg px-4 py-8 sm:px-8 sm:py-12">
                <div class="text-center">
                    <a href="../index.jsp" class="font-semibold text-white text-2xl">
                    Muebles Dayanara
                    </a>
                </div>
                <!-- <h1 class="text-center font-semibold text-white text-2xl">
                    Muebles Dayanara
                </h1> -->
                <form
                    class="mt-8 flex flex-col gap-4 "
                    action="/Auth?accion=validar" method="post">
                    <div class="flex gap-2 flex-col">
                        <label for="email" class="text-white">Correo</label>
                        <input class="font-sans border rounded-sm p-2 outline-none " 
                               type="text" id="email" name="correo"  placeholder="juanperez07@gmail.com" autocomplete="username">

                    </div>
                    <div class="flex gap-2 flex-col relative">
                        <label for="password" class="text-white">Contraseña</label>
                        <input
                            class="font-sans border rounded-sm p-2 outline-none  "
                            type="password"
                            id="password"
                            name="password"
                            autocomplete="current-password"
                            />

                    </div>
                    <p class="text-sm text-blue-200">
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
                        class="mt-4 transition-all duration-500 cursor-pointer bg-primario-400 hover:bg-primario-200 rounded-sm p-2 text-white font-semibold"
                        />
                    <p class="text-sm -mt-2 text-center text-white">
                        No tienes una cuenta?
                        <a
                            href="register.jsp"
                            class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600"
                            >
                            Registrate
                        </a>
                    </p>
                </form>
            </div>

        </main>
    </body>
</html>