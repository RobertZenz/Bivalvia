#!/bin/bash

ids=$(xinput --list | sort -r | grep "HID TOUCH HID Touch Panel" | grep -o -E "id=[0-9]+" | grep -o -E "[0-9]+")

if [ "$ids" != "" ]; then
	for id in $ids; do
		echo "TouchScreen found in id: $id"
		xinput set-prop $id "Evdev Axis Calibration" 0 4132 0 4135
	done
fi
