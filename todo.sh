#!/bin/bash
a=$1
file=todolist.txt
dy=$(date +'%d/%m/%Y')
if [ -f "$file" ]
then
	n=$(cat $file | wc -l)
else
	n=0
fi
if [ -z $a ]
then
	echo "Usage:-"
	echo "$ ./todo add \"todo item\" # Add a new todo"
	echo "$ ./todo ls 		 # Show remainig todos"
	echo "$ ./todo del NUMBER	 # Delete a todo"
	echo "$ ./todo done NUMBER	 # Complete a todo"
	echo "$ ./todo help		 # Show usage"
	echo "$ ./todo report		 # Statistics"
elif [ $a == add ]
then
	n=$(($n+1))
	echo "[$n] $2" >> todolist.txt
	echo "Added todo:\"$2\" "
elif [ $a == ls ]
then
	cat todolist.txt
elif [ $a == del ]
then
	grep -v $2 todolist.txt > list.txt
	cat list.txt > todolist.txt
	rm list.txt
	echo "task number $2 has been deleted"
elif [ $a == "done" ]
then
	grep $2 todolist.txt >> complist.txt
	echo "Marked todo # $2 as done"
	grep -v $2 todolist.txt > list.txt
        cat list.txt > todolist.txt
        rm list.txt
elif [ $a == report ]
then
	pend=$(cat todolist.txt | wc -l)
	comp=$(cat complist.txt | wc -l)
	echo "$dy Pending : $pend Completed : $comp"
elif [ $a == help ]
then
	./todo.sh
else
	echo "error in processing"
	echo "type todo help to check out the help menu"
fi

