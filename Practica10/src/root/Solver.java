package root;



public class Solver {

	public Solver(Problema problem) {
		xbest = 0;
		ybest=0;
		rbest=0;
		this.problem=problem;
		this.dim= Problema.DIMENSION;
		
	}

	/**
	 * Resuelve el problema por fuerza bruta.
	 * Obtiene siempre la mejor solucion
	 */
	public void solveBrute(){
		int radio;
		for(int x=1; x<dim;x++)
			for(int y=1; y<dim; y++) {
				radio = 1;
				while (problem.esSolucion(new Circulo(x,y,radio)))
					radio++;
				radio--;
				if(radio>rbest){
					xbest=x;
					ybest=y;
					rbest=radio;
				}
			}
	}
	
	/**
	 * Resuelve el problema por algoritmos genéticos
	 * @param generaciones Número de generaciones que se crearán
	 * @param tamPoblacion tamaño de las poblaciones
	 * @param tamElite Tamáño de la elite
	 * @param pCruce Probabilidad de que dos individuos se crucen
	 * @param pMut Probabilidad de que cada gen de un cromosoma mute
	 */
	public void solveGenetic(int generaciones, int tamPoblacion, int tamElite, double pCruce, double pMut){
		Heap<Individuo> poblacion = new Heap<Individuo>(tamPoblacion);
		
		//Creamos una población aleatoria inicial
		int i=0;
		while(i<tamPoblacion) {
			Circulo nuevo = Circulo.random(dim);
			if(problem.esSolucion(nuevo)) {
				poblacion.insert(new Individuo(nuevo));
				i++;
			}
		}
		
		//Creamos nuevas generaciones
		Heap<Individuo> poblacionNew = new Heap<Individuo>(tamPoblacion);
		for(int k=0; k<generaciones; k++){
			
			//Mover la elite a la nueva geneeracion
			for (int j=0; j<tamElite; j++) {
				poblacionNew.insert(poblacion.deleteMax());
			}
			
			//generar nuevos individuos por cruce y mutacion
			int j=0; 
			int incr = 0;
			while (j<tamPoblacion-tamElite) { 
				incr = this.generardescendiente(poblacion, poblacionNew, pCruce, pMut);
				j +=incr;
			}
			
			//pasamos a la siguiente generación
			poblacion = poblacionNew;
			poblacionNew = new Heap<Individuo>(tamPoblacion);
		}
		
		//Obtenemos el mejor individuo de la población
		Circulo optimo = poblacion.deleteMax().toCirculo();
		xbest = optimo.getX();
		ybest = optimo.getY();
		rbest = optimo.getRadio();
		
	}
	
	
	/**
	* Recibe un array de individuos y devuelve el indice de uno
	* de ellos, tomando (fitness[i]/fitnessTotal) como la probabilidad 
	* de ser cogido
	*/
	private int roulette(Heap<Individuo> poblacion) {
		double totalFitness = 0;
		for(int i=1; i<=poblacion.length(); i++)
			totalFitness += poblacion.getAt(i).getFitness();
		double pickFitness = Math.random()*totalFitness;
		int i=1;
		while(pickFitness > poblacion.getAt(i).getFitness()) {
			pickFitness = pickFitness - poblacion.getAt(i).getFitness();
			i++;
		}
		return i;
}

	/**
	 * A partir de una poblacion inicial, escoge dos individuos distintos, los intenta
	 * cruzar y despues muta a los hijos (si hay cruce) o a los padres (si no hay cruce).
	 * A los dos individuos nuevos resultantes los añade a la nueva generacion si
	 * son solucion del problema. Si no, se descartan.
	 * @param poblacion Población inicial
	 * @param poblacionNew Siguiente generacion
	 * @param pCruce Probabilidad de que dos individuos se crucen
	 * @param pMut Probabilidad de que cada gen de un cromosoma mute
	 * @return Número de individuos añadidos a la siguiente generacion
	 */
	private int generardescendiente(Heap<Individuo> poblacion, Heap<Individuo> poblacionNew,double pCruce, double pMut) {
		int incr = 0;
		
		//Selecciona y clona a los individuos
		Individuo oldi = poblacion.getAt(this.roulette(poblacion));
		Individuo oldj = poblacion.getAt(this.roulette(poblacion));
		while (oldi==oldj){
			oldj = poblacion.getAt(this.roulette(poblacion));
		}
		Individuo i = new Individuo(oldi.getCromosoma(), oldi.getFitness());
		Individuo j = new Individuo(oldj.getCromosoma(), oldj.getFitness());
		
		//Cruza y muta a los individuos (según probabilidad)
		i.cruzar(j, pCruce);
		i.mutate(pMut);
		j.mutate(pMut);
		
		//los añade a la nueva poblacion (si son solucion)
		Circulo ci = i.toCirculo();
		Circulo cj = j.toCirculo();
		if(problem.esSolucion(ci)) {
			poblacionNew.insert(new Individuo(ci));
			incr++;
		}
		if(problem.esSolucion(cj)) {
			poblacionNew.insert(new Individuo(cj));
			incr++;
		}
		return incr;

	}

	/**
	 * Crea N individuos aleatorios y, entre los que sean solución, 
	 * elige al mejor. No garantiza que se encuentre solución
	 * @param N Número de individuos a generar
	 */
	public void solveRandom(int N) {
		Circulo c;
		for (int i=0; i<N;i++) {
			c = Circulo.random(dim);
			if (problem.esSolucion(c) && c.getRadio()>rbest) {
				xbest=c.getX();
				ybest=c.getY();
				rbest=c.getRadio();
			}
		}
	}

	public int getXbest() {
		return xbest;
	}

	public int getYbest() {
		return ybest;
	}

	public int getRbest() {
		return rbest;
	}

	private int xbest;
	private int ybest;
	private int rbest;
	private Problema problem;
	private int dim;

}
