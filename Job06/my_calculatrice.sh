# Instead of creating an if condition, we use a case, 
# which is equivalent to using if and elif for every case
case $2 in
	+)
		echo "Result: $(($1 + $3))"
		;;
	-)
		echo "Result: $(($1 - $3))"
		;;
	x)
		echo "Result: $(($1 * $3))"
		;;
	÷)
		echo "Result $(($1/$3))"
		;;

# Here we anticipate if the S2 input is not an operator
	*)
		echo "I did not understand your request, please try again"
		;;
esac
