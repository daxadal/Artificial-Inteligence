
/*
Grupo 04. Integrantes:
- Ignacio Terriza
- Eric García de Ceca
*/

dd(juan, maria, luis, h).
dd(juan, maria, rosa, m).
dd(jose, laura, pilar, m).
dd(luis, pilar, miguel, h).
dd(miguel,isabel,jaime,h).
dd(pedro, rosa, pablo, h).
dd(pedro, rosa, begoña, m).

padre(X, Y):- dd(X, _, Y, _).
madre(X, Y):- dd(_, X, Y, _).
ascendienteDir(X, Y):- padre(X, Y);
					madre(X, Y).
ascendienteRec(X, Y):- ascendienteDir(X, Z), ascendienteRec(Z, Y);
						ascendienteDir(X, Z), ascendienteDir(Z, Y).
ascendiente(X, Y):- ascendienteDir(X, Y); ascendienteRec(X, Y).
					
diferente(A,B):- A\=B.
hijoPorPadre(X, Y):- dd(Y, _, X, h).
hijoPorMadre(X, Y):- dd(_, Y, X, h).
hijo(X, Y):- hijoPorPadre(X, Y);
				hijoPorMadre(X, Y).
hijaPorPadre(X, Y):- dd(Y, _, X, m).
hijaPorMadre(X, Y):- dd(_, Y, X, m).
hija(X, Y):- hijaPorPadre(X, Y);
				hijaPorMadre(X, Y).
hermano(X, Y):- dd(X1, X2, Y, _),
				dd(X1, X2, X, h),
				diferente(X, Y).
hermana(X, Y):- dd(X1, X2, Y, _),
				dd(X1, X2, X, m),
				diferente(X, Y).
abueloPorPadre(X, Y):- padre(X, Z),
						padre(Z, Y).
abueloPorMadre(X, Y):- padre(X, Z),
						madre(Z, Y).
abuelo(X, Y):- abueloPorPadre(X, Y);
				abueloPorMadre(X, Y).
abuelaPorPadre(X, Y):- madre(X, Z),
						padre(Z, Y).
abuelaPorMadre(X, Y):- madre(X, Z),
						madre(Z, Y).
abuela(X, Y):- abuelaPorPadre(X, Y);
				abuelaPorMadre(X, Y).
primoHermanoPadre(X, Y):- padre(X1, Y),
							hermano(X2, X1),
							hijo(X, X2).
primoHermanoMadre(X, Y):- madre(X1, Y),
							hermano(X2, X1),
							hijo(X, X2).
primoHermanaPadre(X, Y):- padre(X1, Y),
							hermana(X2, X1),
							hijo(X, X2).
primoHermanaMadre(X, Y):- madre(X1, Y),
							hermana(X2, X1),
							hijo(X, X2).	
primo(X, Y):- primoHermanoPadre(X, Y);
				primoHermanoMadre(X, Y);
				primoHermanaPadre(X, Y);
				primoHermanaMadre(X, Y).
primaHermanoPadre(X, Y):- padre(X1, Y),
							hermano(X2, X1),
							hija(X, X2).
primaHermanoMadre(X, Y):- madre(X1, Y),
							hermano(X2, X1),
							hija(X, X2).
primaHermanaPadre(X, Y):- padre(X1, Y),
							hermana(X2, X1),
							hija(X, X2).
primaHermanaMadre(X, Y):- madre(X1, Y),
							hermana(X2, X1),
							hija(X, X2).
prima(X, Y):- primaHermanoPadre(X, Y);
				primaHermanoMadre(X, Y);
				primaHermanaPadre(X, Y);
				primaHermanaMadre(X, Y).

