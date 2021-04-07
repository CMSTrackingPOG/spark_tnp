echo "Sourcing environment for lxplus node..."

LCG_RELEASE=LCG_97apython3
LCG_ARCH=x86_64-centos7-gcc8
source /cvmfs/sft.cern.ch/lcg/views/${LCG_RELEASE}/${LCG_ARCH}-opt/setup.sh
source /cvmfs/sft.cern.ch/lcg/etc/hadoop-confext/hadoop-swan-setconf.sh analytix

if [ ! -f RooCMSShape_cc.so ]; then
	echo ""
	echo "Did not detect a RooCMSShape shared object file. Compiling with ACLiC... (should be needed only once)"
	root -l -b -q -e '.L RooCMSShape.cc+'
	echo "Done!"
fi
