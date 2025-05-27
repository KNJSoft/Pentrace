#!/bin/bash

# Variables globales
PENTRACE_DIR="~/.pentrace"
LOG_DIR="$PENTRACE_DIR/logs"
WORDLIST_DIR="$PENTRACE_DIR/wordlists"
ACTIVE_WORDLIST="$WORDLIST_DIR/active"

# Fonction pour créer la structure de répertoires
create_structure() {
    mkdir -p "$LOG_DIR" "$WORDLIST_DIR"
    touch "$ACTIVE_WORDLIST"
}

# Fonction pour démarrer l'enregistrement
do_start() {
    create_structure
    LOG_FILE="$LOG_DIR/$(date +'%Y%m%d_%H%M%S').log"
    echo "Démarrage de l'enregistrement dans $LOG_FILE"
    script -q "$LOG_FILE"
}

# Fonction pour arrêter l'enregistrement
do_stop() {
    echo "Arrêt de l'enregistrement"
    kill -INT $(ps -ef | grep script | grep -v grep | awk '{print $2}')
}

# Fonction pour afficher les logs
do_show() {
    local lines=${1:-20}
    if [ -f "$LOG_FILE" ]; then
        tail -n "$lines" "$LOG_FILE"
    else
        echo "Aucun fichier de log actif trouvé"
    fi
}

# Fonction pour lister les logs
do_list_logs() {
    ls -l "$LOG_DIR" | awk '{print $9}'
}

# Fonction pour afficher un log spécifique
do_view_log() {
    if [ -f "$LOG_DIR/$1" ]; then
        cat "$LOG_DIR/$1"
    else
        echo "Fichier de log non trouvé"
    fi
}

# Fonction pour gérer les wordlists
do_wordlist() {
    local action=$1
    local name=$2
    local term=$3

    case $action in
        create)
            touch "$WORDLIST_DIR/$name"
            echo "Wordlist $name créée"
            ;;
        select)
            echo "$WORDLIST_DIR/$name" > "$ACTIVE_WORDLIST"
            echo "Wordlist active: $name"
            ;;
        delete)
            rm -f "$WORDLIST_DIR/$name"
            echo "Wordlist $name supprimée"
            ;;
        list)
            if [ -f "$ACTIVE_WORDLIST" ]; then
                cat $(cat "$ACTIVE_WORDLIST")
            else
                echo "Aucune wordlist active"
            fi
            ;;
        add)
            if [ -f "$ACTIVE_WORDLIST" ]; then
                echo "$term" >> $(cat "$ACTIVE_WORDLIST")
                echo "Terme ajouté: $term"
            else
                echo "Aucune wordlist active"
            fi
            ;;
        remove)
            if [ -f "$ACTIVE_WORDLIST" ]; then
                sed -i "/^$term$/d" $(cat "$ACTIVE_WORDLIST")
                echo "Terme supprimé: $term"
            else
                echo "Aucune wordlist active"
            fi
            ;;
        show)
            ls "$WORDLIST_DIR"
            ;;
        *)
            echo "Action wordlist non reconnue"
            ;;
    esac
}

# Fonction d'aide
do_help() {
    echo "Usage: pentrace <commande> [options]"
    echo "Commandes disponibles:"
    echo "  start             - Démarrer l'enregistrement"
    echo "  stop              - Arrêter l'enregistrement"
    echo "  show [--lines N]  - Afficher les dernières lignes du log"
    echo "  list-logs         - Lister tous les fichiers de logs"
    echo "  view-log <file>   - Afficher un fichier de log spécifique"
    echo "  wordlist <action> - Gérer les wordlists"
    echo "  help              - Afficher cette aide"
    echo "  version           - Afficher la version"
}

# Fonction de version
do_version() {
    echo "Pentrace v1.0.0"
}

# Traitement des arguments
case $1 in
    start)
        do_start
        ;;
    stop)
        do_stop
        ;;
    show)
        do_show "$2"
        ;;
    list-logs)
        do_list_logs
        ;;
    view-log)
        do_view_log "$2"
        ;;
    wordlist)
        do_wordlist "$2" "$3" "$4"
        ;;
    help)
        do_help
        ;;
    version)
        do_version
        ;;
    *)
        do_help
        ;;
esac
