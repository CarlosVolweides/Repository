function modificarUsuario(button){
  // Obtiene el elemento <tr>(fila) del botón presionado
    const item = button.closest('tr');
    console.log(button.name);
  // Obtiene los datos del item
  let id = item.getAttribute('valor-id');
  let nombre = item.getAttribute('valor-nombre');
  let correo;
  let rolId;
  let sedeId;
  
  if(button.name == "botonModificarUsuario"){
      correo = item.getAttribute('valor-correo');
      rolId = item.getAttribute('valor-rol-id');
      sedeId = item.getAttribute('valor-sede-id');
  }

  // Copia los datos a los campos del formulario
  document.getElementById('input-id').value = id;
  document.getElementById('input-nombre').value = nombre;

  if(button.name == "botonModificarUsuario"){
    document.getElementById('input-correo').value = correo;
    document.getElementById('select-rol').value = rolId;
    document.getElementById('select-sede').value = sedeId;
  }
  
  let seccionModificar = document.getElementsByClassName("modificar");
  console.log(seccionModificar);
  seccionModificar[0].hidden = false;
}

function eliminarUsuario(button){
    const item = button.closest('tr');

    const id = item.getAttribute('valor-id');
    const nombre = item.getAttribute('valor-nombre');
    let accion;
    switch(button.name){
      case "botonEliminarFacultad":
          confirmacion = confirm('Estas seguro de eliminar la facultad '+ nombre+ '?');
          accion = "facultad_eliminar";
        break;
      case "botonEliminarUsuario":
          confirmacion = confirm('Estas seguro de eliminar el usuario '+ nombre+ '?');
          accion = "usuario_eliminar";
        break;
    }

    if(confirmacion){
      window.location.href=`./php/${accion}.php?id=`+id;
    }
}

function mostrarClave(button){
    const item = document.getElementById("usuario_clave");
    if(item.type=='text'){
      item.type = 'password';
    }
    else if(item.type=='password'){
      item.type= 'text';
    }
    else{
      console.log("nada");
    }


}
