import wollok.game.*
import fondo.*
import direcciones.*
import nivel_llaves.*
import elementos.*
import nivel_bonus.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object waluigi 
{
	var property position = game.at(10,8)
	var property image = "waluigi.png"	
	var property vestimentaIzquierda = ["waluigil1.png","waluigil2.png","waluigil3.png","waluigil4.png"]
	var posicionIzquierda = 1
	var property vestimentaDerecha = ["waluigir1.png","waluigir2.png","waluigir3.png","waluigir4.png"]
	var posicionDerecha = 1
	var property vestimentaArriba = ["waluigiu1.png","waluigiu2.png","waluigiu3.png","waluigiu4.png"]
	var posicionArriba = 1
	var property vestimentaAbajo = ["waluigid1.png","waluigid2.png","waluigid3.png","waluigid4.png"]
	var posicionAbajo = 1
	
	var property direccionPatada  
	var property energia = 40
	var property bombas = 0
	var property vida = 80
	
	method sumarVida(cant)
	{
		vida += cant
	}
	method restarVida(cant)
	{
		vida -= cant
	}
	
	method cuantaVida()
	{
		return vida
	}
	
	method actualizarDibujoVida()
	{
		if (vida.between(61,80))
		{
			dibujoVida.actualizar("energy4.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
		else if (vida.between(41,60))
		{
			dibujoVida.actualizar("energy3.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
		else if (vida.between(21,40))
		{
			dibujoVida.actualizar("energy2.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
		else if (vida.between(1,20))
		{
			dibujoVida.actualizar("energy1.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
		else if (vida == 0)
		{
			dibujoVida.actualizar("energy0.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
		else
		{
			dibujoVida.actualizar("energy4.png")
			game.removeVisual(dibujoVida)
			game.addVisual(dibujoVida)
		}
	}
	method actualizarVidaDecenas() // Solucion provisoria a menos que no se me ocurra una mejor
	{
		if((vida / 10).truncate(0) == 8)
		{
			contadorVida1.actualizar("num8izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 7)
		{
			contadorVida1.actualizar("num7izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 6)
		{
			contadorVida1.actualizar("num6izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 5)
		{
			contadorVida1.actualizar("num5izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 4)
		{
			contadorVida1.actualizar("num4izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 3)
		{
			contadorVida1.actualizar("num3izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 2)
		{
			contadorVida1.actualizar("num2izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 1)
		{
			contadorVida1.actualizar("num1izk.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		else if((vida / 10).truncate(0) == 0)
		{
			contadorVida1.actualizar("vacio.png")
			game.removeVisual(contadorVida1)
			game.addVisual(contadorVida1)
		}
		
	}
	method actualizarVidaUnidades() // Solucion provisoria a menos que no se me ocurra una mejor
	{
		if((vida % 10) == 9)
		{
			contadorVida2.actualizar("num9der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 8)
		{
			contadorVida2.actualizar("num8der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 7)
		{
			contadorVida2.actualizar("num7der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 6)
		{
			contadorVida2.actualizar("num6der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 5)
		{
			contadorVida2.actualizar("num5der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 4)
		{
			contadorVida2.actualizar("num4der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 3)
		{
			contadorVida2.actualizar("num3der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 2)
		{
			contadorVida2.actualizar("num2der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 1)
		{
			contadorVida2.actualizar("num1der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
		else if((vida % 10) == 0)
		{
			contadorVida2.actualizar("num0der.png")
			game.removeVisual(contadorVida2)
			game.addVisual(contadorVida2)
		}
	}
	method actualizarVisualesVida()
	{
		self.actualizarDibujoVida()
		self.actualizarVidaDecenas()
		self.actualizarVidaUnidades()
	}
	

	
	method sumarEnergia(cant)
	{
		energia += cant
	}
	method restarEnergia(cant)
	{
		energia -= cant
	}
	method cuantaEnergia()
	{
		return energia
	}
	
	method calcularEnergia() 
	{
		self.restarEnergia(1)
		self.actualizarVisualesEnergia()
		
		if(energia == 0)
		{
			game.schedule(1000, {nivelLlaves.gameover()})
		}
		else if(energia > 80)
		{
			game.schedule(1000, {nivelLlaves.gameoverPitusas()})
		}
	}
	
	method actualizarDibujoEnergia()
	{
		if (energia.between(61,80))
		{
			dibujoEnergia.actualizar("energy4.png")
			game.removeVisual(dibujoEnergia)
			game.addVisual(dibujoEnergia)
		}
		else if (energia.between(41,60))
		{
			dibujoEnergia.actualizar("energy3.png")
			game.removeVisual(dibujoEnergia)
			game.addVisual(dibujoEnergia)
		}
		else if (energia.between(21,40))
		{
			dibujoEnergia.actualizar("energy2.png")
			game.removeVisual(dibujoEnergia)
			game.addVisual(dibujoEnergia)
		}
		else if (energia.between(1,20))
		{
			dibujoEnergia.actualizar("energy1.png")
			game.removeVisual(dibujoEnergia)
			game.addVisual(dibujoEnergia)
		}
		else
		{
			dibujoEnergia.actualizar("energy0.png")
			game.removeVisual(dibujoEnergia)
			game.addVisual(dibujoEnergia)
		}
	}
	method actualizarEnergiaDecenas() // Solucion provisoria a menos que no se me ocurra una mejor
	{
		/*if((energia / 10).between(9.0,9.9))
		{
			contadorEnergia1.actualizar("num9izk.png")
		}
		else */if((energia / 10).truncate(0) == 8)
		{
			contadorEnergia1.actualizar("num8izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 7)
		{
			contadorEnergia1.actualizar("num7izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 6)
		{
			contadorEnergia1.actualizar("num6izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 5)
		{
			contadorEnergia1.actualizar("num5izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 4)
		{
			contadorEnergia1.actualizar("num4izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 3)
		{
			contadorEnergia1.actualizar("num3izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 2)
		{
			contadorEnergia1.actualizar("num2izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 1)
		{
			contadorEnergia1.actualizar("num1izk.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		else if((energia / 10).truncate(0) == 0)
		{
			contadorEnergia1.actualizar("vacio.png")
			game.removeVisual(contadorEnergia1)
			game.addVisual(contadorEnergia1)
		}
		
	}
	method actualizarEnergiaUnidades() // Solucion provisoria a menos que no se me ocurra una mejor
	{
		if((energia % 10) == 9)
		{
			contadorEnergia2.actualizar("num9der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 8)
		{
			contadorEnergia2.actualizar("num8der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 7)
		{
			contadorEnergia2.actualizar("num7der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 6)
		{
			contadorEnergia2.actualizar("num6der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 5)
		{
			contadorEnergia2.actualizar("num5der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 4)
		{
			contadorEnergia2.actualizar("num4der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 3)
		{
			contadorEnergia2.actualizar("num3der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 2)
		{
			contadorEnergia2.actualizar("num2der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 1)
		{
			contadorEnergia2.actualizar("num1der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
		else if((energia % 10) == 0)
		{
			contadorEnergia2.actualizar("num0der.png")
			game.removeVisual(contadorEnergia2)
			game.addVisual(contadorEnergia2)
		}
	}
	method actualizarVisualesEnergia()
	{
		self.actualizarDibujoEnergia()
		self.actualizarEnergiaDecenas()
		self.actualizarEnergiaUnidades()
	}
	
	method guardarDireccion(dir)
	{
		direccionPatada = dir
	}
	
	method direccionPatada()
	{
		return direccionPatada
	}
	
	method patada()
	{
		if (direccionPatada == oeste)
		{
			image = vestimentaIzquierda.get(0)
			game.schedule(100,{image = vestimentaIzquierda.get(1)})
			game.schedule(200,{image = vestimentaIzquierda.get(0)})
			
		}
		else if (direccionPatada == este)
		{
			image = vestimentaDerecha.get(0)
			game.schedule(100,{image = vestimentaDerecha.get(1)})
			game.schedule(200,{image = vestimentaDerecha.get(0)})
		}
		else if (direccionPatada == norte)
		{
			image = vestimentaArriba.get(0)
			game.schedule(100,{image = vestimentaArriba.get(1)})
			game.schedule(200,{image = vestimentaArriba.get(0)})
		}
		else if (direccionPatada == sur)
		{
			image = vestimentaAbajo.get(0)
			game.schedule(100,{image = vestimentaAbajo.get(1)})
			game.schedule(100,{image = vestimentaAbajo.get(1)})
		}
		self.restarEnergia(6)
		self.actualizarVisualesEnergia()
	}
	
	method cambiarVestimentaIzquierda()
	{
		if (posicionIzquierda == vestimentaIzquierda.size())
		{
			posicionIzquierda = 0
			image = vestimentaIzquierda.get(posicionIzquierda)
			posicionIzquierda += 1
			
		}
		else
		{
			image = vestimentaIzquierda.get(posicionIzquierda)
			posicionIzquierda += 1
		}
	}
	method cambiarVestimentaDerecha()
	{
		if (posicionDerecha == vestimentaDerecha.size())
		{
			posicionDerecha = 0
			image = vestimentaDerecha.get(posicionDerecha)
			posicionDerecha += 1
			
		}
		else
		{
			image = vestimentaDerecha.get(posicionDerecha)
			posicionDerecha += 1
		}
	}
	method cambiarVestimentaArriba()
	{
		if (posicionArriba == vestimentaArriba.size())
		{
			posicionArriba = 0
			image = vestimentaArriba.get(posicionArriba)
			posicionArriba += 1
			
		}
		else
		{
			image = vestimentaArriba.get(posicionArriba)
			posicionArriba += 1
		}
	}
	method cambiarVestimentaAbajo()
	{
		if (posicionAbajo == vestimentaAbajo.size())
		{
			posicionAbajo = 0
			image = vestimentaAbajo.get(posicionAbajo)
			posicionAbajo += 1
			
		}
		else
		{
			image = vestimentaAbajo.get(posicionAbajo)
			posicionAbajo += 1
		}
	}
	method mover(direccion)
	{
		if(( not self.hayCajaEn(direccion) ) && ( not self.hayCajaVacia1En(direccion) ) && ( not self.hayCajaVacia2En(direccion) ))
		{
			position = direccion.siguientePosicion(position)
		}
		else
		{
			game.say(self, "No puedo pasar por acá")
		}

	}
	
	method hayCajaEn(direccion) {
		return (direccion.siguientePosicion(position) == cajaConSorpresa.position() && game.hasVisual(cajaConSorpresa))
	}
	
	method hayCajaVacia1En(direccion) {
		return (direccion.siguientePosicion(position) == cajaVacia1.position() && game.hasVisual(cajaVacia1))
	}
	
	method hayCajaVacia2En(direccion) {
		return (direccion.siguientePosicion(position) == cajaVacia2.position() && game.hasVisual(cajaVacia2))
	}
	
	
	method terminarNivelBloques()
	{
		position = game.at(9,10)
	}
	
	method sumarBomba()
	{
		bombas += 1
	}
	method actualizarBombas()
	{
		if(bombas == 8 )
			{
				contadorBombas.actualizar("num8izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 7 )
			{
				contadorBombas.actualizar("num7izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 6 )
			{
				contadorBombas.actualizar("num6izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 5 )
			{
				contadorBombas.actualizar("num5izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 4 )
			{
				contadorBombas.actualizar("num4izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 3 )
			{
				contadorBombas.actualizar("num3izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 2 )
			{
				contadorBombas.actualizar("num2izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else if(bombas == 1 )
			{
				contadorBombas.actualizar("num1izk.png")
				game.removeVisual(contadorBombas)
				game.addVisual(contadorBombas)
			}
		else
		{
			contadorBombas.actualizar("num0izk.png")
			game.removeVisual(contadorBombas)
			game.addVisual(contadorBombas)
		}
	}

	method restarBomba() 
	{
        bombas -= 1
    }

    method cantidadBombas() 
	{ 
		return bombas 
	}

	method lanzarBomba() {
        if (bombas > 0) 
        {
        	bomba.position(self.position())
            game.schedule(100, {bomba.asignarDireccion(direccionPatada) bomba.mover()})
            game.schedule(200, {bomba.asignarDireccion(direccionPatada)  bomba.mover()})
            game.schedule(300, {bomba.asignarDireccion(direccionPatada)  bomba.mover()})
            game.schedule(400, {bomba.aPenitencia()} )
			self.restarBomba()
            self.actualizarBombas()
        }
    }
	method teChocoBomba() 
	{

	}

}

object mario {
	// la position cambiala por la que te parezca, le tire ese numero para que no se enoje el codigo por no tener position
	var property position = game.at(6,8)
	var property image = "marioAb.png"

	method mover(direccion) 
	{
		if(direccion == oeste)
		{
			image = "marioIzk.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == sur)
		{
			image = "marioAb.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == este)
		{
			image = "marioDer.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == norte)
		{
			image = "marioAr.png"
			position = direccion.siguientePosicion(position)
		}
	}
	
	method moverEnCuadrantes() {
		if (self.position().x() < waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			var posicionX = waluigi.position().x() - self.position().x()
			var posicionY = waluigi.position().y() - self.position().y()
			if (posicionX > posicionY) {
				self.mover(este)
			}
			else {
				self.mover(norte)
			}
		}
		else if (self.position().x() < waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			var posicionX = waluigi.position().x() - self.position().x()
			var posicionY = self.position().y() - waluigi.position().y()
			if (posicionX > posicionY) {
				self.mover(este)
			}
			else {
				self.mover(sur)
			}
		}
		else if (self.position().x() > waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			var posicionX = self.position().x() - waluigi.position().x()
			var posicionY = waluigi.position().y() - self.position().y()
			if (posicionX > posicionY) {
				self.mover(oeste)
			}
			else {
				self.mover(norte)
			}
		}
		else if (self.position().x() > waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			var posicionX = self.position().x() - waluigi.position().x()
			var posicionY = self.position().y() - waluigi.position().y()
			if (posicionX > posicionY) {
				self.mover(oeste)
			}
			else {
				self.mover(sur)
			}
		}
	}
	
	method moverMario() {
		if (self.position().x() == waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			self.mover(sur)
		}
		else if (self.position().x() == waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			self.mover(norte)
		}
		else if (self.position().y() == waluigi.position().y() && self.position().x() > waluigi.position().x()) {
			self.mover(oeste)
		}
		else if (self.position().y() == waluigi.position().y() && self.position().x() < waluigi.position().x()) {
			self.mover(este)
		}
		else {
			self.moverEnCuadrantes()
		}
	}
	method teChocoWaluigi(ultimaDireccion)
	{
		//game.onTick(750, "nerfeando un poco el daño" ,{waluigi.restarVida(20)})
		waluigi.restarVida(20)
		waluigi.actualizarVisualesVida()
		waluigi.mover(ultimaDireccion.opuesto())
		if(waluigi.cuantaVida() <= 0)
		{
			game.schedule(1000, {nivelBonus.gameoverVida()})
		}
	}
	method teChocoBomba() 
	{
        game.removeVisual(self)
    }
	
}

object luigi {
	// la position cambiala por la que te parezca, le tire ese numero para que no se enoje el codigo por no tener position
	var property position = game.at(3,3)
	var property image = "luigiAb.png"
	
	method mover(direccion) 
	{
		if(direccion == oeste)
		{
			image = "luigiIzk.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == sur)
		{
			image = "luigiAb.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == este)
		{
			image = "luigiDer.png"
			position = direccion.siguientePosicion(position)
		}
		else if(direccion == norte)
		{
			image = "luigiAr.png"
			position = direccion.siguientePosicion(position)
		}
	}
	
	method moverEnCuadrantes() {
		if (self.position().x() < waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			var posicionX = waluigi.position().x() - self.position().x()
			var posicionY = waluigi.position().y() - self.position().y()
			if (posicionX > posicionY) {
				self.mover(este)
			}
			else {
				self.mover(norte)
			}
		}
		else if (self.position().x() < waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			var posicionX = waluigi.position().x() - self.position().x()
			var posicionY = self.position().y() - waluigi.position().y()
			if (posicionX > posicionY) {
				self.mover(este)
			}
			else {
				self.mover(sur)
			}
		}
		else if (self.position().x() > waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			var posicionX = self.position().x() - waluigi.position().x()
			var posicionY = waluigi.position().y() - self.position().y()
			if (posicionX > posicionY) {
				self.mover(oeste)
			}
			else {
				self.mover(norte)
			}
		}
		else if (self.position().x() > waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			var posicionX = self.position().x() - waluigi.position().x()
			var posicionY = self.position().y() - waluigi.position().y()
			if (posicionX > posicionY) {
				self.mover(oeste)
			}
			else {
				self.mover(sur)
			}
		}
	}
	
	method moverLuigi() {
		if (self.position().x() == waluigi.position().x() && self.position().y() > waluigi.position().y()) {
			self.mover(sur)
		}
		else if (self.position().x() == waluigi.position().x() && self.position().y() < waluigi.position().y()) {
			self.mover(norte)
		}
		else if (self.position().y() == waluigi.position().y() && self.position().x() > waluigi.position().x()) {
			self.mover(oeste)
		}
		else if (self.position().y() == waluigi.position().y() && self.position().x() < waluigi.position().x()) {
			self.mover(este)
		}
		else {
			self.moverEnCuadrantes()
		}
	}
	
	method teChocoWaluigi(ultimaDireccion)
	{
		//game.onTick(750, "nerfeando un poco el daño" ,{waluigi.restarVida(20)})
		waluigi.restarVida(20)
		waluigi.actualizarVisualesVida()
		waluigi.mover(ultimaDireccion.opuesto())
		if(waluigi.cuantaVida() <= 0)
		{
			game.schedule(1000, {nivelBonus.gameoverVida()})
		}
	}
	method teChocoBomba() 
	{
        game.removeVisual(self)
    }
	
}