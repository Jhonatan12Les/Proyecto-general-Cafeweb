<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Café Jhona - Inicio</title>

    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/index.css">

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
                El sabor auténtico del café Jhona
            </div>
        </div>

        <div class="slide">
            <img
                src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=1000&q=80"
                alt="Empanadas">
            <div class="caption">
                Acompaña tu tinto con una empanada
            </div>
        </div>

        <div class="slide">
            <img
                src="https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?auto=format&fit=crop&w=1000&q=80"
                alt="Aromáticas">
            <div class="caption">
                Aromáticas naturales para cualquier momento
            </div>
        </div>

    </div>

</section>

<section id="catalogo" class="catalogo">

    <h2>Nuestro catálogo</h2>

    <p>
        Panadería artesanal y café colombiano, hechos para ti.
    </p>

    <div class="productos-grid">

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80" alt="Croissant">
            <div class="info">
                <h3>Croissant artesanal</h3>
                <span class="precio">$4.500</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=400&q=80" alt="Empanada de queso">
            <div class="info">
                <h3>Empanada de queso</h3>
                <span class="precio">$3.000</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1509365465985-25d11c17e812?auto=format&fit=crop&w=400&q=80" alt="Muffin de arándanos">
            <div class="info">
                <h3>Muffin de arándanos</h3>
                <span class="precio">$5.000</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80" alt="Pan de bono">
            <div class="info">
                <h3>Pan de bono</h3>
                <span class="precio">$2.500</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=400&q=80" alt="Café tostado medio">
            <div class="info">
                <h3>Tostado medio · 500g</h3>
                <span class="precio">$28.000</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1442512595331-e89e73853f31?auto=format&fit=crop&w=400&q=80" alt="Café tostado oscuro">
            <div class="info">
                <h3>Tostado oscuro · 500g</h3>
                <span class="precio">$28.000</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1524350876685-274059332603?auto=format&fit=crop&w=400&q=80" alt="Café molido premium">
            <div class="info">
                <h3>Molido premium · 250g</h3>
                <span class="precio">$16.000</span>
            </div>
        </div>

        <div class="producto-card">
            <img src="https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=400&q=80" alt="Café en grano orgánico">
            <div class="info">
                <h3>Orgánico en grano · 1kg</h3>
                <span class="precio">$52.000</span>
            </div>
        </div>

    </div>

</section>

<footer>
    <p>
        &copy; 2025 Café Jhona &middot; Todos los derechos reservados
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