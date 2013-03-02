#!/bin/bash

# Script for getting a random text (3rd version).

# Written by Robert 'Bobby' Zenz (Robert.Zenz@gmx.at or bobby@bonsaimind.org) (http://www.bonsamind.org)

source=~/Documents/Quotes

randomFile=$(ls "$source" | sort --random-sort | head -1)
randomLine=$(cat "$source/$randomFile" | sort --random-sort | head -1)

echo $randomLine - $randomFile
