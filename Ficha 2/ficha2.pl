
somaCalc([],0,0):-!.
somaCalc([H|T],Total,Amount):- somaCalc(T,Total1,Amount1), Total is Total1 + H, Amount is Amount1 +1.
media([],M):- M is 0.
media([H|T],M):- somaCalc([H|T],Total,Amount), M is Total/Amount.


menor([],M):- M is 0.
menor([H|[]],H):-!.
menor([H|T],H):-menor(T,M),H<M.
menor([H|T],M):-menor(T,M), H>=M.



parImpar([],P,I):- P is 0, I is 0.
parImpar([H|T],P,I):- parImpar(T,Par,Impar), divInt(H,2,_,Resto), Resto == 0, P is Par + 1, I is Impar.
parImpar([H|T],P,I):- parImpar(T,Par,Impar), divInt(H,2,_,Resto), Resto \= 0, I is Impar + 1, P is Par.

parImpar([H|T],P,I):- parImpar([H|T],Par,Impar), !,P is Par, I is Impar.


apaga(_,[ ],[ ]).
apaga(X,[X|L],M):-!,apaga(X,L,M).
apaga(X,[Y|L],[Y|M]):-apaga(X,L,M).
menorPrimeiro([H|T], L):- menor([H|T],M),apaga(M,[H|T],L1),!, L = [M|L1].

concatena([ ],L,L).
concatena([A|B],C,[A|D]):-concatena(B,C,D).

inverte1([ ],L,L).
inverte1([X|L],L2,L3):- inverte1(L,[X|L2],L3).
inverte(L,LI):-inverte1(L,[ ],LI).

substitui1(_,_,[],[]).
substitui1(X,Y,[X|T],[Y|L]):- substitui1(X,Y,T,L).
substitui1(X,Y,[A|T],[A|L]):- substitui1(X,Y,T,L).
substitui(X,Y,[H|T],L):-substitui1(X,Y,[H|T],L),!.


insere1(X,1,L,[X|L]):- !.
insere1(X,N,[H|T],[H|L]):- N1 is N-1,insere1(X,N1,T,L).
insere(X,N,[H|T],L):-insere1(X,N,[H|T],L).
