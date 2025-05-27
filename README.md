# Pentrace

Pentrace is a penetration testing framework written in Bash.


# Manuel d'utilisation de Pentrace

## Installation

1.  **Téléchargement (Option 1 : Via Git)**
    ```bash
    git clone <URL_DU_REPO_GIT> pentrace
    cd pentrace
    chmod +x pentrace.sh
    sudo mv pentrace.sh /usr/local/bin/pentrace
    ```
    *(Remplacez `<URL_DU_REPO_GIT>` par l'adresse de votre dépôt Git si vous en utilisez un.)*

2.  **Téléchargement (Option 2 : Via Wget/Curl)**
    ```bash
    wget <URL_DU_SCRIPT> -O pentrace.sh
    # ou
    curl -o pentrace.sh <URL_DU_SCRIPT>
    chmod +x pentrace.sh
    sudo mv pentrace.sh /usr/local/bin/pentrace
    ```
    *(Remplacez `<URL_DU_SCRIPT>` par l'adresse où se trouve le script `pentrace.sh`.)*

## Utilisation

### Commandes Principales

1.  **Démarrer l'enregistrement :**
    ```bash
    pentrace start
    ```
    Cette commande démarre l'enregistrement de toutes les commandes tapées dans le terminal et de leurs résultats dans un fichier de log horodaté.

2.  **Arrêter l'enregistrement :**
    ```bash
    pentrace stop
    ```
    Arrête l'enregistrement en cours. Les commandes suivantes ne seront plus loguées dans le fichier actuel.

3.  **Afficher les logs récents :**
    ```bash
    pentrace show [--lines <nombre>]
    ```
    Affiche les dernières entrées du fichier de log actuel. L'option `--lines` permet de spécifier le nombre de lignes à afficher (par défaut, affiche les 20 dernières lignes).

4.  **Lister tous les fichiers de logs :**
    ```bash
    pentrace list-logs
    ```
    Affiche la liste de tous les fichiers de logs créés par Pentrace, le nom du fichier est le nom de la wordlist.

5.  **Afficher le contenu d'un fichier de log spécifique :**
    ```bash
    pentrace view-log <nom_du_fichier_log>
    ```
    Affiche le contenu du fichier de log spécifié.

### Gestion des Wordlists

1.  **Créer une nouvelle wordlist :**
    ```bash
    pentrace wordlist create <nom_wordlist>
    ```
    Crée un nouveau fichier de wordlist avec le nom spécifié.

2.  **Sélectionner une wordlist active :**
    ```bash
    pentrace wordlist select <nom_wordlist>
    ```
    Définit la wordlist spécifiée comme la wordlist active pour les opérations futures (par exemple, l'ajout de termes). Par défaut, la wordlist "default" est active.

3.  **Supprimer une wordlist :**
    ```bash
    pentrace wordlist delete <nom_wordlist>
    ```
    Supprime le fichier de la wordlist spécifiée. Attention : cette action est irréversible.

4.  **Lister le contenu de la wordlist active (sous forme de tableau) :**
    ```bash
    pentrace wordlist list
    ```
    Affiche le contenu de la wordlist actuellement sélectionnée sous forme de tableau.

5.  **Ajouter un terme à la wordlist active :**
    ```bash
    pentrace wordlist add <terme>
    ```
    Ajoute le terme spécifié à la wordlist active.

6.  **Supprimer un terme de la wordlist active :**
    ```bash
    pentrace wordlist remove <terme>
    ```
    Supprime le terme spécifié de la wordlist active.

7.  **Afficher la liste de toutes les wordlists disponibles :**
    ```bash
    pentrace wordlist show
    ```
    Affiche la liste des noms de tous les fichiers de wordlist créés par Pentrace.

### Autres Commandes Utiles

1.  **Afficher l'aide :**
    ```bash
    pentrace help
    ```
    Affiche ce manuel d'utilisation ou une aide concise pour les commandes.

2.  **Afficher la version de Pentrace :**
    ```bash
    pentrace version
    ```
    Affiche la version actuelle de l'outil Pentrace.

### Désinstallation

1.  **Supprimer le binaire :**
    ```bash
    sudo rm /usr/local/bin/pentrace
    ```

2.  **Supprimer le répertoire de configuration et les logs (Optionnel) :**
    ```bash
    rm -rf ~/.pentrace
    ```
    *(Ceci supprimera tous les fichiers de logs et les wordlists créés par Pentrace. Soyez prudent.)*

## Configuration (Potentiel futur)

* Un fichier de configuration pourrait être ajouté ultérieurement pour personnaliser le comportement de Pentrace (par exemple, le répertoire de stockage des logs, la wordlist par défaut, etc.).


