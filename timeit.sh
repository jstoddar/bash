#!/bin/bash
jstoddar at g mail .com
# bash only...

echoElapsedTime(){
now_t=`date +%s`
elapsed_t=$((`date +%s` - $start_t))
elapsed_t=3795
hr=`printf "%02d" $(($elapsed_t / 3600))`
min=`printf "%02d" $((($elapsed_t % 3600) / 60))`
sec=`printf "%02d" $(($elapsed_t % 60))`
echo "elapsed time, hour,minute,second $hr $min $sec"
}

### Test and an example of use.
start_t=`date +%s`
sleep 77
end_t=`date +%s`
echoElapsedTime $start_t $end_t

