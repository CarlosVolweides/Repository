<?php   
    session_name("SESION"); //<!--/Repository-Ugma/panel_admin/inc/session_start.php-->     
    session_start();
                    
                    echo '<h1 class="bienvenido">Gestión de Facultades</h1>';

    require_once("../php/main.php");
    $facultades=conexion();
    $facultades=$facultades->query("SELECT facultad.facultad_id, facultad_nombre FROM facultad ");

    $sedes=conexion();
    $sedes= $sedes->query("SELECT sede_id, sede_nombre FROM sede");
    
    ?>

<div>
    <link rel="stylesheet" href="./css/carloshizoesto.css">
    <!-- Seccion de crear Facultad-->
        <a href="#" id="circular-buttondaa" class="circular-buttonaa" onclick='loadContent("newfacultad")'>
            <i class="fas fa-plus"></i>Crear Facultad
        </a>
    <br>
    

    <!-- Seccion Lista de facultades-->
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
        <h2>Lista de Facultades</h2>
        <!-- <ul> -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Carreras</th>
                        <!-- <th>Sedes</th> -->
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody >
                <?php
                    // Mostrar las facultades en cada fila
                    while ($row = $facultades->fetch(PDO::FETCH_ASSOC)) { ?>

                    <tr valor-id="<?php echo $row['facultad_id']; ?>" valor-nombre="<?php echo $row['facultad_nombre']; ?>">
                                                
                        <td>
                            <?php echo $row['facultad_nombre']; ?> 
                        </td>

                        <!-- Mostrar las carreras de la facultad -->
                        <td>
                            <?php
                                $carreras=conexion();
                                $carreras= $carreras->query("SELECT carrera_id, carrera_nombre , facultad_id FROM carrera 
                                WHERE facultad_id = ".$row['facultad_id']."
                                ");
                                $lista = [];
                                while ($row = $carreras->fetch(PDO::FETCH_ASSOC)) {

                                    $lista[] = $row['carrera_nombre'];
                                                                        
                                }
                                echo implode('<br>', $lista);                  
                            
                            ?>
                        </td>
                        <!-- <td> -->
                            <!-- <?php echo $row['sede_nombre']; ?> -->
                        <!-- </td> -->
                        <input type="hidden" name="facultad_id" value="<?php echo $row['facultad_id']; ?>">

                        <td>
                            
                            <button name="botonEliminarFacultad" onclick="eliminarUsuario(this)">
                                <i class="fa-solid fa-trash"></i> Eliminar
                            </button>                                
                            
                        </td>
                                            
                        <td>
                            <button type="button" name="botonModificarFacultad" onclick="modificarUsuario(this)"><i class="fa-solid fa-pen" style="color: #414141;"></i> Modificar</button>
                        </td>
                    </tr>

                <?php } ?>
                </tbody>
            </table>
        </div>              
        <!-- </ul> -->
    </div>
    <br>
    <!-- Seccion de Modificar Facultad-->
    <div class="formulario-contenedor modificar" hidden>
        <form action="./php/facultad_modificar.php" method="POST" class="FormularioAjax" autocomplete="off">
            <h1>Modificar Facultad</h1>
            <input type="text" id="input-id" name="facultad_id" pattern="[0-9]{1,4}" hidden>

            <label for="input-nombre">Nombre:</label>
                <input type="text" id="input-nombre" name="facultad_nombre" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{3,40}" placeholder="Nombre" required><br>
                        
            <br><br>
            <button type="submit" style="padding:8px;background:var(--color-secundario-sutil);" >Confirmar Cambios</button>
        </form>
        <div class="form-rest"></div>
    </div>
    <br>

</div>

