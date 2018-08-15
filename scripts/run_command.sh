#!/bin/bash
cd /user-dir
$@
FOR_100_YEARS=$((100*365*24*60*60));while true;do sleep $FOR_100_YEARS;done
