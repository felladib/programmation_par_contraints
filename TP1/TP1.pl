
%Qst1
appartient(X, [X|_]):-!. /*pour parcourir la liste enlever :-!*/
appartient(X, [_|L]):-appartient(X,L).

%Qst2
premier(X,[X|_]).

%Qst3
dernier(X,[X]).
dernier(X,[_,Y|L]):-dernier(X,[Y|L]).

%Qst4
avantdernier(X,[X,_]):-!.
avantdernier(X, [_,Y,Z|L]):-avantdernier(X,[Y,Z|L]).

%Qst5

suppK(1,[_|L],L).
suppK(K,[X|L1],[X|L2]):-K2 is K-1, suppK(K2,L1,L2).

%Qst6
substitute(_,_,[],[]).
substitute(X,Y,[X|L1],[Y|L2]):-!, substitute(X,Y,L1,L2).
substitute(X,Y,[Z|L1],[Z|L2]):-substitute(X,Y,L1,L2).

%Qst7 
/* test : longueur([6,7,3,9],K). */
longueur([],0).
longueur([_|L],K):-longueur(L,K2), K is K2+1.

%Qst8 
/* test : somme([6,7,3,9],S). */
somme([X],X).
somme([X,Y|L],S):-somme([Y|L],S2), S is S2+X.

%Qst9 
/* test : affiche1([6,7,3,9]).  */
affiche1([]).
affiche1([X|L]):-write(X), nl, affiche1(L).

%Qst10 
/* test : affiche2([6,7,3,9]).  */
affiche2([]).
affiche2([X|L]):-affiche2(L), nl, write(X).

%Qst11
/* test1 : pair([6,7,3]).  */
/* test2 : pair([6,7,3,4]).  */
pair([]).
pair([_,_|L]):-pair(L).

%Qst12
/* test : aumoins2occ(6,[6,7,3,6]).*/
aumoins2occ(X,[X|L]):-!, appartient(X,L).
aumoins2occ(X,[_|L]):-aumoins2occ(X,L).

%Qst13
/* test : concat([4,6,9,5],[8,2,3,1],L).*/
concat([],L,L).
concat([X|L1], L2, [X|L3]):-concat(L1,L2,L3).

%Qst14
/* test : palindrome([4,3,5,3,4]).*/
palindrome([]).
palindrome([_]).
palindrome([X,Y|L]):-dernier(X,[Y|L]), 
                    longueur([Y|L],K), 
                    suppK(K,[Y|L],L2),
                    palindrome(L2).
