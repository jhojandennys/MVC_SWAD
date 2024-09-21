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
        <main class="min-h-screen bg-image w-full flex-col gap-6 flex justify-center items-center px-3">
            <div class=" w-full max-w-96 bg-primario rounded-lg px-4 py-8 sm:px-8 sm:py-12 ">
                <h1 class="text-center font-semibold text-2xl text-white">Registrar Cuenta</h1>
                <form class="mt-4 flex flex-col gap-4">
                    <div class="flex gap-2 flex-col">
                        <label for="nombre" class="text-white">Nombre</label>
                        <input class="font-sans border rounded-sm p-2 outline-none " 
                               type="text" id="nombre" name="nombre" placeholder="Juan">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="apellido" class="text-white">Apellidos</label>
                        <input class="font-sans border rounded-sm p-2 outline-none " 
                               type="text" id="apellido" name="apellido" placeholder="Pérez">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="dni" class="text-white">Dni</label>
                        <input class="font-sans border rounded-sm p-2 outline-none " 
                               type="number" id="dni" name="dni" placeholder="123456789">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="email" class="text-white">Correo</label>
                        <input class="font-sans border rounded-sm p-2 outline-none " 
                               type="email" id="email" name="email" placeholder="juanperez07@gmail.com">
                    </div>
                    <div class="flex gap-2 flex-col relative">
                        <label for="password" class="text-white"> Contraseña</label>
                        <input class="font-sans border rounded-sm p-2 outline-none  " 
                               type="text" id="password" name="password" placeholder="**********">
                    </div>
                    <input type="submit" class="mt-4 transition-all duration-500 cursor-pointer bg-primario-400 hover:bg-primario-200 rounded-sm 
                           p-2 text-white font-semibold" value="Registrar"> 
                    <p class="text-sm -mt-2 text-white text-center">Ya tienes una cuenta? 
                        <a class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600" href="login.jsp">Inicia Sesión</a>
                    </p>
                </form>
            </div>
        </main>
    </body>
</html>