```
Rails 5.1.4
ruby 2.4.2p198
```

```
bundle install
gem install sidekiq
bundle exec sidekiq
rails db:create
rails db:migrate
rails db:seed

rails s
```

J'ai utilisé SQLite pour faciliter l'usage / l'init du projet pour l'entreprise qui m'a donné ce test technique.
J'ai egalement utilisé inherited_ressources pour reduire l'ecriture des methodes du CRUD.

Sidekiq pour le background processing.

# Test technique Rails

## Sujet
Calculer via une API (eg GoogleMap) le kilométrage d'une location, en se basant sur les
positions connues du véhicule pendant la location. Le résultat doit être le plus réaliste possible.

## Inputs
Extract CSV des positions de la location :
- timestamp : integer (timestamp de la remontée de position)
- latitude : float
- longitude : float


## Retour attendu
Application Ruby on Rails incluant
- une ressource “Rental”
- un formulaire permettant l’upload de fichier CSV de positions, le calcul du kilométrage correspondant et l’association de ce kilométrage à une location (“rental”).
