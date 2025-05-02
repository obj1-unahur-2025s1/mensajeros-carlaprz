import destinos.*

object paquete {
  var pago = false
  var destino = puenteBrooklyn
  
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  
  method estaPago() = pago
  
  method pagarEnvio() {
    pago = true
  }
  
  method puedeSerEntregado(unMensajero) = self.estaPago() && destino.puedePasar(
    unMensajero
  )
  
  method precio() = 50
}

object paquetito {
  var destino = puenteBrooklyn
  
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  
  method estaPago() = true
  
  method puedeSerEntregado(unMensajero) = destino.puedePasar(unMensajero)
  
  method precio() = 0
}

object paquetonViajero {
  var pagado = 0
  var destino = puenteBrooklyn
  const destinos = [puenteBrooklyn, matrix]
  
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  
  method pagar(unaCantidad) {
    pagado += unaCantidad
  }
  
  method estaPago() = pagado >= (100 * destinos.size())
  
  method sePuedeEntregarEnTodosLosDestinos(unMensajero) = destinos.all(
    { m => m.puedePasar(unMensajero) }
  )
  
  method puedeSerEntregado(
    unMensajero
  ) = self.estaPago() && self.sePuedeEntregarEnTodosLosDestinos(unMensajero)
  
  method precio() = 100 * destinos.size()
}
