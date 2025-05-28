#!/bin/bash

# Source config file
source config.sh

echo -e "${BLUE}"

echo "  _____           _                       "
echo " |  __ \         | |                      "
echo " | |__) |__ _ __ | |_ _ __ __ _  ___ ___  "
echo " |  ___/ _ \ '_ \| __| '__/ _\` |/ __/ _ \ "
echo " | |  |  __/ | | | |_| | | (_| | (_|  __/ "
echo " |_|   \___|_| |_|\__|_|  \__,_|\___\___|"
echo "                                         "                                                 
echo " KNJSoft ==> https://knjsoft.pythonanywhere.com"
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
