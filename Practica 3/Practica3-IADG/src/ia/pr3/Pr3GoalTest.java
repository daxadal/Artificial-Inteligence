package ia.pr3;

import aima.core.search.framework.GoalTest;

public class Pr3GoalTest implements GoalTest {

	@Override
	public boolean isGoalState(Object arg0) {
		Pr3State state = (Pr3State) arg0;
		if (state.getH() <= 4)
			return (state.getB1() <= 4 && state.getB2() <= 4 && state.getB3() <= 4);
		else
			return (state.getB1() <= 3 && state.getB2() <= 3 && state.getB3() <= 3);
	}

}
