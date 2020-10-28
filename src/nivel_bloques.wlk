import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*
import direcciones.*


object nivelBloques 
{
	var nivelIniciado = false
	
	method agregarBloque(x,y)
		{
			game.addVisual(new Bloque(position=game.at(x,y)))
		}
	
	method gameStart()
	{
		keyboard.enter().onPressDo({ self.introduction() nivelIniciado = true})
		
	}	
	
	method introduction()
	{
		if(not nivelIniciado)
		{
			game.addVisual(new Fondo(image="fondoTextoBloques1.png"))
			game.schedule(2500, {game.addVisual(new Fondo(image="fondoTextoBloques2.png"))})
			game.schedule(5000, {self.configurate()})
		}
	}
	method configurate() {		
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoManaos.png"))	 
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(salida)
		self.agregarBloque(1.randomUpTo(9).truncate(0),1.randomUpTo(4).truncate(0))
		self.agregarBloque(10.randomUpTo(13).truncate(0),1.randomUpTo(9).truncate(0))
		self.agregarBloque(5.randomUpTo(13).truncate(0),10.randomUpTo(13).truncate(0))
		self.agregarBloque(1.randomUpTo(4).truncate(0),10.randomUpTo(13).truncate(0))
		self.agregarBloque(1.randomUpTo(4).truncate(0),5.randomUpTo(9).truncate(0))
			
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(waluigi)
		
		// teclado
		
		// Movimiento
		var ultimaDireccion = oeste
		keyboard.left().onPressDo({ waluigi.mover(oeste) ultimaDireccion = oeste waluigi.cambiarVestimentaIzquierda()})
		keyboard.right().onPressDo({ waluigi.mover(este) ultimaDireccion = este waluigi.cambiarVestimentaDerecha()})
		keyboard.up().onPressDo({ waluigi.mover(norte) ultimaDireccion = norte waluigi.cambiarVestimentaArriba()})
		keyboard.down().onPressDo({ waluigi.mover(sur) ultimaDireccion = sur waluigi.cambiarVestimentaAbajo()})
		
		
		keyboard.n().onPressDo({ self.terminar() })
		
		// Dev keys
		
		// reset nivel
		keyboard.num1().onPressDo({game.clear() nivelIniciado = false self.introduction()})
		// terminar nivel bloques
		keyboard.num2().onPressDo({waluigi.terminarNivelBloques() salida.terminarNivelBloques() self.terminar() })

		
		// Colisiones
		game.whenCollideDo(waluigi, { objeto => objeto.teChocoWaluigi(ultimaDireccion) })
		
		

	}
	
	method terminar() 
	{
		if(salida.puertaAbierta() && waluigi.position() == salida.position())
		{
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoTextoLlaves1.png"))
		game.addVisual(waluigi)
		// después de un ratito ...
		game.schedule(3000, 
			{
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="fondoTextoLlaves2.png"))
			// después de un ratito ...
			game.schedule(3000, 
			{
				game.clear()
				// cambio de fondo
				game.addVisual(new Fondo(image="fondoTextoLlaves3.png"))
				// después de un ratito ...
				game.schedule(3000, 
					{
					// ... limpio todo de nuevo
					game.clear()
					// y arranco el siguiente nivel
					nivelLlaves.configurate()
					})
			})
			})
		}
	}
		
}

