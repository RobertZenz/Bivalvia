#!/bin/bash

function setProperties() {
	xinput set-prop $1 "Evdev Axis Inversion" $2, $3
	xinput set-prop $1 "Evdev Axes Swap" $4
}


statefile=~/.screenRotation

rotation=0

if [ -z "$1" ]; then
	if [ -e $statefile ]; then
		rotation=$(cat $statefile) 
	fi

	let rotation=rotation+1

	if [ $rotation -gt 3 ]; then
		let rotation=0
	fi
else
	let rotation=$1
fi

id=$(xinput --list | sort -r | grep -m 1 "HID TOUCH HID Touch Panel" | grep -Eo "id=[0-9]+" | grep -Eo "[0-9]+")

echo "TouchScreen found in id: $id"

if [ "$id" != "" ]; then
	# Rotate the touchpad
	# synclient Orientation=$rotation

	# Rotate the touchscreen
	if [ $rotation -eq 0 ]; then
		setProperties $id 0 0 0
	elif [ $rotation -eq 1 ]; then
		setProperties $id 1 0 1
	elif [ $rotation -eq 2 ]; then
		setProperties $id 1 1 0
	elif [ $rotation -eq 3 ]; then
		setProperties $id 0 1 1
	fi
	
	# Rotate the screen
	xrandr --orientation $rotation
fi

echo $rotation > $statefile
