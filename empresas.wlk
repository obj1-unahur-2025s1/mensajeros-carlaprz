import mensajerosDePelicula.*

object empresaDeMensajeria {
  const mensajeros = #{}
  const paquetesPendientes = []
  var facturacion = 0
  
  method facturacion() = facturacion
  
  method contratarMensajero(unMensajero) {
    mensajeros.add(unMensajero)
  }
  
  method despedirMensajero(unMensajero) {
    mensajeros.remove(unMensajero)
  }
  
  method despedirAtodosLosMensajeros() {
    mensajeros.clear()
  }
  
  method esGrande() = mensajeros.size() > 2
  
  method elPrimerMensajeroPuedeEntregarElPaquete(
    unLugar
  ) = paquete.puedeSerEntregado(mensajeros.asList().first(), unLugar)
  
  method pesoDelUltimoMensajero() = mensajeros.asList().last().peso()
  
  method algunoPuedeEntregar(unPaquete, unLugar) = mensajeros.any(
    { unMensajero => unPaquete.puedeSerEntregado(unMensajero, unLugar) }
  )
  
  method mensajerosQuePuedenEntregar(unPaquete, unLugar) = mensajeros.filter(
    { m => unPaquete.puedeSerEntregado(m, unLugar) }
  )
  
  method tieneSobrepeso() {
    if (mensajeros.isEmpty()) {
      return false
    }
    
    return (mensajeros.map({ m => m.peso() }).sum() / mensajeros.size()) > 500
  }
  
  method enviarPaquete(unPaquete, unLugar) {
    const mensajero = self.mensajerosQuePuedenEntregar(
      unPaquete,
      unLugar
    ).firstOrNull()
    if (mensajero != null) {
      facturacion += unPaquete.costo()
    } else {
      paquetesPendientes.add(unPaquete)
    }
  }
  
  method enviarPaquetes(paquetes, unLugar) {
    paquetes.forEach({ p => self.enviarPaquete(p, unLugar) })
  }
  
  method enviarMasCaroPendiente(unLugar) {
    const paqueteMasCaro = paquetesPendientes.sortBy(
      { p => p.costo() }
    ).lastOrNull()
    if (paqueteMasCaro != null) {
      const mensajero = self.mensajerosQuePuedenEntregar(
        paqueteMasCaro,
        unLugar
      ).firstOrNull()
      if (mensajero != null) {
        facturacion += paqueteMasCaro.costo()
        paquetesPendientes.remove(paqueteMasCaro)
      }
    }
  }
}
