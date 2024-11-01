# Notes sur la Récursivité en Prolog

## Concepts de Base


Bien sûr ! Prolog est un langage de programmation logique principalement utilisé en intelligence artificielle, linguistique, et recherche de bases de connaissances. Il repose sur la logique de prédicats et utilise un mécanisme de backtracking pour résoudre des requêtes. Voici les concepts de base de Prolog pour bien débuter :

### 1. Faits et Règles
Faits : Ce sont des affirmations qui décrivent des informations connues. Exemple :

```prolog
aime(marie, chocolat).
```
Ici, aime(marie, chocolat) signifie que Marie aime le chocolat.

Règles : Elles expriment des relations logiques basées sur des faits ou d'autres règles. Une règle a une tête et un corps, et utilise l'opérateur :- qui signifie "si".

```prolog
ami(X, Y) :- aime(X, Y), aime(Y, X).
```
Cela signifie que X et Y sont amis si X aime Y et Y aime X.

### 2. Requêtes
Les requêtes interrogent les faits et règles pour obtenir des réponses.
```prolog
?- aime(marie, chocolat).
```
Cette requête demande si le fait aime(marie, chocolat) est vrai. Si Prolog trouve un fait ou une règle le confirmant, il renvoie true. Sinon, il renvoie false.
### 3. Variables
Les variables commencent par une majuscule ou _. Elles représentent des éléments inconnus que Prolog va essayer d'associer.
```prolog
?- aime(marie, X).
```
Ici, X est une variable. Prolog cherchera tous les éléments que Marie aime.
### 4. Backtracking (Retour sur trace)
Prolog explore les solutions possibles et, si une solution ne convient pas, il revient en arrière pour essayer une autre option.
Exemple :
```prolog
aime(marie, chocolat).
aime(marie, pizza).
```
Avec la requête ?- aime(marie, X)., Prolog retournera d'abord X = chocolat, puis X = pizza en utilisant le backtracking pour explorer toutes les solutions.
### 5. Opérateur cut (!)
L'opérateur ! (cut) bloque le backtracking lorsqu’il est atteint, limitant les solutions possibles.
Exemple :
```prolog
parent(X, Y) :- pere(X, Y), !.
parent(X, Y) :- mere(X, Y).
```
Si Prolog trouve pere(X, Y), il ne cherchera pas mere(X, Y) à cause du !.
### 6. Listes
Les listes sont une structure de données importante en Prolog. Elles se définissent entre crochets [ ] et peuvent être manipulées par décomposition.
```prolog
[Tete|Reste] = [1, 2, 3, 4].
```
Ici, Tete sera 1 et Reste sera [2, 3, 4].
### 7. Récursivité
Prolog utilise la récursivité pour parcourir des listes ou traiter des structures répétitives.
Exemple : Calculer la longueur d'une liste.
```prolog
longueur([], 0).
longueur([_|R], N) :- longueur(R, N1), N is N1 + 1.
```
8. Opérations arithmétiques
Prolog utilise is pour évaluer des expressions arithmétiques.
```prolog
X is 3 + 2.
```
Cela assigne 5 à X.
### 9. Égalité et unification
L'opérateur = en Prolog vérifie l’unification (ou compatibilité) entre deux termes, mais il n’évalue pas d'expressions. Pour comparer des valeurs arithmétiques, il faut utiliser =:=.
### Exemple :
```prolog
?- 3 + 2 =:= 5.  % true
?- X = 5.         % X devient 5
```

### 10. Opérateurs de comparaison
= : Vérifie si deux termes peuvent être unifiés, c'est-à-dire rendus identiques en attribuant des valeurs aux variables.

```prolog
?- X = 5.
% X = 5
```
\= : Vérifie si deux termes ne peuvent pas être unifiés.

```prolog
?- 3 \= 4.
% true
```

== : Vérifie l'égalité stricte sans unification. Deux termes doivent déjà être identiques.

```prolog
?- 3 == 3.
% true
```
\== : Vérifie si deux termes ne sont pas identiques.

```prolog
?- 3 \== 4.
% true
```
@<, @>, @=<, @>= : Comparaison lexicographique des termes (utile pour les chaînes ou les structures).

```prolog
?- "a" @< "b".
% true
```
### 11. Opérateurs arithmétiques
Les opérateurs arithmétiques nécessitent l’opérateur is pour évaluer l’expression et assigner la valeur.

+, -, *, / : Addition, soustraction, multiplication, et division.

```prolog
?- X is 3 + 4.
% X = 7
```
// : Division entière.

```prolog
?- X is 10 // 3.
% X = 3
```
mod : Modulo, retourne le reste d’une division entière.

```prolog
?- X is 10 mod 3.
% X = 1
```
** ou ^ : Puissance.

```prolog
?- X is 2 ** 3.
% X = 8
```
### 12. Opérateurs de comparaison arithmétique
Ces opérateurs comparent des expressions arithmétiques, en les évaluant avant de faire la comparaison.

=:= : Égalité entre expressions arithmétiques.

```prolog
?- 5 =:= 2 + 3.
% true
```
=\= : Différence entre expressions arithmétiques.

```prolog
?- 5 =\= 3 + 1.
% true
```
<, >, =<, >= : Comparaison classique de valeurs numériques.

```prolog
?- 7 > 3.
% true
```
### 13. Opérateurs logiques
, : Opérateur "et". Toutes les conditions doivent être vraies.

```prolog
?- X = 5, Y = 10.
% X = 5, Y = 10
; : Opérateur "ou". Au moins une des conditions doit être vraie.

```prolog
?- X = 5 ; X = 10.
% X = 5 ; X = 10 (deux réponses possibles)
not ou \+ : Négation. Vérifie que la condition suivante est fausse.

```prolog
?- \+ (X = 5).
% true si X n'est pas 5
``` 
### 14. Opérateur de coupure (!)
! (cut) : Stoppe le backtracking à cet endroit. Il permet d’empêcher Prolog de rechercher d'autres solutions une fois qu'il en trouve une.
Exemple sans cut :

```prolog
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.
```
Exemple avec cut :

```prolog
max(X, Y, X) :- X >= Y, !.
max(X, Y, Y).
```
Ici, le cut (!) empêche Prolog de vérifier la seconde règle si X >= Y est vrai.

### 15. Opérateurs pour les listes
[Tête | Reste] : Structure de liste où Tête est le premier élément et Reste est le reste de la liste.
```prolog
?- [T|R] = [1, 2, 3].
% T = 1, R = [2, 3]
```

### la récursivité 
signifie qu’une fonction ou une règle s'appelle elle-même pour traiter une partie du problème, jusqu'à ce qu'elle atteigne un cas de base (ou condition d'arrêt) qui termine le processus.

Prenons un exemple classique : calculer la longueur d'une liste en Prolog.

### Exemple : Calculer la longueur d'une liste
Supposons que l'on veuille trouver la longueur d'une liste [a, b, c].

Voici comment cela se présente en Prolog :

```prolog
longueur([], 0).  % Cas de base
longueur([_|Reste], N) :- longueur(Reste, N1), N is N1 + 1.  % Cas récursif
```
Explication de chaque ligne :
Cas de base : longueur([], 0).
Cela signifie que si la liste est vide ([]), alors sa longueur est 0. Ce cas de base met fin à la récursivité, car il n'appelle pas longueur/2 à nouveau.
Cas récursif : longueur([_|Reste], N) :- longueur(Reste, N1), N is N1 + 1.
La liste [Tête | Reste] signifie qu'on divise la liste en deux parties : le premier élément (Tête, qu'on ignore ici avec _) et le Reste de la liste.
longueur(Reste, N1) appelle récursivement la règle pour calculer la longueur de Reste et l’assigne à N1.
Ensuite, on ajoute 1 à N1 pour obtenir N, la longueur totale.
Illustration du processus
Imaginons que nous appelions longueur([a, b, c], N).

Étape 1 : longueur([a, b, c], N)

N sera N1 + 1
On appelle longueur([b, c], N1)
Étape 2 : longueur([b, c], N1)

N1 sera N2 + 1
On appelle longueur([c], N2)
Étape 3 : longueur([c], N2)

N2 sera N3 + 1
On appelle longueur([], N3)
Étape 4 : longueur([], N3)

Cas de base : on retourne N3 = 0
En remontant, Prolog effectue les calculs :

N3 = 0, donc N2 = 0 + 1 = 1
N1 = 1 + 1 = 2
N = 2 + 1 = 3
Résultat final : N = 3, qui est bien la longueur de [a, b, c].

Autres exemples de récursivité
La récursivité fonctionne de manière similaire pour des opérations comme additionner tous les éléments d'une liste, parcourir une liste, ou chercher un élément. En résumé, elle consiste toujours à diviser un problème en une plus petite partie et à s'arrêter lorsqu'un cas de base est atteint.




