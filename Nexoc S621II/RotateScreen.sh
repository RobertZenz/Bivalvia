#!/bin/bash

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
		xinput set-prop $id "Evdev Axis Inversion" 0, 0
		xinput set-prop $id "Evdev Axes Swap" 0
	fi
	if [ $rotation -eq 1 ]; then 
		xinput set-prop $id "Evdev Axis Inversion" 1, 0
		xinput set-prop $id "Evdev Axes Swap" 1
	fi
	if [ $rotation -eq 2 ]; then 
		xinput set-prop $id "Evdev Axis Inversion" 1, 1
		xinput set-prop $id "Evdev Axes Swap" 0
	fi
	if [ $rotation -eq 3 ]; then 
		xinput set-prop $id "Evdev Axis Inversion" 0, 1
		xinput set-prop $id "Evdev Axes Swap" 1
	fi
	# Rotate the screen
	xrandr -o $rotation
fi

echo $rotation > $statefile
