import mensajeros.*

object puenteBrooklyn {
  method puedePasar(unMensajero) = unMensajero.peso() < 500
}

object matrix {
  method puedePasar(unMensajero) = unMensajero.puedeLlamar()
}
