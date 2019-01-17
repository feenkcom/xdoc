#/bin/sh!
set -o xtrace
echo $DISPLAY
export DISPLAY=:99.0
./pharo Pharo.image examples --junit-xml-output Xd.*
exit 0
