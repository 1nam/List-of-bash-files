#!/bin/bash
# 1nam   original script

#read -p "The Choice is yours trick or treat: " Q
#if [[ $Q == "treat" ]]
#then
#echo "Nice lil treat your shell enviroment."
#sleep 3
#set | less
#elif  [[ $Q == "trick" ]]
#then
#yes "Happy halloween!!! [CTRL]-[+]-[C] ENDS LOOP"
#sleep 3
#clear
#exit 0
#fi

# NEW 2nd option is a cleaner way updated _____________________________


#!/bin/bash
# Happy Halloween Bash Script by 1nam 👻🎃

clear
echo "👻 Welcome to the Haunted Terminal 👻"
echo
read -p "The choice is yours... trick or treat? " Q

if [[ "$Q" == "treat" ]]; then
    echo
    echo "🎁 Here's a nice little treat — your shell environment!"
    sleep 2
    set | less

elif [[ "$Q" == "trick" ]]; then
    echo
    echo "🧙‍♀️ You chose... poorly..."
    sleep 2
    # Show 'yes' spam for 5 seconds then clear screen
    timeout 5 yes "🎃 Happy Halloween!!! [CTRL]+[C] ends loop"
    sleep 1
    clear
    echo "💨 The spooky spirit has vanished..."
    exit 0

else
    echo
    echo "❓ That's not a valid choice... The spirits are confused!"
    sleep 2
fi

