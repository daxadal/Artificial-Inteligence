;Grupo 04
;Eric García de Ceca
;Ignacio Terriza

(deftemplate juego
	(slot nombre)
	(slot tipo)
	(slot duracion (allowed-values corta media larga) )
	(slot tematica (default ninguna))
	(slot mecanica (default cooperativo))
    (slot precio (type NUMBER))
)

(deffacts juegosDefecto
	(juego
		(nombre partyCO)
		(tipo familiar)
		(duracion corta)
		(tematica ninguna)
		(mecanica cooperativo)
	    (precio 15)
	)
    (juego
		(nombre sevenWonders)
		(tipo familiar)
		(duracion larga)
	    (tematica construccionCiudades)
		(mecanica coleccionarElementos)
	    (precio 34)
	)
    
     (juego
		(nombre catan)
		(tipo fiesta)
		(duracion larga)
	    (tematica construccionCiudades)
		(mecanica coleccionarElementos)
	    (precio 40)
	)
    
    (juego
		(nombre solitario)
		(tipo individual)
		(duracion media)
		(mecanica robarCartas)
	    (precio 5)
	)
    (juego
		(nombre ciudadelas)
		(tipo familiar)
		(duracion media)
		(mecanica coleccionarElementos)
		(tematica medieval)
	    (precio 25)
	)
    (juego
		(nombre monopoly)
		(tipo familiar)
		(duracion larga)
		(mecanica coleccionarElementos)
		(tematica economia)
	    (precio 34)
	)
    (juego
		(nombre kingofTokio)
		(tipo familiar)
		(duracion larga)
		(mecanica eliminacionJugadores)
		(tematica lucha)
	    (precio 30)
	)	
    (juego
		(nombre smashUp)
		(tipo fiesta)
		(duracion larga)
		(mecanica robarCartas)
		(tematica lucha)
	    (precio 20)
	)
    (juego
		(nombre deadofWinter)
		(tipo familiar)
		(duracion larga)
		(mecanica cooperativo)
		(tematica zombies)
	    (precio 30)
	)
   (juego
		(nombre resistencias)
		(tipo fiesta)
		(duracion corta)
		(mecanica cooperativo)
		(tematica misterio)
	    (precio 5)
	)
   (juego
		(nombre pathfinder)
		(tipo familiar)
		(duracion larga)
		(mecanica dados)
		(tematica mitologico)
	    (precio 60)
	)

    (juego
		(nombre carcassone)
		(tipo familiar)
		(duracion larga)
		(mecanica controlAreas)
		(tematica medieval)
	    (precio 30)
	)
)


(defrule cargaJuegos
	(juego  (nombre ?jname) (tipo ?type ) (duracion ?dur) (precio ?p) (mecanica ?mec) (tematica ?tem))
     =>
	(make-instance of Juego (nombre ?jname) (tipo ?type ) (duracion ?dur) (precio ?p) (mecanica ?mec) (tematica ?tem))
)



