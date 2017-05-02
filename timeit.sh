#!/bin/bash
# jstoddar at g mail .com
# bash only...

echoElapsedTime(){
elapsed_t=$(($2 - $1))
hr=`printf "%02d" $(($elapsed_t / 3600))`
min=`printf "%02d" $((($elapsed_t % 3600) / 60))`
sec=`printf "%02d" $(($elapsed_t % 60))`
echo "elapsed time: hr:min:sec: $hr:$min:$sec"
}

### Test and an example of use.
start_t=`date +%s`
sleep 77
end_t=`date +%s`
echoElapsedTime $start_t $end_t

