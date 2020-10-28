import wollok.game.*
import fondo.*
import personajes.*
import direcciones.*
import elementos.*

object nivelBonus
{
	method agregarBomba(x,y)
		{
			game.addVisual(new Bomba(position=game.at(x,y)))
		}
	method agregarPitusas(pitusas)
		{
			game.addVisual(new PitusasMasPulenta(image= pitusas, position=game.at(0.randomUpTo(14).truncate(0),0.randomUpTo(13).truncate(0))))
		}
	method agregarBotella()
		{
			game.addVisual(new BotellaMasPulenta(position=game.at(0.randomUpTo(14).truncate(0),0.randomUpTo(13).truncate(0))))
		}

	method sePuedeGanar()
		{
			if((not game.hasVisual(mario)) && (not game.hasVisual(luigi)))
			{
				self.ganar()
			}
		}

	method configurate() 
	{
		
		waluigi.sumarEnergia(60 - waluigi.cuantaEnergia())
		game.addVisual(new Fondo(image="fondoBonus.png"))
		game.addVisual(dibujoEnergia)
		game.addVisual(contadorEnergia1)
		game.addVisual(contadorEnergia2)
		game.addVisual(simboloEnergia)
		game.addVisual(dibujoVida)
		game.addVisual(contadorVida1)
		game.addVisual(contadorVida2)
		game.addVisual(simboloVida)
		self.agregarBomba(13,15)
		game.addVisual(contadorBombas)
		self.agregarBomba(0.randomUpTo(14).truncate(0), 0.randomUpTo(13).truncate(0))
		self.agregarPitusas("pitusas.png")
		self.agregarBotella()
		game.addVisual(bomba)
		
		game.addVisual(mario)
		game.onTick(500, "mario se mueve", {mario.moverMario()})
		game.addVisual(luigi)
		game.onTick(750, "luigi se mueve", {luigi.moverLuigi()})
		game.addVisual(waluigi)
		game.onTick(500, "chequea si los enemigos estan vivos", {self.sePuedeGanar()})

		
		
		// teclado
		var ultimaDireccion = oeste
		keyboard.left().onPressDo({ waluigi.mover(oeste) waluigi.guardarDireccion(oeste) ultimaDireccion = oeste waluigi.cambiarVestimentaIzquierda() waluigi.calcularEnergia()})
		keyboard.right().onPressDo({ waluigi.mover(este) waluigi.guardarDireccion(este) ultimaDireccion = este waluigi.cambiarVestimentaDerecha() waluigi.calcularEnergia()})
		keyboard.up().onPressDo({ waluigi.mover(norte) waluigi.guardarDireccion(norte) ultimaDireccion = norte waluigi.cambiarVestimentaArriba() waluigi.calcularEnergia()})
		keyboard.down().onPressDo({ waluigi.mover(sur) waluigi.guardarDireccion(sur) ultimaDireccion = sur waluigi.cambiarVestimentaAbajo() waluigi.calcularEnergia()})

		keyboard.e().onPressDo({ waluigi.lanzarBomba() })

		keyboard.num4().onPressDo({ self.ganar() })
		// colisiones, acá sí hacen falta
		//game.whenCollideDo(waluigi, { objeto => objeto.teChocoWaluigi() })
		game.whenCollideDo(bomba, { objeto => objeto.teChocoBomba() })
		game.onCollideDo(waluigi, { objeto => objeto.teChocoWaluigi(ultimaDireccion)})
	}

	method gameover()
	{
		game.clear()
			// cambio de fondo
		game.addVisual(new Fondo(image="gameover.png"))
		game.schedule(2000,{game.start()})
	}
	
	method gameoverVida()
	{
		game.clear()
			// cambio de fondo
		game.addVisual(new Fondo(image="gameoverVida.png"))
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
	
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="ganaste.png"))
		// después de un ratito ...
		game.schedule(3000,{game.stop()})
	}
	
	
}