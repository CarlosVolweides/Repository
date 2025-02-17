<?php
    error_reporting(0);
    $validar = $_SESSION['nombre'];
    if(!($validar == null || $validar =="")){
        header("Location: ./");
    }
    
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--    Iconos      -->
    <link rel="stylesheet" 
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" 
         integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
         crossorigin="anonymous" 
         referrerpolicy="no-referrer" 
    />

    <!--    CSS      -->
    <link rel="stylesheet" href="./css/login-estilos.css">

    <title>Login</title>
</head>

<body>
    <a href="../index.php" class="enlace"><i class="fa-brands fa-instagram"></i> Volver a inicio</a>

    <main>
        
        <div class="login-contenedor" id="login-contenedor">

            <div class="formulario-contenedor registrarse">
                <div style="
                            background-color: var(--color-seccion);
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            flex-direction: column; 
                            padding: 0 2.5rem;
                            height: 100%;
                ">
                    <p>El acceso a esta plataforma está restringido a usuarios autorizados.  </p>
                    <p> Si usted es un coordinador y desea un usuario, debe solicitar acceso al administrador del sistema. Para hacerlo, por favor comuníquese a través del siguiente correo:  

                    <a style="font-size: 1.45rem" href="mailto:correo@ejemplo.com?subject=Solicitud%20de%20Registro%20en%20Repositorio%20de%20Trabajos&amp;body=Estimado%20Administrador,%0D%0A%0D%0AMe%20gustaría%20solicitar%20acceso%20al%20repositorio%20de%20trabajos%20como%20coordinador.%20A%20continuación,%20adjunto%20mis%20datos%20para%20su%20revisión:%0D%0A%0D%0A-%20Nombre:%20%0D%0A-%20Correo%20de%20contacto:%20%0D%0A-%20Sede:%20%0D%0A-%20Cargo%20o%20coordinación:%20%0D%0A-%20Motivo%20de%20la%20solicitud:%20%0D%0A%0D%0AAgradezco%20su%20atención%20y%20quedo%20atento%20a%20su%20confirmación%20o%20cualquier%20información%20adicional%20que%20requiera.%0D%0A%0D%0ASaludos%20cordiales,%0D%0A[Tu%20Nombre]">
                    correo@ejemplo.com
                    </a>
                    </p>        
                </div>
            </div>

            <div class="formulario-contenedor acceder">
                <form action="" method="POST" autocomplete="off">
                    <h1>Iniciar sesión </h1>

                    <div class="iconos-redes">
                        <a href="#"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></i></a>
                        <a href="#"><i class="fa-solid fa-tv"></i></i></a>
                    </div>

                    <span>Ingresa tu correo y contraseña</span>

                    <input type="email" name="login_correo" placeholder="Correo electrónico" required>
                    <input type="password" name="login_clave" placeholder="Contraseña" required>

                    <a href="./vistas/proximamente.php">¿Olvidaste tu contraseña?</a>

                    <button type="submit">Acceder</button>

                    <?php
                        if(isset($_POST['login_correo']) && isset($_POST['login_clave'])){
                            require_once "./php/main.php";
                            require_once "./php/iniciar_sesion.php";
                        }

                    ?>

                </form>
                <div class="form-rest"></div>
            </div>

            <div class="interruptor-contenedor">    
                <div class="interruptor">

                    <div class="interruptor-panel interruptor-izquierdo">
                        <p>Si ya tienes una cuenta ingresa tus datos para acceder al <strong>Repositorio digital UGMA</strong></p>
                        <!-- <script src="./js/script_login.js"></script> -->
                        <button class="oculto" id="acceder">Acceder</button>
                    </div>

                    <div class="interruptor-panel interruptor-derecho">
                        <h1>Bienvenido</h1>

                        <p>¿Aún no estás registrado? crea un usuario especial y accede a todo el panel administrativo del <strong>Repositorio digital UGMA</strong></p>

                        <button class="oculto" id="registrarse">Registrarse</button>
                    </div>

                </div>
            </div>

        </div>

    </main>

    <footer></footer>

    <script src="./js/script_login.js"></script>
    <script src="./js/ajax.js"></script>   
</body>
</html>

