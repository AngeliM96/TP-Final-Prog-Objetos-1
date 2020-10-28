import direcciones.*
import wollok.game.*
import nivel_bloques.*
import personajes.*
import nivel_llaves.*
import nivel_bonus.*

// Items nivel Bloque
class Bloque 
{
	var property position
	const property image = "bloque.png" 	

	// agregar comportamiento	
	method teChocoWaluigi(ultimaDireccion)
	{
		if(not(position.x().between(5,9) && position.y().between(5,9)))
		{
			position = ultimaDireccion.siguientePosicion(position)
			if (position.x().between(5,9) && position.y().between(5,9)){
				salida.sumar()
			}
		}
	}	
}

object salida
{
	var property position = game.at(9,10)
	var property image = "puertaCerrada.png"
	var cajasEnDeposito = 0
	
	method abrirPuerta()
	{
		image = "puertaAbierta.png"
	}
	
	method puertaAbierta()
	{
		return cajasEnDeposito == 5
	}
	
	method teChocoWaluigi(ultimaDireccion)
	{
		
	}
	method sumar()
	{
		self.agregarADeposito()
		cajasEnDeposito += 1
		if(cajasEnDeposito == 5)
		{
			self.abrirPuerta()
		}
	}
	method agregarADeposito()
	{
		if (cajasEnDeposito == 0)
		{
			nivelBloques.agregarBloque(14, 15)
		}
		else if (cajasEnDeposito == 1)
		{
			nivelBloques.agregarBloque(13, 15)
		}
		else if (cajasEnDeposito == 2)
		{
			nivelBloques.agregarBloque(12, 15)
		}
		else if (cajasEnDeposito == 3)
		{
			nivelBloques.agregarBloque(11, 15)
		}
		else if (cajasEnDeposito == 4)
		{
			nivelBloques.agregarBloque(10, 15)
		}
	}
	
	method terminarNivelBloques()
	{
		cajasEnDeposito = 5
		self.abrirPuerta()
	}
}

// Items nivel Llaves	

class Botella
{
	var property position
	var property image = "botella.png" 
	method teChocoWaluigi()
	{
		if(image == "botella.png")
		{
			camion.agarrarBotella()
			game.removeVisual(self)
		}
	}	

}

object camion
{
	var property position = game.at(9,10)
	var property image = "vacio.png"
	var botellasAgarradas = 0
	
	method llegar()
	{
		image = "camion.png"
	}
	
	method llegoElCamion()
	{
		return botellasAgarradas == 3
	}
	
	method teChocoWaluigi()
	{
		if(self.llegoElCamion())
		{
			nivelLlaves.ganar()
		}
	}
	method agarrarBotella()
	{
		self.agregarAPack()
		botellasAgarradas += 1
		if(botellasAgarradas == 3)
		{
			self.llegar()
		}
	}
	method agregarAPack()
	{
		if (botellasAgarradas == 0)
		{
			nivelLlaves.agregarBotella(14, 15)
		}
		else if (botellasAgarradas == 1)
		{
			nivelLlaves.agregarBotella(13, 15)
		}
		else if (botellasAgarradas == 2)
		{
			nivelLlaves.agregarBotella(12, 15)
		}
		else if (botellasAgarradas == 3)
		{
			nivelLlaves.agregarBotella(11, 15)
		}
		else if (botellasAgarradas == 4)
		{
			nivelLlaves.agregarBotella(10, 15)
		}
		else if (botellasAgarradas == 5)
		{
			nivelLlaves.agregarBotella(9, 15)
		}
	}
}

class Caja
{
	var property position
	var property image = "caja.png" 
	method teChocoWaluigi()
	{
	}	
	method patada()
	{
		
	}
}

object cajaConSorpresa
{
	var property position = game.at(0.randomUpTo(14).truncate(0),5.randomUpTo(9).truncate(0))
	var property image = "caja.png"  
	method teChocoWaluigi()
	{
	}	
	method patada()
	{
		if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() - 1)) && (waluigi.direccionPatada() == oeste))
		{
			nivelLlaves.agregarBotella( self.position().x(), self.position().y() )
			game.removeVisual(self)
		}
		else if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() + 1)) && (waluigi.direccionPatada() == este))
			{
				nivelLlaves.agregarBotella( self.position().x(), self.position().y() )
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() - 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == sur))
			{
				nivelLlaves.agregarBotella( self.position().x(), self.position().y() )
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() + 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == norte))
			{
				nivelLlaves.agregarBotella( self.position().x(), self.position().y() )
				game.removeVisual(self)
			}
	}
}

object cajaVacia1
{
	var property position = game.at(0.randomUpTo(14).truncate(0),5.randomUpTo(9).truncate(0))
	var property image = "caja.png"  
	method teChocoWaluigi()
	{
	}	
	method patada()
	{
		if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() - 1)) && (waluigi.direccionPatada() == oeste))
		{
			game.removeVisual(self)
		}
		else if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() + 1)) && (waluigi.direccionPatada() == este))
			{
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() - 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == sur))
			{
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() + 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == norte))
			{

				game.removeVisual(self)
			}
	}
}

object cajaVacia2
{
	var property position = game.at(0.randomUpTo(14).truncate(0),5.randomUpTo(9).truncate(0))
	var property image = "caja.png"  
	method teChocoWaluigi()
	{
	}	
	method patada()
	{
		if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() - 1)) && (waluigi.direccionPatada() == oeste))
		{
			game.removeVisual(self)
		}
		else if((self.position().y() == waluigi.position().y()) && (self.position().x() == (waluigi.position().x() + 1)) && (waluigi.direccionPatada() == este))
			{
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() - 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == sur))
			{
				game.removeVisual(self)
			}
		else if((self.position().y() == (waluigi.position().y() + 1)) && (self.position().x() == waluigi.position().x()) && (waluigi.direccionPatada() == norte))
			{
				game.removeVisual(self)
			}
	}
}

class Pitusas
{
	var property position
	var property image  
	method teChocoWaluigi()
	{
		if(image == "pitusas.png")
		{
			waluigi.sumarEnergia(10)
			waluigi.actualizarVisualesEnergia()
			game.removeVisual(self)
			nivelLlaves.agregarPitusas("pitusas2.png")
		}
		else if(image == "pitusas2.png")
			{
				waluigi.sumarEnergia(30)
				waluigi.actualizarVisualesEnergia()
				game.removeVisual(self)
				nivelLlaves.agregarPitusas("pitusas.png")
			}
	}	
}

// Energia

object dibujoEnergia
{
	const property position = game.at(0,15)
	var property image = "energy2.png"
	method actualizar(img)
	{
		image = img
	}
}

object simboloEnergia
{
	const property position = game.at(3,15)
	const property image = "energia.png"
}

object contadorEnergia1
{
	const property position = game.at(2,15)
	var property image = "num4izk.png"
	method actualizar(img)
	{
		image = img
	}
}
object contadorEnergia2
{
	const property position = game.at(2,15)
	var property image = "num0der.png"
	method actualizar(img)
	{
		image = img
	}
}

// Elementos nivel bonus

object dibujoVida
{
	const property position = game.at(5,15)
	var property image = "energy4.png"
	method actualizar(img)
	{
		image = img
	}
}

object simboloVida
{
	const property position = game.at(8,15)
	const property image = "hp.png"
}

object contadorVida2
{
	const property position = game.at(7,15)
	var property image = "num8izk.png"
	method actualizar(img)
	{
		image = img
	}
}
object contadorVida1
{
	const property position = game.at(7,15)
	var property image = "num0der.png"
	method actualizar(img)
	{
		image = img
	}
}

object contadorBombas
{
	const property position = game.at(14,15)
	var property image = "num0izk.png"
	method actualizar(img)
	{
		image = img
	}
}

class Bomba
{
	var property position
	const property image = "bombab.png"
	method teChocoWaluigi(ultimaDireccion)
	{
		waluigi.sumarBomba()
		waluigi.actualizarBombas()
		game.removeVisual(self)
		nivelBonus.agregarBomba(0.randomUpTo(14).truncate(0), 0.randomUpTo(13).truncate(0))
	}
	method teChocoBomba() {}
}

class PitusasMasPulenta
{
	var property position
	var property image  
	method teChocoWaluigi(ultimaDireccion)
	{
		if(image == "pitusas.png")
		{
			waluigi.sumarEnergia(20)
			waluigi.actualizarVisualesEnergia()
			game.removeVisual(self)
			nivelBonus.agregarPitusas("pitusas2.png")
		}
		else if(image == "pitusas2.png")
			{
				waluigi.sumarEnergia(40)
				waluigi.actualizarVisualesEnergia()
				game.removeVisual(self)
				nivelBonus.agregarPitusas("pitusas.png")
			}
	}
	method teChocoBomba() {  }
}

class BotellaMasPulenta
{
	var property position
	var property image = "botella.png" 
	method teChocoWaluigi(ultimaDireccion)
	{
		if(image == "botella.png")
		{
			waluigi.sumarVida(15)
			game.removeVisual(self)
			nivelBonus.agregarBotella()
			waluigi.actualizarVisualesVida()
			if(waluigi.cuantaVida() > 80)
			{
				game.schedule(1000, {nivelBonus.gameoverPitusas()})
			}
		}
	}	
	method teChocoBomba() {  }

}

object bomba {
    var property position = game.at(10,15)
    var property image = "vacio.png"
	var property tirarAl = oeste
	
	method asignarDireccion(newDir)
	{
		tirarAl = newDir
	}
    method mover() 
    {
        if(tirarAl == oeste)
        {
            image = "bombad.png"
            position = tirarAl.siguientePosicion(position)
        }
        else if(tirarAl == sur)
        {
            image = "bombab.png"
            position = tirarAl.siguientePosicion(position)
        }
        else if(tirarAl == este)
        {
            image = "bombai.png"
            position = tirarAl.siguientePosicion(position)
        }
        else if(tirarAl == norte)
        {
            image = "bombar.png"
            position = tirarAl.siguientePosicion(position)
        }
    }
    
    method aPenitencia()
    {
    	position = game.at(10,15)
    	image = "vacio.png"
    }
    
    method teChocoWaluigi(ultimaDireccion)
    {
    	
    }
}