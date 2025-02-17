<?php   
    session_name("SESION"); //<!--/Repository-Ugma/panel_admin/inc/session_start.php-->     
    session_start();
                    
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

<div>
    <link rel="stylesheet" href="./css/carloshizoesto.css">
    <!-- Seccion de Registrar usuario-->
        <a href="#" id="circular-buttondaa" class="circular-buttonaa" onclick='loadContent("newuser")'>
            <i class="fas fa-plus"></i>Crear Usuario
        </a>
    <br>
    

    <!-- Seccion Lista de usuarios-->
    <style>
        .table-container {
            max-height: 300px;
            overflow-y: auto;
            display: block;
            border: 1px solid black;
        }
        table {
            width: 100%;
            /*border-collapse: collapse;*/
            border-spacing: 0
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
            z-index: 2;
        }
    </style>
    <div>
        <h2>Lista de Usuarios</h2>
        <!-- <ul> -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Sede</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody >
                <?php            
                    while ($row = $usuarios->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr valor-id="<?php echo $row['usuario_id']; ?>" valor-nombre="<?php echo $row['usuario_nombre']; ?>" valor-correo="<?php echo $row['usuario_correo']; ?>" valor-rol-id="<?php echo $row['rol_id']; ?>" valor-sede-id="<?php echo $row['sede_id']; ?>">
                                                
                        <td>
                            <?php echo $row['usuario_nombre']; ?> 
                        </td>
                        <td>
                            <?php echo $row['usuario_correo'];?>
                        </td>
                        <td>
                            <?php echo $row['rol_nombre']; ?>
                        </td>
                        <td>
                            <?php echo $row['sede_nombre']; ?>
                        </td>
                        <input type="hidden" name="usuario_id" value="<?php echo $row['usuario_id']; ?>">

                        <td>
                            
                            
                            <button name="botonEliminarUsuario" onclick="eliminarUsuario(this)">
                                <i class="fa-solid fa-trash"></i> Eliminar
                            </button>                                
                            
                        </td>
                                            
                        <td>
                            <button type="button" name="botonModificarUsuario" onclick="modificarUsuario(this)"><i class="fa-solid fa-pen" style="color: #414141;"></i> Modificar</button>
                        </td>
                    </tr>

                <?php } ?>
                </tbody>
            </table>
        </div>              
        <!-- </ul> -->
    </div>
    <br>
    <!-- Seccion de Modificar usuario-->
    <div class="formulario-contenedor modificar" hidden>
        <form action="./php/usuario_modificar.php" method="POST" class="FormularioAjax" autocomplete="off">
            <h1>Modificar cuenta</h1>
            <input type="text" id="input-id" name="usuario_id" pattern="[0-9]{1,4}" hidden>

            <label for="input-nombre">Nombre:</label>
                <input type="text" id="input-nombre" name="usuario_nombre" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{3,40}" placeholder="Nombre" required><br>
            <label for="input-nombre">Correo:</label>
                <input type="email" id="input-correo" name="usuario_email" pattern="[a-zA-Z1-9@._-]{12,40}" placeholder="Correo electrónico" required><br>
            <label for="input-nombre">Clave:</label>
                <input type="password" id="input-clave" name="usuario_clave" placeholder="Contraseña" required><br>
            
            <label for="select-sede">Sede:</label>
            <select id="select-sede" name="usuario_sede" value="sede" required>
                <option value="">Seleccionar Sede</option>
                <?php
                    $sedes = conexion();
                    $sedes = $sedes->query("SELECT sede_id, sede_nombre FROM sede");
                    while ($row = $sedes->fetch(PDO::FETCH_ASSOC)) { ?>
                    <option value="<?php echo $row['sede_id']; ?>"><?php echo $row['sede_nombre'];?></option>
                    <?php }                             
                ?>
            </select><br>   
            <label for="select-rol">Rol:</label>
            <select id="select-rol" name="usuario_rol" value="Rol" required>
                    <option value="">Seleccionar Rol</option>
                    <?php 
                    $roles=conexion();
                    $roles=$roles->query("SELECT rol_id, rol_nombre FROM roles");    
                    
                    while ($row = $roles->fetch(PDO::FETCH_ASSOC)) { ?>
                        <option value="<?php echo $row['rol_id']; ?>"><?php echo $row['rol_nombre'];?></option>
                        <?php } 
                    ?>
                                       
            </select>
            <br><br>
            <button type="submit" style="padding:8px;background:var(--color-secundario-sutil);" >Confirmar Cambios</button>
        </form>
        <div class="form-rest"></div>
    </div>
    <br>
</div>

