#!/bin/bash
# Name: _slSh.sh
# Purpose: sl bash script
# -----------------------

# region welcome

echo "_slsh"; echo "༂࿐~ +strange easy world"; echo;

# regionend

# region function

trap _trap SIGINT;
function _trap() {
	exit; # exit the app (on next run) pressing <<ctrl><c>>
}

function _math() {
	local _value1=$1;
	local _operation=$2;
	local _value2=$3;
	local _scale=$4;
	local _output=`bc -l <<< "scale=$_scale; $_value1 $_operation $_value2"`;
	echo "$_output";
}

function _sl() {
	local _arg1=$1;
	if [[ $_arg1 == "b" ]];
	then
		echo sl;
	else
		echo sl -l;
	fi
}

# regionend

# region input

_arg1=$1;
read -rp "Press / <any key> for [infinite] / <l/L> for [loop]: " "_choice";

# regionend

# region execute

if [[ $_choice == "l" || $_choice == "L" ]];
then
	read -rp "Put loop count: " "_loopcount"; echo;
	_a=0;
	while [[ $_a -lt $_loopcount ]]
	do
		_a=`_math $_a '+' 1 0`;
		`_sl $_arg1`;
	done
else
	while : ; do
		`_sl $_arg1`;
	done
fi

# regionend

# region testing

	# attested start
# 	_value1=100.12;
# 	_value2=3;
# 	_scale=3;
#
# 	_total=$(_math $(_math $_value1 '*' $_value2 $_scale) '/' 20 $_scale);
# 	echo "[Sample _math function] ($_value1 * $_value2) / 20 = $_total"; echo;
	# attested end

# regionend
