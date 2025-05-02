object empresaDeMensajeria {
  const mensajeros = #{}
  const pendientes = []
  const enviados = []
  
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
    unPaquete
  ) = unPaquete.puedeSerEntregado(mensajeros.asList().first())
  
  method pesoDelUltimoMensajero() = mensajeros.asList().last().peso()
  
  // Parte 3
  method puedeEntregar(unPaquete) = mensajeros.any(
    { m => unPaquete.puedeSerEntregado(m) }
  )
  
  method mensajerosQuePuedenEntregar(unPaquete) = mensajeros.filter(
    { m => unPaquete.puedeSerEntregado(m) }
  )
  
  method tieneSobrepeso() = (mensajeros.sum(
    { m => m.peso() }
  ) / mensajeros.size()) > 500
  
  method enviar(unPaquete) = if (self.puedeEntregar(unPaquete)) enviados.add(
                                 unPaquete
                               )
                             else pendientes.add(unPaquete)
  
  method facturacion() = enviados.sum({ p => p.precio() })
  
  method enviarTodos(paquetesAEnviar) = paquetesAEnviar.forEach(
    { p => self.enviar(p) }
  )
  
  method reenviarPaquete() {
    const caro = self.pendienteCaro()
    pendientes.remove(caro)
    self.enviar(caro)
  }
  
  method pendienteCaro() = pendientes.max({ p => p.precio() })
  
  method mensajeros() = mensajeros
  
  method pendientes() = pendientes
}
