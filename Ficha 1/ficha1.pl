potencia(_,0,1):- !.
potencia(B,E,P):- E>0,!, E1 is E-1, potencia(B,E1,P1), P is B*P1.
potencia(B,E,P):- E1 is E+1, potencia(B,E1,P1), P is P1/B.

fatorial(0,1):-!.
fatorial(N,R):- N>0,!,N1 is N-1, fatorial(N1,R1), R is N*R1.
fatorial(N,R):- N1 is N+1, fatorial(N1,R1), R is N*R1.

somatorio(J,J,R):- R is J,!.
somatorio(J,K,R):- J=<K,!,K1 is K-1, somatorio(J,K1,R1), R is R1+K.
somatorio(J,K,R):- K1 is K+1, somatorio(J,K1,R1), R is R1+K.

divInt(D,Div,0,Resto):- D<Div, Resto is D, !.
divInt(D,Div,R,Resto):- D1 is D-Div, divInt(D1, Div, R1, Resto), R is R1+1.