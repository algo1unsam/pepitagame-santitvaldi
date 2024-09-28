import niveles.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(4,4)

	method posicion()= position

	method image() {
		return if (self.estaEnElNido()) {
		"pepita-grande.png" 
		}else if ((self.position()== silvestre.position()) || energia <= 0){
			"pepita-gris.png" 
		}else "pepita.png"
	}

	method enegia() {
	  return energia
	}

	method energuia(cantidad) {
		energia = cantidad
		
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
		
	}

	method irA(nuevaPosicion) {
		if((nuevaPosicion.x() >= 0 && nuevaPosicion.x() <= 9) && (nuevaPosicion.y() >= 0 && nuevaPosicion.y() <= 9)){
			if(!self.estaCansada() ){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			}else{
				game.say(self, "me canse pa")
				game.schedule(2000, { game.stop() })
			}
		}
	}

	method movete() {
		const nuevaY = self.position().y() - 1 
		if(nuevaY>= 0 && nuevaY <= 9){	
		position = game.at(self.position().x(), nuevaY)  
		}
  	}

	method estaCansada() {
		return energia <= 0
		
	}


	method estaEnElNido() {
		return position == nido.position()
	}

	method estaEnElSuelo() {
		return position.y() == 0 
	}

}

