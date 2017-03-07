package ia.pr3;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;

public class Pr3State {
	
	//Constructores
	public Pr3State() {
		this(5,6,7,4);
	}
	
	public Pr3State(Pr3State other) {
		this(other.b1, other.b2, other.b3, other.h);
	}

	public Pr3State(int b1, int b2, int b3, int h) {
		this.b1 = b1;
		this.b2 = b2;
		this.b3 = b3;
		this.h = h;
	}
	
	//Operaciones
	/**
	 * Intercambia el hueco con la ficha en la posición h + desp. Engloba las 6 operaciones posibles.
	 * @param desp desplazamiento del hueco. Los valores permitidos son {-3,-2,-1,1,2,3}
	 */
	public void switchGap(int desp){
		if (this.b1 == this.h + desp)
			this.b1 =h;
		if (this.b2 == this.h + desp)
			this.b2 =h;
		if (this.b3 == this.h + desp)
			this.b3 =h;
		
		this.h += desp;
	}
	
	/**
	 * Comprueba si el operador se puede aplicar teniendo en cuenta las precondiciones
	 *  y poscondiciones. No es necesario comprobar los estados de peligro, ya que no hay.
	 * @param action
	 * @return
	 */
	public boolean validMove(Action action) {

		if(    (action.equals(moveTileLeft)    && this.h < 7) 	//switchGap(+1)
			|| (action.equals(moveTileRight)   && this.h > 1)	//switchGap(-1)
			|| (action.equals(jump1TileLeft)   && this.h < 6)	//switchGap(+2)
			|| (action.equals(jump1TileRight)  && this.h > 2)	//switchGap(-2)
			|| (action.equals(jump2TilesLeft)  && this.h < 5)	//switchGap(+3)
			|| (action.equals(jump2TilesRight) && this.h > 3)	//switchGap(-3)
			)
			return true;
		else
			return false;
	}

	//getters y setters
	public int getB1() {
		return b1;
	}

	public int getB2() {
		return b2;
	}

	public int getB3() {
		return b3;
	}

	public int getH() {
		return h;
	}
	
	//redefiniciones
	public boolean equals(Object o) {
		if (this == o)
			return true;
		
		if ( (o == null) || (this.getClass() != o.getClass()) )
			return false;
		
		Pr3State state = (Pr3State) o;
		if (   this.b1 == state.b1 && this.b2 == state.b2
			&& this.b3 == state.b3 && this.h == state.h
			)
			return true;
		else
			return false;
		
	}
	
	public int hashCode() {
		return 1000*b1 + 100*b2 + 10*b3 +h;
	}

	private int b1;
	private int b2;
	private int b3;
	private int h;
	
	public static Action moveTileLeft = new DynamicAction("moveTileLeft");
	public static Action moveTileRight = new DynamicAction("moveTileRight");
	public static Action jump1TileLeft = new DynamicAction("jump1TileLeft");
	public static Action jump1TileRight = new DynamicAction("jump1TileRight");
	public static Action jump2TilesLeft = new DynamicAction("jump2TilesLeft");
	public static Action jump2TilesRight = new DynamicAction("jump2TilesRight");

}
