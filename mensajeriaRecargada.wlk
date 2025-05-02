import mensajerosDePelicula.*

object paquetito {
  method estaPago() = true
  
  method sePuedeEntregar(unMensajero, unLugar) = unLugar.puedePasar(unMensajero)
}

object paquetonViajero {
  var pagado = 0
  
  method pagar(unaCantidad) {
    pagado += unaCantidad
  }
  
  method estaPago() = pagado >= 100
  
  method sePuedeEntregar(
    unMensajero,
    unLugar
  ) = (self.estaPago() && puenteBrooklyn.puedePasar(
    unMensajero
  )) && matrix.puedePasar(unMensajero)
}
