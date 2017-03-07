package ia.pr3;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import aima.core.agent.Action;
import aima.core.agent.impl.DynamicAction;
import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.Problem;
import aima.core.search.framework.Search;
import aima.core.search.framework.SearchAgent;
import aima.core.search.uninformed.BreadthFirstSearch;
import aima.core.search.uninformed.DepthFirstSearch;
import aima.core.search.uninformed.UniformCostSearch;

public class NotInformedSearchDemo {

	public static void BFSDemo() {
		System.out.println("\n -- Start BFSDemo --");
		Search search = new BreadthFirstSearch();
		execute(search);
		System.out.println(" -- End BFSDemo --\n");
	}
	
	public static void DFSDemo() {
		System.out.println("\n -- Start DFSDemo --");
		Search search = new DepthFirstSearch(new GraphSearch());
		execute(search);
		System.out.println(" -- End DFSDemo --\n");
	}
	
	public static void UniformCostDemo() {
		System.out.println("\n -- Start UniformCostDemo --");
		Search search = new UniformCostSearch();
		execute(search);
		System.out.println(" -- End UniformCostDemo --\n");
	}
	
	static void execute(Search search) {
		try {
			Problem problem = new Problem (
					new Pr3State(),
					Pr3FunctionFactory.getActionsFunction(),
					Pr3FunctionFactory.getResultFunction(),
					new Pr3GoalTest(), 
					new Pr3StepCostFunction()
				);
			SearchAgent agent = new SearchAgent(problem, search);
			printActions(agent.getActions());
			System.out.println("");
			printInstrumentation(agent.getInstrumentation());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void printInstrumentation(Properties properties) {
		Iterator<?> keys = properties.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			String property = properties.getProperty(key);
			System.out.println(key + " : " + property);
		}

	}

	private static void printActions(List<Action> actions) {
		System.out.println("Actions:");
		for (int i = 0; i < actions.size(); i++) {
			String action = ((DynamicAction) actions.get(i)).getName();
			System.out.println("" + (i+1) + ") " + action);
		}
	}
	
}
