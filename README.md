# Crimson Arsenal - Documentation d'installation

## 📌 Présentation du projet
**Crimson Arsenal** est une application web dédiée à la recherche et à la consultation d'armes de jeux vidéo.  
Elle permet aux utilisateurs d’explorer une large base de données d’armes, avec des filtres et une interface immersive inspirée des interfaces de jeux vidéo.

---

## 1 - Prérequis
Avant d'installer le projet, assurez-vous d'avoir les éléments suivants :  

### Pour **Windows**
- [WampServer](https://www.wampserver.com/)
- [PostgreSQL + pgAdmin](https://www.postgresql.org/download/windows/)
- **Fichier SQL** pour le peuplement de la base de données

### Pour **Linux**
- Apache2 + PHP
- PostgreSQL + pgAdmin
- **Fichier SQL** pour le peuplement de la base de données

---

# 2 - Installation et configuration

## 📌 2.1. Installation sous **Windows**

### Télécharger et installer WampServer
1. Rendez-vous sur le site officiel de WampServer :  
   🔗 [https://www.wampserver.com/](https://www.wampserver.com/)
2. Téléchargez et installez la version **64 bits** (recommandée).
3. Suivez les instructions et installez Wamp dans :  

`C:/wamp64`


### Ajouter le projet dans Wamp
1. Placez le dossier du projet dans :  

`C:/wamp64/www/CrimsonArsenal`

2. Vérifiez que Wamp est bien **lancé** (icône verte dans la barre des tâches).
3. Accédez à votre serveur local via :  

http://localhost/


### Installation de PostgreSQL et pgAdmin
1. Téléchargez PostgreSQL depuis le site officiel :  
🔗 [https://www.postgresql.org/download/windows/](https://www.postgresql.org/download/windows/)
2. Installez PostgreSQL en suivant les instructions et **retenez votre mot de passe** PostgreSQL.
3. Vérifiez que **pgAdmin** est bien installé.

### Activer PostgreSQL dans PHP (WampServer)
Par défaut, **PostgreSQL** est **désactivé** dans Wamp. Il faut l'activer :

1. Ouvrez **WampServer** et cliquez sur l'icône dans la barre des tâches.
2. Allez dans **PHP → php.ini**.
3. Recherchez ces lignes et **décommentez-les** (supprimez le `;` au début) :

```ini
extension=pgsql
extension=pdo_pgsql
```

4. Redémarrez Wamp pour appliquer les changements.

## 📌 2.2. Installation sous Linux

### Installer les dépendances
Installez Apache, PHP et PostgreSQL avec les commandes suivantes :

```bash
sudo apt update
sudo apt install apache2 php php-pgsql postgresql postgresql-contrib pgadmin4
```
Démarrez les services :
```bash
sudo systemctl start apache2
sudo systemctl start postgresql
```
Placez le dossier du projet dans le répertoire Apache :
```bash
sudo mv CrimsonArsenal /var/www/html/
```
Modifiez les permissions :
```bash
sudo chown -R www-data:www-data /var/www/html/CrimsonArsenal
sudo chmod -R 755 /var/www/html/CrimsonArsenal
```
## 📌 2.3. Création de la base de données

### Depuis pgAdmin

Lancez pgAdmin et connectez-vous avec PostgreSQL.
Dans la barre latérale gauche, cliquez sur Bases de données → Créer une base de données.
Nommez la base de données exactement comme indiqué dans votre fichier credentials.
Dans Propriétés, définissez :

  - **Nom de la base :** [Nom de la base selon credentials]
  - **Utilisateur :** [Utilisateur selon credentials]
  - **Mot de passe :** [Mot de passe selon credentials]

Cliquez sur Enregistrer.

## 📌 2.4. Peuplement de la base de données

### Méthode via pgAdmin

Ouvrez pgAdmin et sélectionnez votre base de données.
Cliquez sur **Outils** → **Query Tool**.
Ouvrez le fichier `sql_script.sql`.
Copiez-collez le contenu dans l’éditeur de requêtes.
Exécutez le script en cliquant sur ▶ Exécuter.

### Méthode via Terminal (Linux)

Si vous êtes sous Linux, utilisez cette commande :
```bash
psql -U postgres -d [Nom de la base selon credentials] -f /chemin/vers/sql_script.sql
```

# 3 - Lancer le projet
## 📌 3.1. Démarrage sous Windows

Démarrer WampServer.
Ouvrir un navigateur et accéder à :
http://localhost/CrimsonArsenal/

Si tout est bien configuré, l’application devrait se lancer. 

*Bien sûr, le lien du projet peut différer selon ou vous l'avez placer.*

## 📌 3.2. Démarrage sous Linux
Démarrer Apache et PostgreSQL :
```bash
sudo systemctl start apache2
sudo systemctl start postgresql
```
Accédez à votre navigateur et ouvrez :

http://localhost/CrimsonArsenal/

*Bien sûr, le lien du projet peut différer selon ou vous l'avez placer.*

# ⚠️ 4 - Erreurs possibles et solutions
### ❌ Erreur de connexion à PostgreSQL
 - Vérifiez que PostgreSQL est bien activé dans php.ini.
 - Vérifiez les informations de connexion dans credentials.

### ❌ Base de données introuvable
 - Assurez-vous d’avoir bien créé la base avec le bon nom.
 - Vérifiez la connexion dans pgAdmin ou PostgreSQL.

### ❌ Erreur lors de l’import du SQL
 - Vérifiez que vous êtes bien connecté à la bonne base avant d’exécuter le script.
 - Si un message d’erreur apparaît, vérifiez le contenu du script SQL.

## Projet - Site web

Membres de l'équipe

Voici la liste des membres ayant participé à ce projet :

SALMI Sofiane

THURAIRAJASINGAM Kavusikan

GUILLAUBY Djibryl

HOUMIMID Hani

RIZAOGLU Fulya


## Accès à la vue admin

Pour accéder à l'interface d'administration, suivez les étapes ci-dessous :

Rendez-vous sur l'URL suivante :

?controller=admin&action=formConnect

Utilisez les informations de connexion suivantes :

Identifiant (ID) : 1111

Mot de passe (mdp) : crimson# audit
