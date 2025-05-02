import empresas.*
import destinos.*
import transportes.*
import paquetes.*

object roberto {
  var transporte = null
  const peso = 90
  var tieneCredito = false
  
  method cambiarTransporte(unTrasporte) {
    transporte = unTrasporte
  }
  
  method recargarCredito() {
    tieneCredito = true
  }
  
  method transporte() = transporte
  
  method puedeLlamar() = tieneCredito
  
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
  var tieneCredito = false
  var transporte = telefono
  
  method peso() = 0
  
  method puedeLlamar() = tieneCredito
  
  method transporte() = transporte
  
  method cambiarTransporte(unTrasporte) {
    transporte = unTrasporte
  }
  
  method recargarCredito() {
    tieneCredito = true
  }
}
