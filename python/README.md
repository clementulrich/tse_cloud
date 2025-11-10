# FISE3_Option_Info

## 1- Choisir la techno (Java, JS, Py)
On choisit Python dans mon cas !


## 2- Développer l'appli HelloWorld
`print ("Hello World !")`


## 3- Tester l'appli en mode dev
`python app.py`


## 4- Dockeriser l'appli (faire le Dockerfile)
Création du file Dockerfile et ajout des précisions du fichier Docker (version Python, file dockeurisé ...)


## 5- Build l'image de l'appli
`docker build -t hello-python .`


## 6- Tester l'appli en mode docker (run un container)
`docker run hello-world`


## 7- Créer son repository sur ecr
Création du repo ECR et mise de côté de l'URL du référentiel privé ici `hello-python`


## 8- Tagger votre image en local avec votre full ecr repository name
`docker tag hello-python:latest 211125568639.dkr.ecr.us-east-1.amazonaws.com/hello-python`


## 9- Effectuer un docker login sur votre ecr repository et push votre image
On utilise d'abord un token temporaire pour authentifier notre Docker sur le registre ECR
`aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 211125568639.dkr.ecr.us-east-1.amazonaws.com/hello-python`

Ensuite, on pousse notre image Docker vers ECR
`docker push 211125568639.dkr.ecr.us-east-1.amazonaws.com/hello-python`

Après cette étape, l'image est bien stockée chez ECR et prête à être utilisée avec ECS !


## 10- Créer la task definition sur ecs en choisissant le bon nom d'image et le bon dimensionnement (attention au role)
Configurer de task definition via ECS : nom de la tâche, config du container, des ressources CPU...


## 11- Créer le cluster fargate sur ecs
Créer le cluster (toujours dans ECS) et choisir "Networking only" (ou Fargate uniquement)


## 12- Créer le service sur ecs à partir de cette task definition, sur le cluster précédemment créé, avec un security group approprié
Création du service Fargate avec la task definition appropriée


## 13- Récupérer sur l'onglet task l'IP publique de notre conteneur
Récuperer l'IP publique via les tâches ECS dans un service créé au préalable


## 14- Tester l'appli en mode AWS
Connexion à l'appli pour tester son bon fonctionnement avec `curl http://44.202.103.173` (il s'agissait ici de l'adresse publique obtenue via la tâche)


> Attention, il a été nécessaire pour l'étape 12 de créer via EC2 un Security Group pour afficher correctement l'IP publique (ce n'est pas toujours le cas)