#!/bin/bash

# Source config file
source config.sh

# Fonction pour afficher un message d'erreur et quitter
error_exit() {
    echo -e "${RED}[ERREUR]${NC} $1"
    exit 1
}

# Fonction pour afficher un message de succès
echo_success() {
    echo -e "${GREEN}[SUCCÈS]${NC} $1"
}

# Vérifier si nous avons les droits sudo
if [ "$EUID" -ne 0 ]; then 
    error_exit "Ce script doit être exécuté avec sudo"
fi

# Supprimer le binaire
if [ -f "/usr/local/bin/pt" ]; then
    rm -f /usr/local/bin/pt
    echo_success "Binaire pt supprimé"
else
    echo "Le binaire pt n'était pas présent"
fi

# Supprimer les répertoires de configuration
if [ -d "$PENTRACE_DIR" ]; then
    rm -rf "$PENTRACE_DIR"
    echo_success "Répertoire de configuration supprimé"
else
    echo "Le répertoire de configuration n'était pas présent"
fi

echo "Désinstallation terminée avec succès !"
