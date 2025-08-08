pow()
{
    # value of A
    a=$1

    #value of B
    b=$2

    #c to count counter
    c=1

    #res to store the result
    res=1

    #
    if ((b==0));
        then
        res=1
    fi

    if ((a==0));
        then
        res=0
    fi

    if ((a >= 1 && b >= 1));
        then
            while ((c <= b ))
            do
                res=$((res * a))
                c=$((c + 1))
            done
    fi

    #Display the result
    echo "$1 to the power $2 is $res"
}

#Drive Code

#input
echo "Enter the number: "
read A
echo "Enter the power: "
read B

#Calling the pow function
pow $A $B