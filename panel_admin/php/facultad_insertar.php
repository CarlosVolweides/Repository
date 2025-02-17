<?php
    
    require_once "../php/main.php";

    #Almacenar Datos
    $nombre = limpiar_cadena($_POST['facultad_nombre']);

    #Verificar los campos obligatorios si estan vacios
    if($nombre==""){
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
    $chequear_nombre=$chequear_nombre->query("SELECT facultad_nombre FROM facultad WHERE facultad_nombre='$nombre' ");
    if($chequear_nombre->rowCount()>0){//verifica si hay al menos un registro con el nombre ingresado
        echo '
            <div class="notification is-danger is-light">
                <strong>¡Ocurrio un error!</strong><br>
                El nombre de la facultad ingresado ya se encuentra registrado, por favor ingrese otro
            </div>
            '.$nombre.'
            ';        
        exit();
    }
    $chequear_nombre=null;
    
    #Guardando Datos
    $guardar_facultad = conexion();
    $guardar_facultad = $guardar_facultad->prepare("INSERT INTO facultad
    (facultad_nombre) 
    VALUES(:nombre)");

    $marcadores=[
        ":nombre"=>$nombre,        
    ];

    $guardar_facultad->execute($marcadores);

    if($guardar_facultad->rowCount()==1){
        echo '
            <div class="notificacion">
                <strong>¡FACULTAD REGISTRADA!</strong><br>
                La facultad se registró con éxito
            </div>
        ';
    }else{
        echo '
        <div class="notificacion alerta">
            <strong>¡Ocurrio un error !</strong><br>
            No se pudo registrar la facultad, por favor intente nuevamente
        </div>
    ';
    }
    $guardar_facultad=null;