import elementos.*
import personajes.*
import wollok.game.*
import nivel_bloques.*
import nivel_llaves.*

object este {
	
	method siguientePosicion(position)
	{
		if (position.x() == game.width() - 1) 
		{
			return position
		} 
		else 
		{
			return position.right(1)
		}
	}
	method opuesto()
	{
		return oeste
	}
}


object oeste 
{
	method siguientePosicion(position) 
	{
		if (position.x() > 0) 
		{
			return position.left(1) 
		}
		else 
		{ 
			return position
		}
	}
	method opuesto()
	{
		return este
	}
}

object norte {
	
	method siguientePosicion(position)
	{
		if (position.y() == game.height() - 2) {
			return position
		} else {
			return position.up(1)
		}
	}
	method opuesto()
	{
		return sur
	}
}


object sur {
	method siguientePosicion(position) {
		if (position.y() > 0) {
			return position.down(1) 
		}
			else { return position }
	}
	method opuesto()
	{
		return norte
	}
}
