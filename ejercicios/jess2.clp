(mapclass Plato)
(mapclass Primero)
(mapclass Segundo)
(mapclass Postre)
(mapclass Menu)

(mapclass :THING)

(defrule herenciaPrimero "Añadir herencia: Plato (primero) es un Primero"
	(object (is-a Plato) (OBJECT ?h) (orden primero))
	(object (is-a :STANDARD-CLASS) (:NAME "Primero") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Primero" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)
(defrule herenciaSegundo "Añadir herencia: Plato (segundo) es un Segundo"
	(object (is-a Plato) (OBJECT ?h) (orden segundo))
	(object (is-a :STANDARD-CLASS) (:NAME "Segundo") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Segundo" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)
(defrule herenciapostre "Añadir herencia: Plato (postre) es un Postre"
	(object (is-a Plato) (OBJECT ?h) (orden postre))
	(object (is-a :STANDARD-CLASS) (:NAME "Postre") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Postre" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)

(defrule genera "Coge instancias de la clase Plato, genera instancias de Menú y las guarda en la ontología"
	?h1 <- (object (is-a Plato)(orden primero))
	?h2 <- (object (is-a Plato)(orden segundo))
	?h3 <- (object (is-a Plato)(orden postre))
;	?h1 <- (object (is-a Primero)) ;-- No funciona, ya que como los platos se han creado como objetos de la
;	?h2 <- (object (is-a Segundo)) ;-- instancia Plato, el is-a sólo recooce que son instancias de Plato,
;	?h3 <- (object (is-a Postre))  ;-- aunque luego le añadas otro tipo
	=>
	(make-instance of Menu (primero ?h1) (segundo ?h2) (postre ?h3))
)


(reset)
(run)
(facts)