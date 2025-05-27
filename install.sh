#!/bin/bash

# Source config file
source config.sh

echo -e "\033[0;34m"
echo "  ____  _            _     _____ _           _     _       "
echo " / ___|| |_ __ _ ___| |__ |  ___| |__   ___ | |__ (_)_ __  "
echo " \___ \| __/ _\` |/ __| '_ \| |_  | '_ \ / _ \| '_ \| | '_ \ "
echo "  ___) | || (_| | (__| | | |  _| | |_) | (_) | |_) | | | | "
echo " |____/ \__\__,_|\___|_| |_|_|   |_.__/ \___/|_.__/|_|_| |_|"
echo "\KNJSoft ==> https://knjsoft.pythonanywhere.com"
echo ""
echo "Pentrace Installation Script"
echo "==========================="
echo ""
echo "Ce script va installer Pentrace sur votre système."
echo ""
echo -e "\033[0;33mVeuillez noter que ce script nécessite des droits sudo.\033[0m"
echo ""

# Fonction pour afficher un message d'erreur et quitter
error_exit() {
    echo -e "\033[0;31m[ERREUR]\033[0m $1"
    exit 1
}

# Fonction pour afficher un message de succès
echo_success() {
    echo -e "\033[0;32m[SUCCÈS]\033[0m $1"
}

# Vérifier si nous avons les droits sudo
if [ "$EUID" -ne 0 ]; then 
    error_exit "Ce script doit être exécuté avec sudo"
fi

# Vérifier si le fichier pentrace.sh existe
if [ ! -f "pentrace.sh" ]; then
    error_exit "Le fichier pentrace.sh n'est pas présent dans le répertoire courant"
fi

# Vérifier si le fichier config.sh existe
if [ ! -f "config.sh" ]; then
    error_exit "Le fichier config.sh n'est pas présent dans le répertoire courant"
fi

# Créer le répertoire de configuration
# mkdir -p ~/.pentrace/{logs,wordlists}
mkdir -p "$WORDLIST_DIR"
mkdir -p "$LOG_DIR"

# Installer le binaire
cp pentrace.sh /usr/local/bin/pt
chmod +x /usr/local/bin/pt

# Créer la wordlist par défaut
touch "$WORDLIST_DIR/default"
ln -sf "$WORDLIST_DIR/default" "$ACTIVE_WORDLIST"

echo_success "Installation terminée avec succès !"
echo "Vous pouvez maintenant utiliser Pentrace avec la commande 'pt'"
echo "Pour voir l'aide, utilisez : pt help"
