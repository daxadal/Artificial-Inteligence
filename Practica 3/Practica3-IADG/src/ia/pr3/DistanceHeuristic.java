package ia.pr3;

import aima.core.search.framework.HeuristicFunction;

public class DistanceHeuristic implements HeuristicFunction{

	@Override
	public double h(Object arg0) {
		Pr3State state = (Pr3State) arg0;
		return getDistance(state);
	}

	private int getDistance(Pr3State state) {
		int distance = 0;
		int B1 = state.getB1();
		int B2 = state.getB2();
		int B3 = state.getB3();
		int H = state.getH();
		int reajuste = Math.abs(H-4);
		if(H==0||H==7)
			reajuste = 0;
		distance = (B1-1)+(B2-2)+(B3-3)-reajuste;
		
		return distance;
	}
	
}
