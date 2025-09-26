object khightRider{
    method peso() = 500
    method peligro() = 10 
}

object bumblebee{
    method peso() = 800
    method peligro() {
        if (self.estado()=="Auto"){
            return 15
        }
        else{
            return 30
        }
    } 

    var estado = "Auto"
    method cambiarEstado() {
      if (self.estado()=="Auto"){
        estado = "Robot"
      }
      else{
        estado = "Auto"
      }
    }
    method estado() = estado
}

object bolsaLadrillos{
    method peso() = cantidadLadrillos * 2
    method peligro() = 2
    var property cantidadLadrillos = 2 
}

object arenaAGranel{
    var property peso = 8
    method peligro() = 2 
}

object bateriaAntiaerea{
    method peligro() = if(self.estado()=="Cargada") 100 else 0
    method peso() {
        if (self.estado() == "Cargada"){
            return 300
        }
        else{
            return 200
        }
    } 
    var estado = "Cargada"
    method cambiarEstado() {
      if (self.estado()=="Cargada"){
        estado = "Descargada"
      }
      else{
        estado = "Cargada"
      }
    }
    method estado() = estado
}

object contenedorPortuario{
    const contenido =[]
    method cargar(unaCosa) {
        contenido.add(unaCosa)
    }
    method descargar() {
        contenido.remove(contenido.last())
    }

    method peso() = 100 + contenido.sum({c=> c.peso()})
    method peligro(){
        if (contenido.size()!=0){
            return (contenido.map({c=> c.peligro()})).max()
            }
        else{
            return 0
        }
    }
}

object residuosRadioactivos{
    var property peso = 8
    method peligro() = 200 
}

object embalaje{
    const contenido = []
    method cargar(unaCosa) {
        if(contenido.size()==1){
            self.descargar()
            contenido.add(unaCosa)
        }
        else{
            contenido.add(unaCosa)
        }
    }
    method descargar() {
        contenido.remove()
    }

    method peso() = contenido.first().peso() 
    method peligro() = (contenido.first().peligro()).div(2)
}