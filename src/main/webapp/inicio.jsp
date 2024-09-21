<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Inicio</title>
</head>

<!--<div class="banner h-[19.5rem] md:h-[30rem] xl:h-[35rem] 2xl:h-[40rem] flex items-center text-center relative z-0 ">
    <div class="absolute bg-black opacity-35 -z-20 w-full h-full"></div>
    <div class="container z-10 p-8 mx-auto">
        <div class="flex gap-2 flex-col justify-center content-start md:w-1/2">
            <h1 class="text-white text-3xl md:text-5xl lg:text-6xl 2xl:text-7xl font-bold">Bienvenido a Animalia Vet</h1>
            <div class="flex gap-2 justify-center z-2">
                <a href="/" class="border border-black px-2 py-0.5 transition-all hover:bg-black   hover:text-white md:text-xl">Nuestra Sede</a>
                <a href="/" class="border border-transparent back  bg-orange-500 px-2 py-0.5 transition-all hover:bg-orange-600 md:text-xl">Productos</a>
            </div>
        </div>
    </div>
</div>-->

<div class="bg-primario">
    <div class="hero mt-16 ">
        <div class="min-h-[280px] flex items-center container-fluid w-auto mx-auto">
            <div class=" flex w-full lg:flex-row justify-beetwen">
                <div class="w-full flex flex-col lg:flex-row pt-8 px-4 ">
                    <div class=" lg:w-5/12 intro-excerpt">
                        <h1 class="text-white lg:flex flex-col gap-4 mb-4 text-3xl ">
                            Tu Refugio
                            <span clsas="block py-2">de Confort</span>
                        </h1>
                        <p class="mb-4 text-white opacity-50">
                            Lorem, ipsum dolor sit amet consectetur
                            adipisicing elit. Ullam itaque cum
                            delectus quas vitae praesentium, fuga
                            consequatur consectetur architecto!
                        </p>
                        <div class="flex gap-2 items-center">
                            <a href="?pagina=productos" class="bg-secundario hover:bg-secundario-500 transition-all duration-500 px-8 py-3 rounded-full cursor-pointer">Comprar Ahora</a>
                            <a href="?pagina=contactanos" class="border-2 border-gray-400 px-8 py-3 rounded-full text-gray-400 hover:text-white hover:border-white transition-all duration-500 ">Contáctanos</a>
                            </p>
                        </div>
                    </div>

                    <div class="hero-img-wrap">
                        <img src="img/cama-fondo.png" class="img-fluid" alt="img-fondo">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="py-4 container-fluid mx-auto text-center"> 
    <section class="features-area section_gap">
        <div class="grid grid-rows-4 md:grid-rows-2 md:grid-cols-2 lg:grid-cols-4 lg:grid-rows-1 features-inner mx-auto">
            <div class="">
                <div class="single-features">
                    <div class="f-icon">
                        <i class="fa-solid fa-truck"></i>
                    </div>
                    <h6>Entrega gratis</h6>
                    <p>En órdenes mayores a S/1000.00</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-features">
                    <div class="f-icon">
                        <i class="fa-solid fa-arrows-rotate"></i>
                    </div>
                    <h6>Política de devoluciones</h6>
                    <p>Devoluciones sin complicaciones.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-features">
                    <div class="f-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>
                    <h6>Soporte 24/7</h6>
                    <p>Asistencia en cualquier momento.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-features">
                    <div class="f-icon">
                        <i class="fa-solid fa-database"></i>
                    </div>
                    <h6>Pago seguro</h6>
                    <p>TransAcciónes protegidas.</p>
                </div>
            </div>
        </div>
    </section>

    <div>
        <h2 class="text-primario font-semibold text-2xl md:text-4xl">
            Elaborado con excelente material.
        </h2>
        <p class="text-xl mt-4">
            Donec vitae odio quis nisl dapibus malesuada. Nullam ac
            aliquet velit. Aliquam vulputate velit imperdiet dolor
            tempor tristique. Lorem ipsum dolor sit amet consectetur,
            adipisicing elit. Aliquam quam ab suscipit nulla eaque
            quisquam iusto error id corporis perferendis eligendi, rem
            quo? Aperiam minima rem, officia est veniam obcaecati!
        </p>
    </div>
    <div class="grid md:grid-cols-2 mt-4 lg:grid-cols-3 justify-center">
        <div class="product-card ">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/1.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/2.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500 btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/3.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn  rounded-full text-white hover:text-black transition-all duration-500 btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/4.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/5.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/6.png" width="90%" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/7.png" width="90%" alt="Box 1" height="auto">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="product-card col-md-4 col-sm-6 col-12 p-1">
            <div class="bg-image-color py-2">
                <img src="./img/Productos/8.png" width="90%" height="auto" alt="Box 1">
            </div>
            <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                Cama Deluxe Para
            </a>
            <p class="roboto-black product-price">S/ 1000.00</p>
            <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
        </div>
    </div>
</section>

<section class="hero2 bg-primario py-10">
    <div
        class="container max-w-[1200px] gap-4 text-center px-4 flex flex-col md:flex-row justify-center items-center mx-auto"
        >
        <div class="md:w-6/12 lg:w-5/12">
            <h2 class="text-white text-2xl md:text-3xl">
                Dayanara: Más de 10 años creando sueños.
            </h2>
            <p class=" text-gray-400 text-lg md:text-xl inter-thin">
                Más de 10 años creando sueños en Santa Clara, Lima. Te
                ofrecemos camas, dormitorios, colchones, box springs y
                veladores de calidad con garantía. Disfruta de una
                excelente atención al cliente y la asesoría de nuestros
                expertos para encontrar la cama perfecta para tu
                descanso.
            </p>
        </div>
        <div class="md:w-6/12 lg:w-7/12">
            <div class="hero-img-wrap">
                <img
                    src="./img/Productos/13.png"
                    alt="img-producto"
                    class="img-fluid w-full"
                    />
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container-fluid mx-auto product-section my-8">
        <h2 class="text-center text-xl md:text-3xl font-semibold text-primario">
            Pedidos Especiales
        </h2>

        <p class="text-center text-lg mt-4">
            En caso estés buscando algún producto en específico y
            nosotros no lo tengamos en stock, puedes solicitar una
            cotización enviándonos todos los detalles del producto.
        </p>
        <div class="grid grid-rows-3 md:grid-rows-1  md:grid-cols-3 gap-6 mt-6 justify-center mb-8">
            <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                <div class="card">
                    <img
                        src="./img/Productos/14.png"
                        class="card-img-top"
                        alt="Cama Box Queen"
                        width="auto"
                        />
                    <div class="card-body grid justify-beetwen h-[200px]">
                        <h5 class="font-semibold md:text-lg">Cama Box Queen</h5>
                        <p class="card-text text-gray-700">
                            Disfruta del máximo confort y estilo con
                            nuestra Cama Box Queen
                        </p>
                        <a
                            href="ProductosDetalle.html"
                            class="btn text-center place-self-end	inline-block  text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                            >Solicita cotización</a
                        >
                    </div>
                </div>
            </div>
            <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                <div class="card h-100 ">
                    <img
                        src="./img/Productos/15.png"
                        class="card-img-top"
                        alt="Cama Box King"
                        width="auto"
                        />
                    <div class="card-body grid justify-beetwen h-[200px]">
                        <h5 class="font-semibold md:text-lg">Cama Box King</h5>
                        <p class="card-text text-gray-700">
                            Con su amplio tamaño King, es perfecta para
                            quienes buscan un descanso espacioso y
                            reparador.
                        </p>
                        <a
                            href="ProductosDetalle.html"
                            class="btn text-center self-end  inline-block  text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                            >Solicita cotización</a
                        >
                    </div>
                </div>
            </div>
            <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                <div class="card ">
                    <img
                        src="./img/Productos/21.png"
                        class="card-img-top"
                        alt="Cama Box Ergonomica"
                        width="auto"
                        />
                    <div class="card-body grid justify-beetwen h-[200px]">
                        <h5 class="font-semibold md:text-lg">Cama Box Ergonomica</h5>
                        <p class="card-text text-gray-700">
                            Ideal para mejorar la postura y reducir los
                            puntos de presión.
                        </p>
                        <a
                            href="ProductosDetalle.html"
                            class="btn text-center inline-block  self-end text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                            >Solicita cotización</a
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<iframe
    title="mapa"
    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3902.40521117748!2d-76.8889587!3d-12.0156003!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105e9bd9393c10d%3A0x6ce3f066d3184746!2sTOP%20DECOR%20MUEBLES!5e0!3m2!1ses-419!2spe!4v1716951564363!5m2!1ses-419!2spe"
    width="100%"
    height="480px"
    allowfullscreen=""
    loading="lazy"
    referrerpolicy="no-referrer-when-downgrade"
    ></iframe>