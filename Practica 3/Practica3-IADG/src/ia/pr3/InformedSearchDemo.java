package ia.pr3;

import aima.core.search.framework.GraphSearch;
import aima.core.search.framework.TreeSearch;
import aima.core.search.framework.Search;
import aima.core.search.informed.AStarSearch;
import aima.core.search.informed.GreedyBestFirstSearch;

public class InformedSearchDemo {
	
	public static void AStarDemo() {
		System.out.println("\n -- Start AStarDemo GraphSearch with Misplaced Tile Heuristic --");
		Search search = new AStarSearch(new GraphSearch(), new MisplacedTileHeuristicFunction());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End AStarDemo GraphSearch with Misplaced Tile Heuristic --\n");
	}

	public static void AStarDemoTreeSearch() {
		System.out.println("\n -- Start AStarDemo TreeSearch with Misplaced Tile Heuristic--");
		Search search = new AStarSearch(new TreeSearch(), new MisplacedTileHeuristicFunction());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End AStarDemo TreeSearch with Misplaced Tile Heuristic --\n");
	}
	
	public static void AStarDemo2ndHeuristic() {
		System.out.println("\n -- Start AStarDemo GraphSearch with Distance Heuristic--");
		Search search = new AStarSearch(new GraphSearch(), new DistanceHeuristic());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End AStarDemo GraphSearch with Distance Heuristic --\n");
	}
	
	public static void AStarDemo2ndHeuristicTreeSearch() {
		System.out.println("\n -- Start AStarDemo TreeSearch with Distance Heuristic--");
		Search search = new AStarSearch(new TreeSearch(), new DistanceHeuristic());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End AStarDemo TreeSearch with Distance Heuristic --\n");
	}
	
	public static void GreedyDemo() {
		System.out.println("\n -- Start GreedyDemo GraphSearch with Misplaced Tile Heuristic--");
		Search search = new GreedyBestFirstSearch(new GraphSearch(), new MisplacedTileHeuristicFunction());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End GreedyDemo GraphSearch with Misplaced Tile Heuristic --\n");
	}
	
	public static void GreedyDemoTreeSearch() {
		System.out.println("\n -- Start GreedyDemo TreeSearch with Misplaced Tile Heuristic --");
		Search search = new GreedyBestFirstSearch(new TreeSearch(), new MisplacedTileHeuristicFunction());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End GreedyDemo TreeSearch with Misplaced Tile Heuristic --\n");
	}

	public static void GreedyDemo2ndHeuristic() {
		System.out.println("\n -- Start GreedyDemo GraphSeatch with Distance Heuristic --");
		Search search = new GreedyBestFirstSearch(new GraphSearch(), new DistanceHeuristic());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End GreedyDemo GraphSeatch with Distance Heuristic --\n");
	}
	
	public static void GreedyDemo2ndHeuristicTreeSearch() {
		System.out.println("\n -- Start GreedyDemo TreeSearch with Distance Heuristic --");
		Search search = new GreedyBestFirstSearch(new TreeSearch(), new DistanceHeuristic());
		NotInformedSearchDemo.execute(search);
		System.out.println(" -- End GreedyDemo TreeSearch with Distance Heuristic --\n");
	}


}
