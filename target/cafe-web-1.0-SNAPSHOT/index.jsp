<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafe© Jhona - Inicio</title>

    <link rel="stylesheet" href="css/styles.css">

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            document.querySelectorAll('a[href^="#"]').forEach(enlace => {
                enlace.addEventListener("click", e => {
                    e.preventDefault();
                    const destino = document.querySelector(
                        enlace.getAttribute("href")
                    );

                    if (destino) {
                        destino.scrollIntoView({
                            behavior: "smooth"
                        });
                    }
                });
            });
        });
    </script>
</head>
<body>

<header class="dashboard">

    <div class="logo">
        Café Jhona
    </div>

    <nav class="menu">
        <ul>
            <li>
                <a href="#catalogo" class="btn-nav">
                    Catálogo
                </a>
            </li>

            <li>
                <a href="views/login.jsp" class="btn-nav">
                    Iniciar sesión
                </a>
            </li>

            <li>
                <a href="views/registro.jsp" class="btn-nav">
                    Registrarse
                </a>
            </li>
        </ul>
    </nav>

</header>
<section id="inicio" class="hero">

    <div class="carousel">

        <div class="slide active">
            <img
                src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=1000&q=80"
                alt="Tinto tradicional">

            <div class="caption">
                El sabor autentico del café jhona
            </div>
        </div>

        <div class="slide">
            <img
                src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=1000&q=80"
                alt="Empanadas">

            <div class="caption">
                Acompanadas tu tinto con una empanada
            </div>
        </div>

        <div class="slide">
            <img
                src="https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?auto=format&fit=crop&w=1000&q=80"
                alt="Aromaticas">

            <div class="caption">
                Aromaticas naturales para cualquier momento
            </div>
        </div>

    </div>

</section>

<section id="catalogo" class="catalogo">

    <h2>Nuestro catalógo</h2>

    <p>
        Porximamente podras ver todos nuestros productos aqui.
    </p>

    <div class="productos-grid">

        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>
        <div class="imagen-placeholder"></div>

    </div>

</section>

<footer>
    <p>
        © 2025 Café © Jhona Todos los derechos reservados
    </p>
</footer>

<script>

    let index = 0;

    const slides =
        document.querySelectorAll('.slide');

    function showSlide() {

        slides.forEach((slide, i) => {
            slide.classList.toggle(
                'active',
                i === index
            );
        });

        index = (index + 1) % slides.length;
    }

    setInterval(showSlide, 4000);

</script>
</body>
</html>