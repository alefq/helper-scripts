#!/bin/bash
HS_HOME=/opt/helper-scripts
cd $HS_HOME/conf
TODAY="`date +%F`"
TASKS_FILE="$1"
IFS='|' 
while read email task
do
        OUT="$(mktemp)"
        echo "Tareas de la fecha: $TODAY" >> $OUT
        echo email: $email task: $task
        OLD_IFS=$IFS
        IFS=";"
        for t in $task; do 
                echo "task: $t"
                echo "$t" >> $OUT
        done
        IFS=$OLD_IFS
        mail -s "Recordatorio de tareas: $TODAY" $email < $OUT
        cat $OUT
        rm -v $OUT
done < $TASKS_FILE

