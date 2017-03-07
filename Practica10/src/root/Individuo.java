package root;

/**
 * Representa un individuo de la población como cromosoma. Almacena el valor de fitness 
 * por comodidad, para ordenar la población.
 */
public class Individuo implements Comparable<Individuo> {
	
	// Número de genes para representar cada entero
	private final int PADDING = 10;
	
	// Representación binaria del círculo con centro (x,y) y radio r. Se representa como
	// la concatenación de las cadenas x + y + r donde cada una consta de 10 dígitos binarios.
	private String cromosoma;
	
	// Fitness de este individuo
	private double fitness;
	
	/**
	 * Constructor a partir del cromosoma. 
	 */
	public Individuo(String cromosoma, double fitness) {
		this.cromosoma = cromosoma;
		this.fitness = fitness;
	}
	/**
	 * Constructor a partir del círculo.
	 */
	public Individuo(Circulo c) {
		cromosoma = int2str(c.getX()) + int2str(c.getY()) + int2str(c.getRadio());
		fitness = (double) c.getRadio()/Problema.DIMENSION;
	}
	
	/**
	 * Constructor nulo
	 */
	public Individuo() {
		cromosoma = "000000000000000000000000000000";
		fitness = 0;
	}
	
	/**
	 * Devuelve el círculo representado por este cromosoma.
	 */
	public Circulo toCirculo() {
		int x = Integer.parseInt(cromosoma.substring(0, PADDING), 2);
		int y = Integer.parseInt(cromosoma.substring(PADDING, 2*PADDING), 2);
		int r = Integer.parseInt(cromosoma.substring(2*PADDING, 3*PADDING), 2);
		return new Circulo(x, y, r);
	}
	
	public double getFitness() {
		return fitness;
	}

	public void setFitness(double fitness) {
		this.fitness = fitness;
	}

	public String getCromosoma() {
		return cromosoma;
	}

	/**
	 * Devuelve la cadena que representa al número n en binario con 10 posiciones.
	 * Las posiciones de la izquierda sobrantes se ponen a cero.
	 */
	private String int2str(int n) {
		return String.format("%"+PADDING+"s", Integer.toBinaryString(n)).replace(' ', '0');
	}

	/**
	 * Comparación por fitness para ordenar la población de individuos.
	 */
	@Override
	public int compareTo(Individuo o) {
		return Double.compare(this.getFitness(), o.getFitness());
	}

	@Override
	public String toString() {
		return "Gen [cadena=" + cromosoma + ", fitness=" + this.getFitness() + "]\n";
	}
	
	///////////////////////////////////////
	
	/**
	 * Muta al individuo
	 * @param pMut Probabilidad de que cada gen mute
	 */
	public void mutate(double pMut){
		char[] cromosomaNew = new char[this.cromosoma.length()];
		double pRand;
		char c;
		for (int i=0; i<this.cromosoma.length(); i++){
			c = this.cromosoma.charAt(i);
			pRand = Math.random();
			if (pRand<pMut) {
				if(c=='0') c='1';
				else	c='0';
			}
			cromosomaNew[i] = c;
		}
		this.cromosoma = String.valueOf(cromosomaNew);
	}
	
	/**
	 * Cruza este individuo con otro
	 * @param other El otro individuo
	 * @param pCruce Probabilidad de cruce
	 * @return Si se produce cruce
	 */
	public boolean cruzar(Individuo other, double pCruce){
		double pRand = Math.random();
		if (pRand<=pCruce){
			int crosspoint = (int) (pRand*pCruce*(this.cromosoma.length()-1));
			String aux= this.cromosoma.substring(0, crosspoint) + (other.getCromosoma().substring(crosspoint));
			String aux2= other.getCromosoma().substring(0, crosspoint) + (this.cromosoma.substring(crosspoint));
			this.cromosoma = aux;
			other.setCromosoma(aux2);
			return true;
		}
		else return false;
	}
	
	public void setCromosoma(String cromosoma) {
		this.cromosoma = cromosoma;
	}
}
