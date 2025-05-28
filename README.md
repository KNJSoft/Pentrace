# Pentrace

Pentrace est un outil de test de pénétration et d'analyse de sécurité conçu pour les professionnels de la cybersécurité. Écrit en Bash, il fournit un ensemble de fonctionnalités puissantes pour :

- Enregistrer et analyser les sessions terminales
- Suivre les activités de test de sécurité
- Documenter les résultats des tests

## Caractéristiques principales

- **Enregistrement de sessions** : Capture automatique des commandes et de leurs résultats
- **Gestion des wordlists** : Création, modification et utilisation de listes personnalisées
- **Interface en ligne de commande** : Simple et intuitive à utiliser
- **Logs horodatés** : Suivi précis de toutes les activités
- **Installation facile** : Compatible avec les systèmes Linux


# Manuel d'utilisation de Pentrace

## Installation

1.  **Téléchargement (Option 1 : Via Git)**
    ```bash
    git clone https://github.com/KNJSoft/Pentrace.git
    cd Pentrace
    chmod +x install.sh
    sudo ./install.sh
    ```

2.  **Téléchargement (Option 2 : Via Wget/Curl)**
    ```bash
    wget https://github.com/KNJSoft/Pentrace.git -O Pentrace
    # ou
    curl -o Pentrace https://github.com/KNJSoft/Pentrace.git
    chmod +x Pentrace
    cd Pentrace
    sudo ./install.sh
    ```

## Utilisation

### Commandes Principales

1.  **Démarrer l'enregistrement :**
    ```bash
    pt start
    ```
    Cette commande démarre l'enregistrement de toutes les commandes tapées dans le terminal et de leurs résultats dans un fichier de log horodaté.

2.  **Arrêter l'enregistrement :**
    ```bash
    pt stop
    ```
    Arrête l'enregistrement en cours. Les commandes suivantes ne seront plus loguées dans le fichier actuel.

3.  **Afficher les logs récents :**
    ```bash
    pt show [--lines <nombre>]
    ```
    Affiche les dernières entrées du fichier de log actuel. L'option `--lines` permet de spécifier le nombre de lignes à afficher (par défaut, affiche les 20 dernières lignes).

4.  **Lister tous les fichiers de logs :**
    ```bash
    pt list-logs
    ```
    Affiche la liste de tous les fichiers de logs créés par Pentrace, le nom du fichier est le nom de la wordlist.

5.  **Afficher le contenu d'un fichier de log spécifique :**
    ```bash
    pt view-log <nom_du_fichier_log>
    ```
    Affiche le contenu du fichier de log spécifié.

### Gestion des Wordlists

1.  **Créer une nouvelle wordlist :**
    ```bash
    pt wordlist create <nom_wordlist>
    ```
    Crée un nouveau fichier de wordlist avec le nom spécifié.

2.  **Sélectionner une wordlist active :**
    ```bash
    pt wordlist select <nom_wordlist>
    ```
    Définit la wordlist spécifiée comme la wordlist active pour les opérations futures (par exemple, l'ajout de termes). Par défaut, la wordlist "default" est active.

3.  **Supprimer une wordlist :**
    ```bash
    pt wordlist delete <nom_wordlist>
    ```
    Supprime le fichier de la wordlist spécifiée. Attention : cette action est irréversible.

4.  **Lister le contenu de la wordlist active (sous forme de tableau) :**
    ```bash
    pt wordlist list
    ```
    Affiche le contenu de la wordlist actuellement sélectionnée sous forme de tableau.

5.  **Ajouter un terme à la wordlist active :**
    ```bash
    pt wordlist add <terme>
    ```
    Ajoute le terme spécifié à la wordlist active.

6.  **Supprimer un terme de la wordlist active :**
    ```bash
    pt wordlist remove <terme>
    ```
    Supprime le terme spécifié de la wordlist active.

7.  **Afficher la liste de toutes les wordlists disponibles :**
    ```bash
    pt wordlist show
    ```
    Affiche la liste des noms de tous les fichiers de wordlist créés par Pentrace.

### Autres Commandes Utiles

1.  **Afficher l'aide :**
    ```bash
    pt help
    ```
    Affiche ce manuel d'utilisation ou une aide concise pour les commandes.

2.  **Afficher la version de Pentrace :**
    ```bash
    pt version
    ```
    Affiche la version actuelle de l'outil Pentrace.

### Désinstallation

1.  **Supprimer le binaire :**
    ```bash
    sudo ./uninstall.sh
    ```

2.  **Supprimer le répertoire de configuration et les logs (Optionnel) :**
    ```bash
    rm -rf ~/.pentrace
    ```
    *(Ceci supprimera tous les fichiers de logs et les wordlists créés par Pentrace. Soyez prudent.)*

## Configuration (Potentiel futur)

* Un fichier de configuration pourrait être ajouté ultérieurement pour personnaliser le comportement de Pentrace (par exemple, le répertoire de stockage des logs, la wordlist par défaut, etc.).


