nm="\e[0m"
rows=$(tput lines)
cols=$(tput cols)
n=0
i=0

# Basically generates 4 different kinds of patterns
# Depending on where things areI d
rng=$(( RANDOM % 2))
if [ $rng -eq 0 ] ; then
    r0=$rows
    r1=$cols
else
    r0=$cols
    r1=$rows
fi
rng=$(( RANDOM % 2))


# 226 is the amount of interesting colours and
# -50 makes it so it doesn't overflow
# Prints lines for the amount of rows (height) of terminal

if [ $rng -eq 0 ] ; then
    clrbg=$(( RANDOM % (226 - 20) ))
fi

ot=0
if [ $rng -eq 0 ] ; then
    ot=$(( RANDOM % 6 ))
    flop=true
fi


while [ $n -lt $r0 ] ; do

    if [ $rng -eq 1 ] ; then
        clrbg=$(( RANDOM % (226) ))
    fi

    if [ $rng -eq 0 ] ; then
        if [ $clrbg -gt 220 ] ; then
            flop=false
        else if [ $clrbg -lt 6 ] ; then
            flop=true
        fi
        fi
    fi

    if [ flop ] ; then
        clrbg=$(( $clrbg + $ot ))
    else
        clrbg=$(( $clrbg - $ot ))
    fi

    # Prints spaces for each column of the terminal
    while [ $i -lt $r1 ] ; do

        if [ $i -lt $(($cols / 2)) ] ; then
                cl="\e[48;5;$((${i} + ${clrbg}))m"
                echo -en "${cl} ${nm}";
            else
                cl="\e[48;5;$(( $(( $cols - $i)) + ${clrbg}))m"
                echo -en "${cl} ${nm}";
        fi
        i=$((i+1));
        done ;
    n=$((n+1));
    i=0
done ;
