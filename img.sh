#!/bin/bash

LIST=` find *.png `
mkdir work

for i in $LIST
	do
		echo image is ${i##480x854_60_00}
		cp $i ./work/${i##480x854_60_00}
	done
