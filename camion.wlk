import cosas.*
object camion {
    method tara() = 1000
    const contenido =[]

    method peso() = self.tara() + contenido.sum({c=> c.peso()})

    method cargar(unaCosa) {
        contenido.add(unaCosa)
    }
    method descargar() {
        contenido.remove(contenido.last())
    }

    method cargaEsPar() = contenido.size()%2 == 0

    method cosaConPeso(unPeso) {
        return contenido.any({c => c.peso()== unPeso})
    } 

    method cosaConUnPeligro(unaPeligrosidad) {
      return (contenido.first({self.cosaMasPeligrosaQue(unaPeligrosidad)}))
    }
    method cosaMasPeligrosaQue(unaPeligrosidad) {
      return contenido.filter({c => c.peligro() >= unaPeligrosidad})
    }
    method cosasMasPeligrosas(unaPeligrosidad){
        return contenido.map({c=> c.peligro() > unaPeligrosidad})
    }

    method superaPesoMaximo() = self.peso() > 2500

    method puedeCirgular(unaPeligrosidad) {
      return !self.superaPesoMaximo() and ((self.cosasMasPeligrosas(unaPeligrosidad)).size() == 0)
    }
}