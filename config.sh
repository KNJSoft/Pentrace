# Configuration de Pentrace

# Répertoires principaux
PENTRACE_DIR="~/.pentrace"
LOG_DIR="$PENTRACE_DIR/logs"
WORDLIST_DIR="$PENTRACE_DIR/wordlists"
ACTIVE_WORDLIST="$WORDLIST_DIR/active"

# Répertoires supplémentaires
CONFIG_DIR="$PENTRACE_DIR/config"
DATA_DIR="$PENTRACE_DIR/data"
CACHE_DIR="$PENTRACE_DIR/cache"

# Paramètres par défaut
DEFAULT_LOG_LINES=20
DEFAULT_WORDLIST="default"

# Couleurs pour la sortie
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Messages
MSG_ERROR="${RED}[ERREUR]${NC}"
MSG_WARNING="${YELLOW}[AVERTISSEMENT]${NC}"
MSG_SUCCESS="${GREEN}[SUCCÈS]${NC}"
