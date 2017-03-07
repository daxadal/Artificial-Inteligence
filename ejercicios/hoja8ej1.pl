verbo(Infinitivo, Tiempo, Persona, Numero) -->
		[V],
		{
		atom-concat(Raiz, Terminacion, V).
		es_raiz(Raiz,Infinitivo).
		es_terminacion(Term, Tiempo, Persona, Numero).
		}





%es_raiz(Raiz,Infinitivo)
es_raiz(habl, hablar).
es_raiz(pint, pintar).

%es_terminacion(Term, Tiempo, Persona, Numero)
es_terminacion(o, presente,1,singular).
es_terminacion(as, presente,2,singular).
es_terminacion(a, presente,3,singular).
es_terminacion(amos, presente,1,plural).
es_terminacion(ais, presente,2,plural).
es_terminacion(an, presente,3,plural).

%consulta: verbo(Infinitivo, Tiempo, Persona, Numero, [hablas],[])