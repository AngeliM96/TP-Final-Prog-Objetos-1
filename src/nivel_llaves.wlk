import wollok.game.*
import fondo.*
import personajes.*
import direcciones.*
import elementos.*
import nivel_bonus.*

object nivelLlaves 
{
	
	method agregarBotella(x,y)
		{
			game.addVisual(new Botella(position=game.at(x,y)))
		}
		
	method agregarPitusas(pitusas)
		{
			game.addVisual(new Pitusas(image= pitusas, position=game.at(0.randomUpTo(14).truncate(0),0.randomUpTo(13).truncate(0))))
		}
	
	method configurate() 
	{
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoManaos.png"))
				 
		// otros visuals, p.ej. bloques o llaves
			
		// personaje, es importante que sea el último visual que se agregue
		self.agregarPitusas("pitusas.png")
		self.agregarBotella(0.randomUpTo(14).truncate(0),0.randomUpTo(4).truncate(0))
		//self.agregarBotella(0.randomUpTo(14).truncate(0),5.randomUpTo(9).truncate(0))
		self.agregarBotella(0.randomUpTo(14).truncate(0),10.randomUpTo(14).truncate(0))
		game.addVisual(cajaConSorpresa)
		game.addVisual(cajaVacia1)
		game.addVisual(cajaVacia2)
		
		
		game.addVisual(camion)
		
		game.addVisual(dibujoEnergia)
		game.addVisual(contadorEnergia1)
		game.addVisual(contadorEnergia2)
		game.addVisual(simboloEnergia)
		
		game.addVisual(waluigi)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.num3().onPressDo({ self.ganar() })
		
		
		keyboard.left().onPressDo({ waluigi.mover(oeste) waluigi.guardarDireccion(oeste) waluigi.cambiarVestimentaIzquierda() waluigi.calcularEnergia()})
		keyboard.right().onPressDo({ waluigi.mover(este) waluigi.guardarDireccion(este) waluigi.cambiarVestimentaDerecha() waluigi.calcularEnergia()})
		keyboard.up().onPressDo({ waluigi.mover(norte) waluigi.guardarDireccion(norte) waluigi.cambiarVestimentaArriba() waluigi.calcularEnergia()})
		keyboard.down().onPressDo({ waluigi.mover(sur) waluigi.guardarDireccion(sur) waluigi.cambiarVestimentaAbajo() waluigi.calcularEnergia()})

		keyboard.e().onPressDo({ waluigi.patada() cajaConSorpresa.patada() cajaVacia1.patada() cajaVacia2.patada()})
		// colisiones, acá sí hacen falta
		game.whenCollideDo(waluigi, { objeto => objeto.teChocoWaluigi() })
	}

	method gameover()
	{
		game.clear()
			// cambio de fondo
		game.addVisual(new Fondo(image="gameover.png"))
		game.schedule(3000, {
				// fin del juego
				game.stop()
			})
	}
	
	method gameoverPitusas()
	{
		game.clear()
			// cambio de fondo
		game.addVisual(new Fondo(image="gameoverPitusas.png"))
		game.schedule(3000, {
				// fin del juego
				game.stop()
			})
	}
	
	method ganar() 
	{
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoTextoBonus1.png"))
		game.addVisual(waluigi)
		// después de un ratito ...
		game.schedule(3000, 
			{
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="fondoBonus1.png"))
			// después de un ratito ...
			game.schedule(3000, 
			{
				game.clear()
				// cambio de fondo
				game.addVisual(new Fondo(image="fondoTextoBonus2.png"))
				// después de un ratito ...
				game.schedule(3000, 
					{
					// ... limpio todo de nuevo
					game.clear()
					// y arranco el siguiente nivel
					nivelBonus.configurate()
					})
			})
			})
	}
}
