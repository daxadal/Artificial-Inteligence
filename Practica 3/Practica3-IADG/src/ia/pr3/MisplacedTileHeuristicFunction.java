package ia.pr3;

import aima.core.search.framework.HeuristicFunction;

public class MisplacedTileHeuristicFunction implements HeuristicFunction{

	@Override
	public double h(Object arg0) {
		Pr3State state = (Pr3State) arg0;
		return getNumberOfMisplacedTiles(state);
	}

	private int getNumberOfMisplacedTiles(Pr3State state) {
		int numberOfMisplacedTiles = 0;
		int B1 = state.getB1();
		int B2 = state.getB2();
		int B3 = state.getB3();
		int H = state.getH();
		// La heurística suma la cantidad de fichas negras que aun tienen que pasar 
		// por encima de las blancas. Cuentan el triple las fichas que aun tienen tres
		// fichas blancas a la derecha; el doble las que tienen dos, cuentan uno las 
		// que tienen uno y no cuentan las que ya no tienen más fichas blancas a la 
		// derecha.
		if (B1 == 1) {
			if (B2 == 2) {
				if (B3 == 3) {
					numberOfMisplacedTiles = 0;
				} else if (B3 == 4) {
					if (H != 3)
						numberOfMisplacedTiles += 1;
				} else if (B3 == 5) {
					if (H == 3 || H == 4)
						numberOfMisplacedTiles += 1;
					else
						numberOfMisplacedTiles += 2;
				} else if (B3 == 6) {
					if (H == 7)
						numberOfMisplacedTiles += 3;
					else
						numberOfMisplacedTiles += 2;
				} else
					numberOfMisplacedTiles += 3;
			} else if (B2 == 3) {
				if (H != 2)
					numberOfMisplacedTiles += 2;
				if (B3 == 4) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 5) {
					if (H != 4)
						numberOfMisplacedTiles += 1;
				} else if (B3 == 6) {
					if (H == 4 || H == 5)
						numberOfMisplacedTiles += 1;
					else
						numberOfMisplacedTiles += 2;
				} else if (H == 2) {
					numberOfMisplacedTiles += 3;
				} else
					numberOfMisplacedTiles += 2;
			} else if (B2 == 4) {
				if (H == 2 || H == 3) {
					numberOfMisplacedTiles += 2;
				} else {
					numberOfMisplacedTiles += 4;
				}
				if (B3 == 5) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 6) {
					if (H != 5)
						numberOfMisplacedTiles += 1;
				} else if (H == 5 || H == 6) {
					numberOfMisplacedTiles += 1;
				} else
					numberOfMisplacedTiles += 2;
			} else if (B2 == 5) {
				if (H == 2 || H == 3 || H == 4) {
					numberOfMisplacedTiles += 4;
				} else {
					numberOfMisplacedTiles += 6;
				}
				if (B3 == 6) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 7 && H != 6)
					numberOfMisplacedTiles += 1;
			} else
				numberOfMisplacedTiles += 6;
			
		} else if (B1 == 2) {
			if (H != 1)
				numberOfMisplacedTiles += 3;
			if (B2 == 3) {
				if (B3 == 4) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 5) {
					if (H != 4)
						numberOfMisplacedTiles += 1;
				} else if (B3 == 6) {
					if (H == 4 || H == 5)
						numberOfMisplacedTiles += 1;
					else
						numberOfMisplacedTiles += 2;
				} else if (H == 1) {
					numberOfMisplacedTiles += 3;
				} else
					numberOfMisplacedTiles += 2;
			} else if (B2 == 4) {
				if (H != 3)
					numberOfMisplacedTiles += 2;
				if (B3 == 5) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 6) {
					if (H != 5)
						numberOfMisplacedTiles += 1;
				} else if (H == 5 || H == 6) {
					numberOfMisplacedTiles += 1;
				} else
					numberOfMisplacedTiles += 2;
			} else if (B2 == 5) {
				if (H == 3 || H == 4) {
					numberOfMisplacedTiles += 2;
				} else
					numberOfMisplacedTiles += 4;
				if (B3 == 7 && H != 6)
					numberOfMisplacedTiles += 1;
			} else if (B2 == 6) {
				if (H == 3 || H == 4 || H == 5) {
					numberOfMisplacedTiles += 4;
				} else
					numberOfMisplacedTiles += 6;
			}
		} else if (B1 == 3) {
			if (H == 1 || H == 2) {
				numberOfMisplacedTiles += 3;
			} else
				numberOfMisplacedTiles += 6;
			if (B2 == 4) {
				if (B3 == 5) {
					numberOfMisplacedTiles += 0;
				} else if (B3 == 6) {
					if (H != 5)
						numberOfMisplacedTiles += 1;
				} else if (H == 5 || H == 6) {
					numberOfMisplacedTiles += 1;
				} else
					numberOfMisplacedTiles += 2;
			} else if (B2 == 5) {
				if (H != 4)
					numberOfMisplacedTiles += 2;
				if (B3 == 7 && H != 6)
					numberOfMisplacedTiles += 1;
			} else {
				if (H == 4 || H == 5)
					numberOfMisplacedTiles += 2;
				else
					numberOfMisplacedTiles += 4;
			}
		} else if (B1 == 4) {
			if (H == 1 || H == 2 || H == 3)
				numberOfMisplacedTiles += 6;
			else
				numberOfMisplacedTiles += 9;
			if (B2 == 5) {
				if (B3 == 6) {
					numberOfMisplacedTiles += 0;
				} else if (H != 6)
					numberOfMisplacedTiles += 1;
			} else if (H != 5)
					numberOfMisplacedTiles += 2;
				
		} else
			numberOfMisplacedTiles += 9;
		
		return numberOfMisplacedTiles;
	}
}
