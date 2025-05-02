import mensajerosDePelicula.*

object empresaDeMensajeria {
  const mensajeros = #{}
  
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
  
  method mensajeros() = mensajeros
}
