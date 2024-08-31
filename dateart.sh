#!/bin/bash
figlet "$(hostname)@$(whoami)" -f slant

current_date=$(date +"%A, %B %d, %Y") 

figlet "$current_date" -f slant
