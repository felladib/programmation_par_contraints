# Notes sur la Récursivité en Prolog

## Concepts de Base
La récursivité en Prolog consiste à…

### Exemple de Longueur de Liste

```prolog
longueur([], 0).  
longueur([_|Reste], N) :- longueur(Reste, N1), N is N1 + 1. 
```