;Grupo 04
;Eric García de Ceca
;Ignacio Terriza

(mapclass Juego)
(mapclass Usuario)
(batch "C:/hlocal/Practica7-8/cargaJuegos.clp")
(batch "C:/hlocal/Practica7-8/cargaUsuarios.clp")
(reset)
(run)

(clear)

(mapclass Usuario)
(batch "C:/hlocal/Practica7-8/procesarUsuario.clp")
(reset)
(run)

(clear)

(mapclass Juego)
(mapclass Usuario)
(batch "C:/hlocal/Practica7-8/recomendar.clp")
(reset)
(run)