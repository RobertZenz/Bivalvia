#!/bin/bash

# Rough approximations
# 1024x768	32 347 3787 -4 4119
# 800x600	32 350 3786 5 4113
# 640x480	32 354 3787 -10 4122

ids=$(xinput --list | sort -r | grep "HID TOUCH HID Touch Panel" | grep -o -E "id=[0-9]+" | grep -o -E "[0-9]+")

if [ "$ids" != "" ]; then
	for id in $ids; do
		echo "TouchScreen found in id: $id"
		
		if [ "$1" == "4:3" ]; then
			xinput set-prop $id "Evdev Axis Calibration" 350 3786 5 4115
		else
			xinput set-prop $id "Evdev Axis Calibration" 0 4132 0 4135
		fi
	done
fi
