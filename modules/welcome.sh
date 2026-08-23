#!/usr/bin/env bash

clear

# Define colors
CYAN='\033[0;36m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}"
cat << "EOF"
    __  ___           __      ____        __  _____ __         
   / / / (_)___  ____/ /     / __ \____  / /_/ __(_) /__  _____
  / /_/ / / __ \/ __  /     / / / / __ \/ __/ /_/ / / _ \/ ___/
 / __  / / / / / /_/ /     / /_/ / /_/ / /_/ __/ / /  __(__  ) 
/_/ /_/_/_/ /_/\__,_/_____/_____/\____/\__/_/ /_/_/\___/____/  
                   /_____/                                     
EOF
echo -e "${NC}"

echo -e "${BLUE}::${NC} Deployment successful."
echo -e "${BLUE}::${NC} Transitioning to Zsh..."
sleep 1.5

exec zsh
