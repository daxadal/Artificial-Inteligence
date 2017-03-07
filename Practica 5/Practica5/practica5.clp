

(deftemplate usuario
	(slot nombre)
	(slot tamanyoGrupo (type NUMBER) )
	(slot edadMinima (type NUMBER) )
	(slot tipo (default grupo))
	(slot duracion (allowed-values corta media larga) )
	(slot tematica)
	(slot mecanica)
    (slot precio (type NUMBER))
)

;(deffacts usuariosDefecto
;	(usuario
;		(nombre pepe)
;		(tamanyoGrupo 4)
;		(edadMinima 3)
;		(duracion corta)
;		(tematica ninguna)
;       (precio 40)
;	)
;    
 ;   (usuario
;		(nombre juan)
;		(tamanyoGrupo 1)
;		(edadMinima 3)
;		(duracion media)
;		(tematica ninguna)
;		(mecanica robar-cartas)
 ;       (precio 40)
;	)
;)



;*************************************

(deftemplate juego
	(slot nombre)
	(slot tipo)
	(slot duracion (allowed-values corta media larga) )
	(slot tematica (default ninguna))
	(slot mecanica)
    (slot precio (type NUMBER))
)

(deffacts juegosDefecto
	(juego
		(nombre partyCO)
		(tipo familiar)
		(duracion corta)
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


(deftemplate sugerido
    (slot nombre)
    (slot nombreJ)
)

(deftemplate recomendado
    (slot nombre)
    (slot nombreJ)
)


;*************************************

(defmodule modUsuarios)

(defrule familiar
    ?user <- (usuario (edadMinima 3) (tamanyoGrupo ?tam))
    (test (> ?tam 3))
    (test (< ?tam 7))
    =>
    (modify ?user (tipo familiar))
)

(defrule fiesta
    ?user <- (usuario  (tamanyoGrupo ?tam))
    (test (> ?tam 6))
    =>
    (modify ?user (tipo fiesta))
)

(defrule individual
    ?user <- (usuario  (tamanyoGrupo 1))
    =>
    (modify ?user (tipo individual))
)

;*************************************

(defmodule modReglas)



(defrule sugerido ; Hace match con el tipo, la duracion y la mecánica
	(
        usuario (nombre ?name) (tipo ?tipo ) (duracion ?dur) (precio ?pmax) 
    )
	(
        juego  (nombre ?jname) (tipo ?tipo ) (duracion ?dur) (precio ?p) 
     )
    (test (> ?pmax ?p))
	=>
	(
        assert ( sugerido (nombre ?name) (nombreJ ?jname) )
    )
)

(defrule recomendadoSinTematica
	(usuario (nombre ?name) (mecanica ?mec) (tematica ninguna))   
    (juego (nombre ?jname) (mecanica ?mec) ) 
    ?r <- (sugerido (nombre ?name) (nombreJ ?jname))
    => 
    (retract ?r)
    (assert (recomendado (nombre ?name) (nombreJ ?jname) ) )
)

(defrule recomendadoConTematica
	(usuario (nombre ?name) (mecanica ?mec) (tematica ?tem))    
    (juego (nombre ?jname) (mecanica ?mec) (tematica ?tem))
    ?r <- (sugerido (nombre ?name) (nombreJ ?jname))
    => 
    (retract ?r)
    (assert (recomendado (nombre ?name) (nombreJ ?jname) ) )
)


		
		
		
