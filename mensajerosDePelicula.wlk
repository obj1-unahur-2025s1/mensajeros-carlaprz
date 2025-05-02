object paquete {
  var pago = false
  
  method pagarEnvio() {
    pago = true
  }
  
  method estaPago() = pago
  
  method puedeSerEntregado(
    unMensajero,
    unLugar
  ) = self.estaPago() && unLugar.puedePasar(unMensajero)
}

object roberto {
  var transporte = null
  const peso = 90
  
  method transporte(unTrasporte) {
    transporte = unTrasporte
  }
  
  method transporte() = transporte
  
  method puedeLLamar() = false
  
  method tieneTransporteAsignado() = transporte != null
  
  method peso() {
    var pesoTotal = peso
    if (self.tieneTransporteAsignado()) {
      pesoTotal += transporte.peso()
    }
    
    return pesoTotal
  }
}

object chuckNorris {
  method peso() = 80
  
  method puedeLlamar() = true
}

object neo {
  var peso = null
  var tieneCredito = false
  
  method peso(unPeso) {
    peso = unPeso
  }
  
  method recargarCredito() {
    tieneCredito = true
  }
  
  method puedeLLamar() = tieneCredito
}

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
  
}

object puenteBrooklyn {
  method puedePasar(unMensajero) = unMensajero.peso() < 500
}

object matrix {
  method puedePasar(unMensajero) = unMensajero.puedeLlamar()
}
