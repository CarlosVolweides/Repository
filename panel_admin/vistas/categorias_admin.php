<?php 
require_once '../php/main.php';

//Obtener el id del user por si sube trabajos
if(isset($_GET['user'])){
    $user_id = $_GET['user'];
} else{
    $user_id=null;
}

//Obtener el cargo
if(isset($_GET['cargo'])){
    $cargo = $_GET['cargo'];
} else{
    $cargo=null;
}
//Obtener carreras a las que tiene acceso el usuario//

    $carreras = [];
    $sql = "SELECT carrera_id 
            FROM rol_x_facultad
            INNER JOIN carrera ON rol_x_facultad.facultad_id=carrera.facultad_id 
            WHERE rol_id = :rol_id"; // Usando un parámetro
    $con = conexion();

    // Preparar la consulta
    $stmt = $con->prepare($sql);
    $stmt->bindParam(':rol_id', $cargo, PDO::PARAM_INT); // Vincular el parámetro

    // Ejecutar la consulta
    $stmt->execute();

    // Verificar si hay resultados
    if($stmt->rowCount() > 0) {
        // Iterar sobre los resultados
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Agregar el id de carrera al array
            $carreras[] = $row['carrera_id']; // Agregar sólo el carrera_id
        }
    }

//Obtener la sede
    if(isset($_GET['sede'])){
        $sede = $_GET['sede'];
    } else{
        $sede=null;
    }


//Obtener tipo de trabajo//
    if(isset($_GET['tipo'])){
        $tipo = $_GET['tipo'];
    } else{
        $tipo=1;
    }


//Declarar la query principal//
    $query="SELECT SQL_CALC_FOUND_ROWS DISTINCT trabajo.trabajo_titulo, 
    trabajo.trabajo_resumen, 
    trabajo.trabajo_id, 
    tipo_trabajo.tipo_trabajo_nombre, 
    autor.autor_nombre, 
    carrera.carrera_nombre, 
    area_conocimiento.area_nombre 
    FROM trabajo
    INNER JOIN autor ON trabajo.autor_id=autor.autor_id
    INNER JOIN trabajo_detalles ON trabajo.trabajo_id=trabajo_detalles.trabajo_id
    INNER JOIN carrera ON trabajo_detalles.carrera_id=carrera.carrera_id
    INNER JOIN facultad ON trabajo_detalles.facultad_id=facultad.facultad_id
    INNER JOIN trabajo_x_tipo_trabajo ON trabajo.trabajo_id=trabajo_x_tipo_trabajo.trabajo_id
    INNER JOIN tipo_trabajo ON trabajo_x_tipo_trabajo.tipo_trabajo_id=tipo_trabajo.tipo_trabajo_id
    INNER JOIN area_conocimiento ON trabajo_detalles.area_id=area_conocimiento.area_id
    WHERE trabajo_x_tipo_trabajo.tipo_trabajo_id=".$tipo;

//Concatena las carreras a las que se puede acceder si las hay
    if (!empty($carreras)) {
        $first_condicion = false;
        $query .= " AND (";
        foreach ($carreras as $carrera_id) {
            if($first_condicion==true){ $query.= " OR";}
            $query .= " carrera.carrera_id =".$carrera_id;
            $first_condicion = true;
        }
        $query .= ")";
    }

//Concatena la sede a la que se puede acceder si la hay
    if ($sede != null && $sede != "null") {
        $query .= " AND trabajo_detalles.sede_id =".$sede;
    }

//Obtener el nro de la pagina//
    if(isset($_GET['p'])){
        $pagina = $_GET['p'];
    }else{
        $pagina = 1;
    }

?>

<!DOCTYPE HTML>
<html lang="es">
    <head>
    <link rel="stylesheet" href="/Repository/panel_admin/css/estilos-listadoNew.css">
    <link rel="stylesheet" href="/Repository/css/estilos-paginadora.css">
    </head>
    <body>
        <main>
            <section>
                <ul class="listado-trabajos">
                    <?php $html = paginadora_trabajos_admin($pagina,10,$query,null,$tipo,null,null,$cargo,$sede);
                    echo $html; 
                    ?>
                </ul>
            </section>

            <a href="#" id="circular-buttonaa" class="circular-buttonaa" onclick='loadContent("new", null, null, "<?php echo $sede; ?>", "<?php echo $user_id; ?>")'>
            <i class="fas fa-plus"></i>
            </a>


            </main>
    </body>
