<?php   
                  
    echo '<h1 class="bienvenido">Gestión de Facultades</h1>';

    require_once("../php/main.php");
    
?>

<!-- Seccion de Registrar facultad-->
<div class="formulario-contenedor registrarse">
        <form action="./php/facultad_insertar.php" method="POST" class="FormularioAjax" autocomplete="off">
            <h1>Crear Facultad</h1>
            <br>
            <label for="facultad_nombre">Nombre de facultad:</label>
                <input type="text" id="facultad_nombre" name="facultad_nombre" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{3,40}" placeholder="Nombre" required>
           
            <br><br>
            <button type="submit" style="padding:10px;background:var(--color-secundario-sutil);">Registrar</button>
        </form>
</div>