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
nombre(gomez,np)--> [gomez].
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

consulta :-
	write('$'),
	read(X),
	pregunta(A,B,X,[]),
	(empleado(B,A,C);empleado(C,departamento,B);empleado(C,factoria,B)),
	nl,
	write(C),
	fail.
