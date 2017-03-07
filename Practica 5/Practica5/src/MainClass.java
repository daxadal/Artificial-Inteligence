import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Scanner;

import jess.Deffacts;
import jess.Fact;
import jess.JessException;
import jess.RU;
import jess.Rete;
import jess.Value;

public class MainClass {

	public static void printArray(String[] array) {
		for (int i=0; i<array.length; i++) {
			System.out.print("" + i + " - " + array[i] + "\t\t");
			if (i%5==4) 
				System.out.println();
		}
	}
	
	public static void printResults(String nombre, Rete rete) {
		
		LinkedList<String> recomendaciones = new LinkedList<String>();
		LinkedList<String> sugerencias = new LinkedList<String>();
		try {
			
			Iterator<Fact> it = rete.listFacts();
			Fact fact;
			while(it.hasNext()) {
				fact = it.next();
				if(fact.getName().equalsIgnoreCase("MAIN::recomendado")) {
					recomendaciones.add(fact.getSlotValue("nombreJ").toString());
				}
				else if(fact.getName().equalsIgnoreCase("MAIN::sugerido")) {
					sugerencias.add(fact.getSlotValue("nombreJ").toString());
				}
			}
		} catch (JessException e) {
			System.out.println("Error la mostrar los resultados");
			e.printStackTrace();
		}
		
		
		
		if (recomendaciones.size() == 0) {
			System.out.println(nombre + ", no hemos encontrado recomendaciones.");
		}
		else {
			System.out.println(nombre + ", te recomendamos:");
			Iterator<String> iter = recomendaciones.iterator();
			while (iter.hasNext())
				System.out.println(" - "+ iter.next());
		}
		
		if (sugerencias.size() == 0) {
			System.out.println(nombre + ", no hemos encontrado sugerencias.");
		}
		else {
			System.out.println(nombre + ", también te sugerimos:");
			Iterator<String> iter2 = sugerencias.iterator();
			while (iter2.hasNext())
				System.out.println(" - "+ iter2.next());
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Rete rete = new Rete();
		
		String ficheroReglas = "practica5.clp";	
		System.out.println("Cargando las reglas");
		try {
			rete.batch(ficheroReglas);
		} catch (JessException je0) {
			System.out.println("Error de lectura en " + ficheroReglas);
			je0.printStackTrace();
			return;
		}
		
		String nombre, duracion, tematica, mecanica;
		int edad, tamanyogrupo, precio;
		String salir;
		Scanner cin = new Scanner(System.in);
		
		do {
			System.out.print("Introduce tu nombre: ");
			nombre = cin.nextLine();
			
			System.out.print("Introduce el tamaño del grupo: ");
			tamanyogrupo = cin.nextInt();
			
			System.out.print("Introduce la edad mínima del grupo: ");
			edad = cin.nextInt();
			duracion = cin.nextLine();
			
			System.out.println("Introduce la duracion de la partida.");
			System.out.print("corta (<30min), media (30-60min), larga (+60 min): ");
			duracion = cin.nextLine();
			while (!duracion.equalsIgnoreCase("corta") 
					&& !duracion.equalsIgnoreCase("media")
					&& !duracion.equalsIgnoreCase("larga")) 
			{
				System.out.print("Introduce una respuesta válida: ");
				duracion = cin.nextLine();
			}
			
			System.out.print("Introduce el precio máximo del juego: ");
			precio = cin.nextInt();
			
			System.out.println("Introduce la mecánica del juego: ");
			printArray(mecanicas);
			System.out.println();
			System.out.print("> ");
			int num = cin.nextInt();
			while (0>num || num>=mecanicas.length) 
			{
				System.out.print("Introduce una respuesta válida (0-" + mecanicas.length +"): ");
				num = cin.nextInt();
			}
			mecanica = mecanicas[num];
			
			System.out.println("Introduce la temática del juego: ");
			printArray(tematicas);
			System.out.println();
			System.out.print("> ");
			num = cin.nextInt();
			while (0>num || num>=tematicas.length) 
			{
				System.out.print("Introduce una respuesta válida (0-" + tematicas.length +"): ");
				num = cin.nextInt();
			}
			tematica = tematicas[num];
			
			
			try {
				Deffacts deffacts = new Deffacts("DatosJava", null, rete);
				Fact f = new Fact("usuario", rete);
				f.setSlotValue("nombre", new Value(nombre, RU.SYMBOL));
				f.setSlotValue("tamanyoGrupo", new Value(tamanyogrupo, RU.INTEGER));
				f.setSlotValue("edadMinima", new Value(edad, RU.INTEGER));
				f.setSlotValue("duracion", new Value(duracion, RU.SYMBOL));
				f.setSlotValue("precio", new Value(precio, RU.INTEGER));
				f.setSlotValue("tematica", new Value(tematica, RU.SYMBOL));
				f.setSlotValue("mecanica", new Value(mecanica, RU.SYMBOL));
				deffacts.addFact(f);
				rete.addDeffacts(deffacts);
			} catch (JessException e) {
				System.out.println("Error en la carga de reglas");
				e.printStackTrace();
			}
			
			
			try {
				rete.reset();
				rete.setFocus("modUsuarios");
				rete.run();
				rete.setFocus("modReglas");
				rete.run();
			} catch (JessException e) {
				System.out.println("Error en la ejecución");
				e.printStackTrace();
			}
				
			printResults(nombre, rete);
			
			System.out.print("Deseas recibir otra recomendacion (S/N): ");
			salir = cin.nextLine(); //Elimina el resto de linea que quede y el salto de carro
			salir = cin.nextLine();
			while ( !salir.equalsIgnoreCase("S") && !salir.equalsIgnoreCase("N") ) 
			{
				System.out.print("Introduce una respuesta válida: ");
				duracion = cin.nextLine();
			
			}
			
			
			try {
				rete.clear();
				rete.batch(ficheroReglas);
			} catch (JessException je0) {
				System.out.println("Error de lectura en " + ficheroReglas);
				je0.printStackTrace();
			}
			
		} while (!salir.equalsIgnoreCase("N"));
		
		System.out.println("Gracias por usar nuestro sistema de recomendacion de juegos. Adios!");
		cin.close();
	}

	private static final String[] tematicas= {"ninguna", "aventura", "epico", "animales", "lucha", "contruccionCiudades",
			"civilizacion", "economia", "recoleccion", "horror", "industria", "misterio", "medieval", 
			"mitologico", "nautico", "piratas", "prehistorico", "carreras", "renacimiento",
			"cienciaFiccion", "agentesSecretos", "trenes", "transporte", "viajes", "guerra", 
			"zombies"};
	
	private static final String[] mecanicas = {"subasta", "controlAreas", "robarCartas", "cooperativo", "dados",
			"eliminacionJugadores",  "coleccionarElementos", "completarPuzzles", "cambiarCartas"};
	
}
