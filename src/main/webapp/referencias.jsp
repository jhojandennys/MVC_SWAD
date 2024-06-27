<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
<style href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet"></style>
<style>
    body::-webkit-scrollbar {
        width: 8px; /* Tamaño del scroll en vertical */
        background-color: #0a4fe4;
    }
    body::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 50px;
        max-height: 50%;
    }
    .overflowing-text {
        white-space: pre-line; /* Mantiene los saltos de línea */
        word-wrap: break-word; /* Rompe palabras largas */
        overflow: hidden; /* Oculta el texto que se desborda */
        text-overflow: ellipsis;
    }
    /**CALENDARIO**/
    .rbc-header {
        background-color: #2b9ce6;
        height: 4rem;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        font-weight: 400 !important;
        font-size: 20px !important;
    }
    /*TABLA CITAS*/
    .scroll-y-tabla::-webkit-scrollbar {
        background-color: #4b5063;
        width: 5px;
    }
    .scroll-y-tabla::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        width: 5px;
    }
    .tabla-citas::-webkit-scrollbar {
        background-color: #4b5063;
        height: 5px;
    }
    .tabla-citas::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        height: 5px;
    }
    .carrito::-webkit-scrollbar {
        background-color: #a4a6af;
        width: 3px;
        height: 5px;
    }
    .carrito::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        height: 5px;
        width: 5px;
    }
    .banner {
        background: url("./images/bg-inicio.webp");
        background-size: cover;
        background-position: center center;
    }
    .container {
        width: 95%;
        max-width: 1200px;
        margin: 0 auto;
    }
    .bgservicio {
        background: url("./images/bg-mobile-img.png");
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
    }
    .salto {
        overflow-wrap: break-word !important; /* Para navegadores modernos */
        word-wrap: break-word !important;
    }
    @media screen and (min-width: 1024px) {
        .bgservicio {
            background: url("./images/bg-desktop-img.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }
    }
    @media screen and (min-width: 2280px) {
        .bgservicio {
            background: url("./images/bg-desktop-img2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 45rem;
            background-position: right center;
        }
    }

</style>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    "primary-100": "#2B9CE6",
                    "primary-200": "#0185DC",
                    "primary-300": "#0178C7",
                    "secondary-300": "#6c7293",
                    "secondary-800": "#1A1C23",
                    "secondary-900": "#121317",
                    "contrast-600": "#7E3AF2",
                    "contrast-800": "#6816EF",
                    "black-50": "#ffffff25",
                    "black-20": "#00000025"
                },
                fontFamily: {
                    raleway: "'Raleway', sans-serif"
                },
                boxShadow: {
                    "e-top":
                            " 0px 3px 4px -2px rgb(0 0 0 / 0.1), 0px 2px 4px -2px rgb(0 0 0 / 0.1)",
                    md: " 0px 0px 4px -2px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)"
                },
                screens: {
                    xs: "480px"
                }
            }
        }
    };

    const clickLogButton = () => {
        const logbutton = document.getElementById('logbutton');
        logbutton.classList.toggle('hidden');
    };
</script>