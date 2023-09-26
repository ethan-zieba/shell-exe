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
	*)
		echo "I did not understand your request, please try again"
		;;
esac
