% Ejercicio 4 hoja 8
% Eric Garcia - Ignacio Terriza 

frase(Arbol, Voz, Tmp)--> sn(SN,F,Voz),sv(SN,F,Tmp,Arbol,Voz).

sn(sn(DET,N),forma(Numero,3,Genero),_)--> det(DET,Genero,Numero),n(N,Genero,Numero).
sn(sn(N),forma(plural,3,_),_)--> n(N,_,plural).
sn(sn(PN),forma(Numero,Persona,Genero),Voz)--> pron(PN,Genero,Numero,Persona,Voz).
sn(sn(NP),forma(singular,3,Genero),_)--> np(NP,Genero).

sv(SNp,F,Tmp,frase(SNp,sv(V,SN)),activa)--> verbo(V,F,Tmp,_),sn(SN,_,activa).
sv(SNp,F,Tmp,frase(SNp,sv(V,SN,CC)),activa)--> verbo(V,F,Tmp,_),sn(SN,_,activa),cc(CC,Prep),
	{acepta_prep(V,Prep)}.
sv(SNp,F,Tmp,frase(SNp,sv(V)),activa)--> verbo(V,F,Tmp,_).
sv(SNp,F,Tmp,frase(SNp,sv(V,CC)),activa)--> verbo(V,F,Tmp,_),cc(CC,Prep),
	{acepta_prep(V,Prep)}.

sv(SNp,F,Tmp,frase(SN,sv(V,SNp)),pasiva)--> forma_verbal(V,F,Tmp),cagente(SN).
sv(SNp,F,Tmp,frase(SN,sv(V,SNp,CC)),pasiva)--> forma_verbal(V,F,Tmp),cagente(SN),cc(CC,_).

forma_verbal(V,F,Tmp)--> vser(F,Tmp),verbo(V,F,participio,_). 

acepta_prep(verbo(dibujar),en).
acepta_prep(verbo(leer),en).
acepta_prep(verbo(hablar),con).

cagente(SN)--> [por],sn(SN,_,pasiva). 

cc(cc(PREP,SN),Prep)--> prep(PREP,Prep),sn(SN,_,_).

det(det(X),f,singular)--> [X], {member(X,[la,una])}.
det(det(X),f,plural)--> [X], {member(X,[las,unas])}.
det(det(X),m,singular)--> [X], {member(X,[el,un])}.
det(det(X),m,plural)--> [X], {member(X,[los,unos])}.

pron(pron(yo),_,singular,1,activa)--> [yo].
pron(pron(yo),_,singular,1,pasiva)--> [mí].
pron(pron(tu),_,singular,2,activa)--> [tu].
pron(pron(ti),_,singular,2,pasiva)--> [tí].
pron(pron(él),_,singular,3,_)--> [él].
pron(pron(élla),_,singular,3,_)--> [ella].
pron(pron(nosotros),m,plural,1,_)--> [nosotros].
pron(pron(nosotras),f,plural,1,_)--> [nosotras].
pron(pron(vosotros),m,plural,2,_)--> [vosotros].
pron(pron(vosotras),f,plural,2,_)--> [vosotras].
pron(pron(ellos),m,plural,3,_)--> [ellos].
pron(pron(ellas),f,plural,3,_)--> [ellas].

np(np(david),m)--> [david].
np(np(ana),f)--> [ana].
np(np(julia),f)--> [julia].
np(np(elvira),f)--> [elvira].
np(np(pedro),m)--> [pedro].

prep(prep(con),con)--> [con].
prep(prep(en),en)--> [en].

n(n(X),f,singular)--> [X], {member(X,[piscina,flor,decisión])}.
n(n(X),f,plural)--> [X], {member(X,[decisiones,flores,piscinas])}.
n(n(X),m,singular)--> [X], {member(X,[libro,jardin,niño,cuaderno])}.
n(n(X),m,plural)--> [X], {member(X,[cuadernos,jardines,libros,niños])}.

es_lexema(habl,verbo(hablar),ar).
es_lexema(pint,verbo(pintar),ar).
es_lexema(cant,verbo(cantar),ar).
es_lexema(dibuj,verbo(dibujar),ar).
es_lexema(tom,verbo(tomar),ar).
es_lexema(com,verbo(comer),er).
es_lexema(romp,verbo(romper),er).
es_lexema(beb,verbo(beber),er).
es_lexema(le,verbo(leer),er).
es_lexema(sufr,verbo(sufrir),ir).
es_lexema(viv,verbo(vivir),ir).
es_lexema(sub,verbo(subir),ir).

% presente Simple
es_morfema(ar,forma(singular,1,_),presente,o).
es_morfema(ar,forma(singular,2,_),presente,as).
es_morfema(ar,forma(singular,3,_),presente,a).
es_morfema(ar,forma(plural,1,_),presente,amos).
es_morfema(ar,forma(plural,2,_),presente,ais).
es_morfema(ar,forma(plural,3,_),presente,an).

es_morfema(er,forma(singular,1,_),presente,o).
es_morfema(er,forma(singular,2,_),presente,es).
es_morfema(er,forma(singular,3,_),presente,e).
es_morfema(er,forma(plural,1,_),presente,emos).
es_morfema(er,forma(plural,2,_),presente,eis).
es_morfema(er,forma(plural,3,_),presente,en).

es_morfema(ir,forma(singular,1,_),presente,o).
es_morfema(ir,forma(singular,2,_),presente,es).
es_morfema(ir,forma(singular,3,_),presente,e).
es_morfema(ir,forma(plural,1,_),presente,imos).
es_morfema(ir,forma(plural,2,_),presente,ís).
es_morfema(ir,forma(plural,3,_),presente,en).

% pretérito imperfecto simple
es_morfema(ar,forma(singular,1,_),pasado,aba).
es_morfema(ar,forma(singular,2,_),pasado,abas).
es_morfema(ar,forma(singular,3,_),pasado,aba).
es_morfema(ar,forma(plural,1,_),pasado,abamos).
es_morfema(ar,forma(plural,2,_),pasado,abais).
es_morfema(ar,forma(plural,3,_),pasado,aban).

es_morfema(er,forma(singular,1,_),pasado,ía).
es_morfema(er,forma(singular,2,_),pasado,ías).
es_morfema(er,forma(singular,3,_),pasado,ía).
es_morfema(er,forma(plural,1,_),pasado,íamos).
es_morfema(er,forma(plural,2,_),pasado,íais).
es_morfema(er,forma(plural,3,_),pasado,ían).

es_morfema(ir,forma(singular,1,_),pasado,ía).
es_morfema(ir,forma(singular,2,_),pasado,ías).
es_morfema(ir,forma(singular,3,_),pasado,ía).
es_morfema(ir,forma(plural,1,_),pasado,íamos).
es_morfema(ir,forma(plural,2,_),pasado,íais).
es_morfema(ir,forma(plural,3,_),pasado,ían).

% pretérito perfecto simple
es_morfema(ar,forma(singular,1,_),preterito,é).
es_morfema(ar,forma(singular,2,_),preterito,aste).
es_morfema(ar,forma(singular,3,_),preterito,ó).
es_morfema(ar,forma(plural,1,_),preterito,amos).
es_morfema(ar,forma(plural,2,_),preterito,asteis).
es_morfema(ar,forma(plural,3,_),preterito,aron).

es_morfema(er,forma(singular,1,_),preterito,í).
es_morfema(er,forma(singular,2,_),preterito,iste).
es_morfema(er,forma(singular,3,_),preterito,ió).
es_morfema(er,forma(plural,1,_),preterito,imos).
es_morfema(er,forma(plural,2,_),preterito,isteis).
es_morfema(er,forma(plural,3,_),preterito,eron).

es_morfema(ir,forma(singular,1,_),preterito,í).
es_morfema(ir,forma(singular,2,_),preterito,iste).
es_morfema(ir,forma(singular,3,_),preterito,ió).
es_morfema(ir,forma(plural,1,_),preterito,imos).
es_morfema(ir,forma(plural,2,_),preterito,isteis).
es_morfema(ir,forma(plural,3,_),preterito,eron).

% futuro
es_morfema(ar,forma(singular,1,_),futuro,aré).
es_morfema(ar,forma(singular,2,_),futuro,arás).
es_morfema(ar,forma(singular,3,_),futuro,ará).
es_morfema(ar,forma(plural,1,_),futuro,aremos).
es_morfema(ar,forma(plural,2,_),futuro,areis).
es_morfema(ar,forma(plural,3,_),futuro,arán).

es_morfema(er,forma(singular,1,_),futuro,eré).
es_morfema(er,forma(singular,2,_),futuro,erás).
es_morfema(er,forma(singular,3,_),futuro,erá).
es_morfema(er,forma(plural,1,_),futuro,eremos).
es_morfema(er,forma(plural,2,_),futuro,ereis).
es_morfema(er,forma(plural,3,_),futuro,erán).

es_morfema(ir,forma(singular,1,_),futuro,iré).
es_morfema(ir,forma(singular,2,_),futuro,irás).
es_morfema(ir,forma(singular,3,_),futuro,irá).
es_morfema(ir,forma(plural,1,_),futuro,iremos).
es_morfema(ir,forma(plural,2,_),futuro,ireis).
es_morfema(ir,forma(plural,3,_),futuro,irán).

% condicional
es_morfema(ar,forma(singular,1,_),condicional,aría).
es_morfema(ar,forma(singular,2,_),condicional,arías).
es_morfema(ar,forma(singular,3,_),condicional,aría).
es_morfema(ar,forma(plural,1,_),condicional,aríamos).
es_morfema(ar,forma(plural,2,_),condicional,aríais).
es_morfema(ar,forma(plural,3,_),condicional,arían).

es_morfema(er,forma(singular,1,_),condicional,ería).
es_morfema(er,forma(singular,2,_),condicional,erías).
es_morfema(er,forma(singular,3,_),condicional,ería).
es_morfema(er,forma(plural,1,_),condicional,eríamos).
es_morfema(er,forma(plural,2,_),condicional,eríais).
es_morfema(er,forma(plural,3,_),condicional,erían).

es_morfema(ir,forma(singular,1,_),condicional,iría).
es_morfema(ir,forma(singular,2,_),condicional,irías).
es_morfema(ir,forma(singular,3,_),condicional,iría).
es_morfema(ir,forma(plural,1,_),condicional,iríamos).
es_morfema(ir,forma(plural,2,_),condicional,iríais).
es_morfema(ir,forma(plural,3,_),condicional,irían).

% Formas no personales

es_morfema(ar,forma(singular,_,m),participio,ado).
es_morfema(ar,forma(singular,_,f),participio,ada).
es_morfema(ar,forma(plural,_,m),participio,ados).
es_morfema(ar,forma(plural,_,f),participio,adas).

es_morfema(er,forma(singular,_,m),participio,ido).
es_morfema(er,forma(singular,_,f),participio,ida).
es_morfema(er,forma(plural,_,m),participio,idos).
es_morfema(er,forma(plural,_,f),participio,idas).

es_morfema(ir,forma(singular,_,m),participio,ido).
es_morfema(ir,forma(singular,_,f),participio,ida).
es_morfema(ir,forma(plural,_,m),participio,idos).
es_morfema(ir,forma(plural,_,f),participio,idas).

vser(forma(singular,1,_),presente)--> [soy].
vser(forma(singular,2,_),presente)--> [eres].
vser(forma(singular,3,_),presente)--> [es].
vser(forma(plural,1,_),presente)--> [somos].
vser(forma(plural,2,_),presente)--> [sois].
vser(forma(plural,3,_),presente)--> [son].

vser(forma(singular,1),pasado)--> [era].
vser(forma(singular,2,_),pasado)--> [eras].
vser(forma(singular,3,_),pasado)--> [era].
vser(forma(plural,1,_),pasado)--> [eramos].
vser(forma(plural,2,_),pasado)--> [erais].
vser(forma(plural,3,_),pasado)--> [eran].

vser(forma(singular,1,_),preterito)--> [fui].
vser(forma(singular,2,_),preterito)--> [fuiste].
vser(forma(singular,3,_),preterito)--> [fue].
vser(forma(plural,1,_),preterito)--> [fuimos].
vser(forma(plural,2,_),preterito)--> [fuisteis].
vser(forma(plural,3,_),preterito)--> [fueron].

vser(forma(singular,1,_),futuro)--> [seré].
vser(forma(singular,2,_),futuro)--> [serás].
vser(forma(singular,3,_),futuro)--> [será].
vser(forma(plural,1,_),futuro)--> [seremos].
vser(forma(plural,2,_),futuro)--> [seréis].
vser(forma(plural,3,_),futuro)--> [serán].

vser(forma(singular,1,_),condicional)--> [sería].
vser(forma(singular,2,_),condicional)--> [serías].
vser(forma(singular,3,_),condicional)--> [sería].
vser(forma(plural,1,_),condicional)--> [seríamos].
vser(forma(plural,2,_),condicional)--> [seríais].
vser(forma(plural,3,_),condicional)--> [serían].

/*:- ['read_line'].*/
read_line(Words) :- get0(C),
                    read_rest(C,Words).
		              
/* A period or question mark ends the input. */
read_rest(46,['.']) :- !.
read_rest(63,['?']) :- !.

/* Spaces and newlines between words are ignored. */
read_rest(C,Words) :- ( C=32 ; C=10 ) , !,
                     get0(C1),
                     read_rest(C1,Words).

/* Commas between words are absorbed. */
read_rest(44,[','|Words]) :- !,
                             get0(C1),
                             read_rest(C1,Words).

/* Otherwise get all of the next word. */
read_rest(C,[Word|Words]) :- lower_case(C,LC),
                             read_word(LC,Chars,Next),
                             name(Word,Chars),
                             read_rest(Next,Words).

/* Space, comma, newline, period or question mark separate words. */
read_word(C,[],C) :- ( C=32 ; C=44 ; C=10 ;
                         C=46 ; C=63 ) , !.

/* Otherwise, get characters, convert alpha to lower case. */
read_word(C,[LC|Chars],Last) :- lower_case(C,LC),
                                get0(Next),
                                read_word(Next,Chars,Last).

/* Convert to lower case if necessary. */
lower_case(C,C) :- ( C <  65 ; C > 90 ) , !.
lower_case(C,LC) :- LC is C + 32.

/* for reference ... 
newline(10).
comma(44).
space(32).
period(46).
question_mark(63).
*/
trim_period([.],[]).     
trim_period([X|R],[X|T]) :- trim_period(R,T).

verbo(V,F,Tmp,Conj)--> [VF],
	{
	es_lexema(Lex,V,Conj),
	es_morfema(Conj,F,Tmp,Morf),
	atom_concat(Lex,Morf,VF)
	}.

pasiva :-
	write('Activa: '),
	read_line(A),
	trim_period(A,X),
	frase(Y,activa,W,X,[]),
	frase(Y,pasiva,W,Z,[]),
	nl,
	write('Pasiva: '),
	write(Z).
