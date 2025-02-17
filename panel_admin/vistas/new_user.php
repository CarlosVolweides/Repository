<?php   
                  
    echo '<h1 class="bienvenido">Gestión de Usuarios</h1>';

    require_once("../php/main.php");
    $roles=conexion();
    $roles=$roles->query("SELECT rol_id, rol_nombre FROM roles");

    $sedes=conexion();
    $sedes= $sedes->query("SELECT sede_id, sede_nombre FROM sede");
    
    $usuarios=conexion();
    $usuarios= $usuarios->query("SELECT usuario_id, usuario_nombre ,usuario_correo, usuario.rol_id, usuario.sede_id, rol_nombre, sede_nombre 
    FROM usuario 
    INNER JOIN roles on usuario.rol_id = roles.rol_id
    INNER JOIN sede on usuario.sede_id = sede.sede_id    
    ");
?>

<!-- Seccion de Registrar usuario-->
<div class="formulario-contenedor registrarse">
        <form action="./php/usuario_insertar.php" method="POST" class="FormularioAjax" autocomplete="off">
            <h1>Crear Usuario</h1>
            <br>
            <label for="usuario_nombre">Nombre de usuario:</label>
                <input type="text" id="usuario_nombre" name="usuario_nombre" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{3,40}" placeholder="Nombre" required> <br><br>

            <label for="usuario_email">Correo electrónico:</label>
                <input type="email" id="usuario_email" name="usuario_email" pattern="[a-zA-Z1-9@._-]{12,40}" placeholder="Correo electrónico" required><br><br>

            <label for="usuario_clave">Contraseña:</label>
                <input type="password" id="usuario_clave" name="usuario_clave" placeholder="Contraseña" required>
                <button type="button" onclick="mostrarClave(this)">Mostrar</button><br><br>

            <label for="usuario_sede">Selecciona una sede:</label>
                <select name="usuario_sede" value="sede"required>
                    <option value="">Seleccionar Sede</option>
                    <?php
                    while ($row = $sedes->fetch(PDO::FETCH_ASSOC)) { ?>
                        <option value="<?php echo $row['sede_id']; ?>"><?php echo $row['sede_nombre'];?></option>
                        <?php }                             
                    ?>
                </select>
            <br><br>

            <label for="usuario_rol">Selecciona un rol:</label>
            <select name="usuario_rol" value="Rol" required>
                    <option value="">Seleccionar Rol</option>
                    <?php 
                    while ($row = $roles->fetch(PDO::FETCH_ASSOC)) { ?>
                        <option value="<?php echo $row['rol_id']; ?>"><?php echo $row['rol_nombre'];?></option>
                        <?php } ?>                                      
            </select>
            <br><br>
            <button type="submit" style="padding:10px;background:var(--color-secundario-sutil);">Registrar</button>
        </form>
</div>