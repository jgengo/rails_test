# Test technique Rails



## Sujet
Calculer via une API (eg GoogleMap) le kilométrage d'une location, en se basant sur les
positions connues du véhicule pendant la location. Le résultat doit être le plus réaliste possible.

## Inputs
Extract CSV des positions de la location :
timestamp : integer, timestamp de la remontée de position
latitude : float
longitude : float


## Retour attendu
Application Ruby on Rails incluant
- une ressource “Rental”
- un formulaire permettant l’upload de fichier CSV de positions, le calcul du kilométrage correspondant et l’association de ce kilométrage à une location (“rental”).