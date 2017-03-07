(mapclass Plato)
(mapclass Primero)
(mapclass Segundo)
(mapclass Postre)
(mapclass Menu)

(mapclass :THING)

(defrule herenciaPrimero "A�adir herencia: Plato (primero) es un Primero"
	(object (is-a Plato) (OBJECT ?h) (orden primero))
	(object (is-a :STANDARD-CLASS) (:NAME "Primero") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Primero" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)
(defrule herenciaSegundo "A�adir herencia: Plato (segundo) es un Segundo"
	(object (is-a Plato) (OBJECT ?h) (orden segundo))
	(object (is-a :STANDARD-CLASS) (:NAME "Segundo") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Segundo" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)
(defrule herenciapostre "A�adir herencia: Plato (postre) es un Postre"
	(object (is-a Plato) (OBJECT ?h) (orden postre))
	(object (is-a :STANDARD-CLASS) (:NAME "Postre") (:DIRECT-INSTANCES $?x))
	=>
	(slot-set "Postre" :DIRECT-INSTANCES (insert$ ?x (+ 1 (length$ ?x)) ?h))
)

(defrule genera "Coge instancias de la clase Plato, genera instancias de Men� y las guarda en la ontolog�a"
	?h1 <- (object (is-a Plato)(orden primero))
	?h2 <- (object (is-a Plato)(orden segundo))
	?h3 <- (object (is-a Plato)(orden postre))
;	?h1 <- (object (is-a Primero)) ;-- No funciona, ya que como los platos se han creado como objetos de la
;	?h2 <- (object (is-a Segundo)) ;-- instancia Plato, el is-a s�lo recooce que son instancias de Plato,
;	?h3 <- (object (is-a Postre))  ;-- aunque luego le a�adas otro tipo
	=>
	(make-instance of Menu (primero ?h1) (segundo ?h2) (postre ?h3))
)


(reset)
(run)
(facts)