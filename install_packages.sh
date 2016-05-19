PACKAGES="g++ python dstat htop"

for p in $(echo $PACKAGES | tr ' ' '\n'); do
    dpkg -s $p 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        sudo aptitude install $p
    fi
done
