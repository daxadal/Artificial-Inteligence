;Grupo 04
;Eric García de Ceca
;Ignacio Terriza

(defrule familiar
    (object (is-a Usuario) (OBJECT ?user) (edadMinima 3) (tamanyoGrupo ?tam) (tipo indefinido))
    (test (> ?tam 3))
    (test (< ?tam 7))
    =>
	;(printout t "familiar")
    (modify-instance ?user (tipo familiar))
)

(defrule fiesta
    (object (is-a Usuario) (OBJECT ?user)  (tamanyoGrupo ?tam) (tipo indefinido))
    (test (> ?tam 6))
    =>
	;(printout t "fiesta")
    (modify-instance ?user (tipo fiesta))
)

(defrule individual
    (object (is-a Usuario) (OBJECT ?user)  (tamanyoGrupo 1) (tipo indefinido))
    =>
	;(printout t "individual")
    (modify-instance ?user (tipo individual))
)

(defrule grupo
	(declare (salience -1))
    (object (is-a Usuario) (OBJECT ?user) (tipo indefinido))
	;(printout t "grupo")
    =>
    (modify-instance ?user (tipo grupo))
)