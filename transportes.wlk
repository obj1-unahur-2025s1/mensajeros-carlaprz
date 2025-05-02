object bicicleta {
  method peso() = 5
}

object camion {
  var cantidadDeAcoplados = 0
  
  method cantidadDeAcoplados(unaCantidad) {
    cantidadDeAcoplados = unaCantidad
  }
  
  method peso() = cantidadDeAcoplados * 500
}

object telefono {
  method peso() = 0.25
}
