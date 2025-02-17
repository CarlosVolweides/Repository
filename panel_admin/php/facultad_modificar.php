<?php
    
    require_once "../php/main.php";

    #Almacenar Datos
    $id = limpiar_cadena($_POST['facultad_id']);
    $nombre = limpiar_cadena($_POST['facultad_nombre']);

    #Verificar los campos obligatorios si estan vacios
    if($id=="" || $nombre==""){
        echo '
        <div class="notificacion peligro ">
        <strong>¡Ocurrio un error inesperado!</strong><br>
        No has llenado todos los campos que son obligatorios
        </div>
        ';
        exit();
    }

    # Comprobar integridad de los datos (formato)
    //verificar nombre
    if(verificar_datos("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{3,40}",$nombre)){
        echo '
        <div class="notificacion peligro ">
        <strong>¡Ocurrio un error inesperado!</strong><br>
        El nombre no coincide con el formato adecuado
        </div>
        ';
        exit();
    }
    //verificar si ya existe ese nombre
    $chequear_nombre=conexion();
    $chequear_nombre=$chequear_nombre->query("SELECT facultad_nombre FROM facultad WHERE facultad_nombre='$nombre' AND NOT facultad_id='$id'");
    if($chequear_nombre->rowCount()>0){//verifica si hay al menos un registro con el nombre ingresado
        echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error!</strong><br>
                El nombre ingresado ya se encuentra registrado, por favor ingrese otro
            </div>
            '.$nombre.'
            ';        
        exit();
    }
    $chequear_nombre=null;

    #Modificar Datos
    $modificar_facultad = conexion();
    $modificar_facultad = $modificar_facultad->prepare("UPDATE facultad SET
    facultad_nombre = :nombre
    WHERE facultad_id = :id");

    $marcadores=[
        ":nombre"=>$nombre,
        ":id"=>$id,
    ];

    $modificar_facultad->execute($marcadores);

    if($modificar_facultad->rowCount()==1){
        echo '
            <div class="notificacion">
                <strong>¡FACULTAD MODIFICADA!</strong><br>
                La facultad se modificó con éxito
            </div>
        ';
    }else{
        echo '
        <div class="notificacion alerta">
            <strong>¡Ocurrio un error !</strong><br>
            No se pudo realizar los cambios a la facultad, por favor intente nuevamente
        </div>
    ';
    }
    $modificar_facultad=null;