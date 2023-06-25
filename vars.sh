MACH=`uname -m | tr '[:upper:]' '[:lower:]'`
GOOS=`uname  | tr '[:upper:]' '[:lower:]'`
HOST=`hostname`
echo "builder MACH: $MACH"
echo "builder GOOS: $GOOS"
echo "builder HOST: $HOST"

if [[ "$1x" -eq "targetx" ]];
then
	GOOS="linux"
	MACH="arm" # "armv6l"
fi

echo "target MACH: $MACH"
echo "target GOOS: $GOOS"
echo "target HOST: $HOST"

export MACH
export GOOS
export HOST

