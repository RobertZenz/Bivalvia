#!/usr/bin/env sh

# Displays some color information
# Usage: ./colorTable.sh [ICON]

# Public Domain or CC0

# Text Color
TC_BLACK='\e[30m'
TC_RED='\e[31m'
TC_GREEN='\e[32m'
TC_YELLOW='\e[33m'
TC_BLUE='\e[34m'
TC_PURPLE='\e[35m'
TC_CYAN='\e[36m'
TC_WHITE='\e[37m'

# Background Color
BC_BLACK='\e[40m'
BC_RED='\e[41m'
BC_GREEN='\e[42m'
BC_YELLOW='\e[43m'
BC_BLUE='\e[44m'
BC_PURPLE='\e[45m'
BC_CYAN='\e[46m'
BC_WHITE='\e[47m'

# Text Bold
T_B='\e[1m'

# Text Underline
T_U='\e[4m'

# Text Color Reset
T_RESET='\e[0m'

ICON=●

if [ ! -z "$1" ]; then
	ICON=$1
fi

echo -e "
Default    Black    Red      Green    Yellow   Blue     Purple   Cyan     White
Black     ${BC_BLACK}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Red       ${BC_RED}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Green     ${BC_GREEN}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Yellow    ${BC_YELLOW}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Blue      ${BC_BLUE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Purple    ${BC_PURPLE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Cyan      ${BC_CYAN}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
White     ${BC_WHITE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}

${T_B}Modified${T_RESET}   Black    Red      Green    Yellow   Blue     Purple   Cyan     White
Black     ${T_B}${BC_BLACK}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Red       ${T_B}${BC_RED}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Green     ${T_B}${BC_GREEN}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Yellow    ${T_B}${BC_YELLOW}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Blue      ${T_B}${BC_BLUE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Purple    ${T_B}${BC_PURPLE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
Cyan      ${T_B}${BC_CYAN}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
White     ${T_B}${BC_WHITE}   ${TC_BLACK}${ICON}        ${TC_RED}${ICON}        ${TC_GREEN}${ICON}        ${TC_YELLOW}${ICON}        ${TC_BLUE}${ICON}        ${TC_PURPLE}${ICON}        ${TC_CYAN}${ICON}        ${TC_WHITE}${ICON}   ${T_RESET}
"
