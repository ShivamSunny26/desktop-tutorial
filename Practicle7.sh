printf "Enter num of Rows: "
read rows
for ((i=0;i<=rows;i++))
    do
        for((j=1;j<=i;j++))
        do
            printf "* "
        done
        printf "\n"
    done