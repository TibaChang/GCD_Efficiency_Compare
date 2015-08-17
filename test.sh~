extension=".s"
r_extension="_result.txt"

for j in `seq 1 1 3`
do  
    
	if [ $j == 1 ]; then
		file="non_recursive_conditional_add_with_it"
		echo $file
	elif [ $j == 2 ]; then
		file="non_recursive_conditional_add_without_it"
		echo $file
	else
		file="non_recursive_count_down_loop"
		echo $file
	fi

        result_extension=
	file_asm=$file$extension
	result_extension=$file$r_extension

	result_path="../"
	result_path_place=$result_path$result_extension
	
	rm -f result.txt
	rm ./fib.s
	cp $file_asm ./fib.s
	make clean
	make fibseq

	max=41
	for i in `seq 3 1 $max`
	do
		
		yes $i | ./fibseq
		sleep 0.2
	done
	mv result.txt $result_path_place
done
