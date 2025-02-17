<?php
    
    require_once "../php/main.php";

    #Almacenar Datos
    $id = limpiar_cadena($_GET['id']);

    #Verificar los campos obligatorios si estan vacios
    if($id==""){
        echo '
        <div class="notificacion peligro ">
        <strong>¡Ocurrio un error inesperado!</strong><br>
        El campo del id se encuentra vacio
        </div>
        ';
        exit();
    }


    # Comprobar integridad de los datos (formato)
    //verificar id
    if(verificar_datos("[0-9]{1,5}",$id)){
        echo '
        <div class="notificacion peligro ">
        <strong>¡Ocurrio un error inesperado!</strong><br>
        El id no coincide con el formato adecuado
        </div>
        ';
        exit();
    }

    #Eliminar facultad
    $eliminar_facultad = conexion();
    $eliminar_facultad = $eliminar_facultad->prepare("DELETE FROM facultad WHERE facultad_id = :id");

    $marcadores=[
        ":id"=>$id
    ];

    $eliminar_facultad->execute($marcadores);

    if($eliminar_facultad->rowCount()==1){
        echo '
            <div class="notificacion">
                <strong>¡FACULTAD ELIMINADA!</strong><br>
                La facultad se eliminó con éxito
            </div>
        ';
    }else{
        echo '
        <div class="notificacion alerta">
            <strong>¡Ocurrio un error !</strong><br>
            No se pudo eliminar la facultad, por favor intente nuevamente
        </div>
    ';
    }
    $eliminar_facultad=null;