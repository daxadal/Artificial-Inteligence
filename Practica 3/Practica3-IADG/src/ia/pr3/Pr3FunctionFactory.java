package ia.pr3;

import java.util.LinkedHashSet;
import java.util.Set;

import aima.core.agent.Action;
import aima.core.search.framework.ActionsFunction;
import aima.core.search.framework.ResultFunction;

public class Pr3FunctionFactory {

	public static ActionsFunction getActionsFunction() {
		if (actF == null)
			actF = new Pr3ActionsFunction();
		return actF;
	}

	public static ResultFunction getResultFunction() {
		if (resF == null)
			resF = new Pr3ResultFunction();
		return resF;
	}
	
	private static class Pr3ActionsFunction implements ActionsFunction {

		@Override
		public Set<Action> actions(Object arg0) {
			Pr3State state = (Pr3State) arg0;
			Set<Action> actions = new LinkedHashSet<Action>();
			
			if(state.validMove(Pr3State.moveTileLeft)) 
				actions.add(Pr3State.moveTileLeft);
			if(state.validMove(Pr3State.moveTileRight)) 
				actions.add(Pr3State.moveTileRight);
			if(state.validMove(Pr3State.jump1TileLeft)) 
				actions.add(Pr3State.jump1TileLeft);
			if(state.validMove(Pr3State.jump1TileRight)) 
				actions.add(Pr3State.jump1TileRight);
			if(state.validMove(Pr3State.jump2TilesLeft)) 
				actions.add(Pr3State.jump2TilesLeft);
			if(state.validMove(Pr3State.jump2TilesRight)) 
				actions.add(Pr3State.jump2TilesRight);
			
			return actions;
		}

	}
	
	private static class Pr3ResultFunction implements ResultFunction {

		@Override
		public Object result(Object arg0, Action arg1) {
			Pr3State state = (Pr3State) arg0;
			Pr3State newState = new Pr3State(state);
			
			if (arg1.equals(Pr3State.moveTileLeft)) 
				newState.switchGap(+1);
			if (arg1.equals(Pr3State.moveTileRight)) 
				newState.switchGap(-1);
			if (arg1.equals(Pr3State.jump1TileLeft)) 
				newState.switchGap(+2);
			if (arg1.equals(Pr3State.jump1TileRight)) 
				newState.switchGap(-2);
			if (arg1.equals(Pr3State.jump2TilesLeft)) 
				newState.switchGap(+3);
			if (arg1.equals(Pr3State.jump2TilesRight)) 
				newState.switchGap(-3);
			
			return newState;
		}

	}
	
	private static ActionsFunction actF = null;
	private static ResultFunction resF = null;
}
