% Ejercicio 5 hoja 8
% Eric Garcia - Ignacio Terriza

pregunta(At,No)-->formula(Conc),atributo(At,Conc),nexo(Conc2),nombre(No,Conc2).
pregunta(At,No)-->[que],atributo2(At),[tiene],nombre(No,_).

formula(singular)--> [cual,es].
formula(plural)--> [cuales,son].
formula(_)--> [dime].
formula(_)--> [dame].
formula(_)--> [quiero,saber].

atributo(salario,singular)--> [el,salario].
atributo(edad,singular)--> [la,edad].
atributo(departamento,singular)--> [el,departamento].
atributo(nombre,plural)--> [los,nombres,de,los,empleados].

atributo2(salario)--> [salario].
atributo2(edad)--> [edad].
atributo2(departamento)--> [departamento].

nexo(snm)--> [del].
nexo(_)--> [de].

nombre(garcia,np)--> [garcia].
nombre(martinez,np)--> [martinez].
nombre(ventas,snm)--> [departamento,de,ventas].
nombre(investigacion,snm)--> [departamento,de,investigacion].
nombre(madrid,snf)--> [la,factoría,de,madrid].
nombre(barcelona,snf)--> [la,factoría,de,barcelona].

empleado(garcia,salario,1200).
empleado(garcia,departamento,ventas).
empleado(garcia,edad,43).
empleado(garcia,factoria,madrid).
empleado(martinez,salario,1300).
empleado(martinez,departamento,investigacion).
empleado(martinez,edad,50).
empleado(martinez,factoria,barcelona).
empleado(gomez,factoria,barcelona).
empleado(gomez,departamento,ventas).
empleado(gomez,edad,32).
empleado(gomez,salario,1000).

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

consulta :-
	write('$'),
	read_line(W),
	trim_period(W,X),
	pregunta(A,B,X,[]),
	(empleado(B,A,C);empleado(C,departamento,B);empleado(C,factoria,B)),
	nl,
	write(C),
	fail.
