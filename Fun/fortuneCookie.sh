#!/usr/bin/env sh

cow=$(ls /usr/share/cowsay/cows/ | sort --random-sort | head -n 1)
echo "$(fortune | cowsay -f $cow)"

