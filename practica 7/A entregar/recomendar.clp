;Grupo 04
;Eric García de Ceca
;Ignacio Terriza

(defrule sugerido 
	(object (is-a Usuario) (OBJECT ?user) (nombre ?name) (tipo ?type ) (duracion ?dur) (precio ?pmax) (sugeridos $?sug))
	(object (is-a Juego) (OBJECT ?game) (nombre ?jname) (tipo ?type ) (duracion ?dur) (precio ?p) )
    (test (> ?pmax ?p))
	(test(not(member$ ?game ?sug)))
	=>
	(slot-insert$ ?user sugeridos 1 ?game)
)

(defrule recomendadoSinTematica
	(object (is-a Usuario) (OBJECT ?user) (nombre ?name) (mecanica ?mec) (tematica ninguna) (sugeridos $?sug) (recomendados $?rec))
    (object (is-a Juego) (OBJECT ?game) (nombre ?jname) (mecanica ?mec) )
	(test(member$ ?game ?sug))
	(test(not(member$ ?game ?rec)))
    => 
	(slot-insert$ ?user recomendados 1 ?game)
)

(defrule recomendadoSinTematica
	(object (is-a Usuario) (OBJECT ?user) (nombre ?name) (mecanica ?mec) (tematica ?tem) (sugeridos $?sug) (recomendados $?rec))
    (object (is-a Juego) (OBJECT ?game) (nombre ?jname) (mecanica ?mec) (tematica ?tem))
	(test(member$ ?game ?sug))
	(test(not(member$ ?game ?rec)))
    => 
	(slot-insert$ ?user recomendados 1 ?game)
)