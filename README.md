# PharoProject


## Génération documentation exemple

Pour tester le 2nd exercice, il suffit d'ouvrir le Transcript et lancer la méthode de classe sur le nom du paquet voulu :

```Pharo
Transcript open.
PharoDoc generationDocClasses: 'PackageName'.
```

![Execution PharoDoc](PharoDoc_Execution.png)

## Tests

Seuls les classes Matrix présente des tests en la présence de MatrixTest, car je dois admettre que je ne savais pas créer une classe de Test qui testerait PharoDoc dût à son contexte particulier.

[![Coverage Status](https://coveralls.io/repos/github/JulienLamhene/PharoProject/badge.svg?branch=main)](https://coveralls.io/github/JulienLamhene/PharoProject?branch=main)