#!/bin/bash

export PATH="$PATH:/opt/eww/target/release/"

(eww daemon)

BAR=$(eww active-windows | awk -F": " '{print $1}')
if [[  $BAR ]]; then
	echo $BAR
	( eww close bar )
( echo 'may running eww window bar kikill ko'>> /tmp/eww.log 2>&1 )
(eww kill)
else
	echo $BAR
	( eww open bar )
echo 'walang running eww window bar i sstart ko'>> /tmp/eww.log 2>&1
fi

# echo 'test' >> /tmp/eww.log 2>e1
# eww >> /tmp/eww.log 2>&1
