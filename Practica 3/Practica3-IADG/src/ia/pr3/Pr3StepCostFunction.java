package ia.pr3;

import aima.core.agent.Action;
import aima.core.search.framework.StepCostFunction;

public class Pr3StepCostFunction implements StepCostFunction {

	@Override
	public double c(Object arg0, Action arg1, Object arg2) {
		if (arg1 == Pr3State.jump2TilesLeft || arg1 == Pr3State.jump2TilesRight)
			return 2;
		else
			return 1;
	}

}
