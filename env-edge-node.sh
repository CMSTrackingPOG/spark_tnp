echo "Sourcing environment for hadoop edge node..."

LCG_RELEASE=LCG_97apython3
LCG_ARCH=x86_64-centos7-gcc8
source /cvmfs/sft.cern.ch/lcg/views/${LCG_RELEASE}/${LCG_ARCH}-opt/setup.sh
source hadoop-setconf.sh analytix

if [ ! -f RooCMSShape_cc.so ]; then
	echo ""
	echo "Did not detect a RooCMSShape shared object file. Compiling with ACLiC... (should be needed only once)"
	root -l -b -q -e '.L RooCMSShape.cc+'
	echo "Done!"
fi
