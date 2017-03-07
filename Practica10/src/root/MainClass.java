package root;

import java.io.FileNotFoundException;

public class MainClass {

	public static void main(String[] args) {
		Problema problem;
		try {
			problem = new Problema("problemaC1.txt");
		} catch (FileNotFoundException e){
			System.err.println("Archivo no encontrado");
			e.printStackTrace();
			return;
		}
		problem.print();
		
		Solver solver = new Solver(problem);
		solver.solveRandom(100);
		System.out.println("Solucion aleatoria: (" + solver.getXbest() + "," + solver.getYbest()
				+ "," + solver.getRbest() + ")");

		Solver solverB = new Solver(problem);
		solverB.solveBrute();
		System.out.println("Solucion fuerza bruta: (" + solverB.getXbest() + "," + solverB.getYbest()
				+ "," + solverB.getRbest() + ")");
		
		Solver solverG = new Solver(problem);
		solverG.solveGenetic(200, 100, 5, 0.7, 0.1);
		System.out.println("Solucion algoritmo genetico: (" + solverG.getXbest() + "," + solverG.getYbest()
		+ "," + solverG.getRbest() + ")");

	}
}
