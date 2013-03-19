#!/bin/bash

# Launches demu with the contents of the PATH variable.
# For some reason that does not work on my Ubuntu 12.10.

# Public Domain or CC0

executables=$(echo $PATH | tr -s ':' '\n' | xargs "-I{}" find -L "{}" -type f -executable -maxdepth 1 -printf "%f\n" | sort)

toStart=$(echo "$executables" | dmenu "$@")
exec $toStart
