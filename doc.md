# Documentation du code

## Docker-Compose

Le docker-compose est séparé en 2 parties.

La première partie est la partie service, 
Elle commence par un block correspondant au conteneur NoVNC, il possède les caractéristiques suivantes :
- 'build' qui correspond à l'emplacement du fichier DockerFile
- 'restart' permet de définir si le conteneur doit être automatiquement redémarrer lorsqu'il s'éteint
- 'ports' permet de définir les ports accessibles à l'extérieur (PORTEXTERIEUR:PORTSURLECONTENEUR)
- 'networks' permet de définir les réseaux accessibles depuis ce conteneur

Elle possède également un block par conteneur XVNC, il possède les caractéristiques évoquées précédemment ainsi que :
- 'depends_on' qui permet de définir de quel conteneur dépend ce conteneur.
- 'environment' qui permet de définir les paramètres spécifiques à ce contenur tel que le mot de passe VNC, le nom d'utilisateur, le port VNC ou même l'utilisation du SSL.

La seconde partie correspond aux réseaux,
Elle liste l'ensemble des réseaux en créant un réseau par conteneur xvnc afin de les isoler les un des autres. De plus ces réseaux isolés ont la propriété 'internal' définie à 'true' afin de rendre leur accès depuis l'extérieur impossible.

Lorsque vous ajoutez un conteneur xvnc pensez à également ajouter son réseau dans la section 'networks'.

## DockerFile XVNC

Les dockerfile xvnc ont tous la même architecture.
- Tout d'abord les variables d'environement sont définies.
- Ensuite l'ensemble des scripts sont copiés sur le docker.
- Les bonnes permissions sont ensuite définies sur les scripts.
- Les scripts d'installation de xTigerVNC et du Window Manager sont exécutés.
- Les scripts de configurations sont ensuite exécutés.
- On utilise un nouvel utilisateur pour la suite pour des raisons de sécurité
- Au lancement on exécute le script de lancement de VNC pour autoriser la connexion depuis le NoVNC.

## DockerFile NoVNC

- On définit les variables d'environnement.
- On installe les packages nécessaires.
- On installe NoVNC.
- On récupère le fichier 'index.html' pour le mettre en page d'accueil.
- Au lancement on lance le serveur NoVNC.

