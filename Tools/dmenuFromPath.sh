#!/bin/bash

executables=$(echo $PATH | tr -s ':' '\n' | xargs "-I{}" find -L "{}" -type f -executable -maxdepth 1 -printf "%f\n" | sort)

toStart=$(echo "$executables" | dmenu)
exec $toStart
