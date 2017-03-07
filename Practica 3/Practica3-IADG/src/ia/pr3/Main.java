package ia.pr3;


public class Main {

	public static void main(String[] args) {
		NotInformedSearchDemo.BFSDemo();
		NotInformedSearchDemo.DFSDemo();
		NotInformedSearchDemo.UniformCostDemo();
		
		InformedSearchDemo.AStarDemo();
		InformedSearchDemo.AStarDemo2ndHeuristic();
		InformedSearchDemo.AStarDemo2ndHeuristicTreeSearch();
		InformedSearchDemo.AStarDemoTreeSearch();
		
		InformedSearchDemo.GreedyDemo();
		InformedSearchDemo.GreedyDemo2ndHeuristic();
		InformedSearchDemo.GreedyDemo2ndHeuristicTreeSearch();
		InformedSearchDemo.GreedyDemoTreeSearch();
	}

}
