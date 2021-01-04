#!/bin/bash
echo "What do you want to use todo as ? (give an alias name)"
echo "By default we will  create \"todo\" as alias name"
read n
a=$(echo $PWD | cut -d "/"  -f 3,4)
if [ -z $n ]
then
	echo "todo='~/$a/todo.sh'" >> ~/.bashrc
else
	echo "$n='~/$a/todo.sh'" >> ~/.bashrc
fi

