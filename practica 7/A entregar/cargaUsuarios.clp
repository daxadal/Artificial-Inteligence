;Grupo 04
;Eric García de Ceca
;Ignacio Terriza

(deftemplate usuario
	(slot nombre)
	(slot tamanyoGrupo (type NUMBER) )
	(slot edadMinima (type NUMBER) )
	(slot tipo (default indefinido))
	(slot duracion (allowed-values corta media larga) )
	(slot tematica)
	(slot mecanica)
    (slot precio (type NUMBER))
)

(deffacts usuariosDefecto
	(usuario
		(nombre pepe)
		(tamanyoGrupo 4)
		(edadMinima 3)
		(duracion corta)
		(tematica ninguna)
		(mecanica cooperativo)
       (precio 40)
	)
    
   (usuario
		(nombre juan)
		(tamanyoGrupo 1)
		(edadMinima 3)
		(duracion media)
		(tematica ninguna)
		(mecanica robarCartas)
       (precio 40)
	)
	
	(usuario
		(nombre lili)
		(tamanyoGrupo 4)
		(edadMinima 3)
		(duracion larga)
		(tematica zombies)
		(mecanica cooperativo)
	    (precio 50)
	)
)

(defrule cargaUsuarios
	(usuario (nombre ?name) (tipo ?type ) (duracion ?dur) (precio ?pmax) (mecanica ?mec) (tematica ?tem) (tamanyoGrupo ?tam ) (edadMinima ?edad))
     =>
	(make-instance of Usuario (nombre ?name) (tipo ?type ) (duracion ?dur) (precio ?pmax) (mecanica ?mec) (tematica ?tem) (tamanyoGrupo ?tam ) (edadMinima ?edad))
)



