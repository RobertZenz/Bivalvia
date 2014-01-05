#!/usr/bin/env bash

# A simple stack of some sorts.
# Public Domain or CC0

# Usage: ./genPassWiki.sh WORDS_MINIMUM_LENGTH COUNT SET

default="default"
stacks="$HOME/.stacks"
timestampFormat="%c"


if [ ! -d "$stacks" ]; then
	mkdir -p "$stacks"
fi

stack="$stacks/$default"
command=$1

if [ ! -f "$stack" ]; then
	touch "$stack"
fi

case "$command" in
	list|--list|-l)
		tac "$stack"
		;;
	push|--push|-u)
		echo $(date +$timestampFormat) $2 >> "$stack"
		tac "$stack"
		;;
	pop|--pop|-o)
		tail -n 1 "$stack"
		sed -i "$ d" "$stack"
		;;
	clear|--clear|-c)
		echo -n > "$stack"
		;;
	*)
		echo "
stack.sh COMMAND [ITEM]
  -u, --push, push    Push an item onto the stack.
  -o, --pop, pop      Pop an item from the stack.
  -c, --clear, clear  Clear the whole stack."
		;;
esac

