#/bin/bash 
kernelStartTime=`sysctl -n kern.boottime | cut -d' ' -f 4 | tr -d ,`
actualTime=`date +%s`
upTime=`expr $actualTime - $kernelStartTime`
echo $upTime | awk '{printf("%dd %02dh %02dm |",($1/60/60/24),($1/60/60%24),($1/60%60))}'
