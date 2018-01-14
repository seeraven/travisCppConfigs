#
# Install CUDA from Ubuntu Xenial repository.
#
# Version is given in CUDA variable. If left empty, this script does
# nothing. As variables are exported by this script, "source" it
# rather than executing it.
#
# Available values for the CUDA variable:
#  - CUDA=8.0.44-1
#  - CUDA=8.0.61-1
#  - CUDA=9.0.176-1
#  - CUDA=9.1.85-1
#

if [ -n "$CUDA" ]; then
    echo "Installing CUDA support"
    travis_retry sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    travis_retry wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_${CUDA}_amd64.deb
    travis_retry sudo dpkg -i cuda-repo-ubuntu1604_${CUDA}_amd64.deb
    travis_retry sudo apt-get update -qq
    export CUDA_APT=${CUDA:0:3}
    export CUDA_APT=${CUDA_APT/./-}

    travis_retry sudo apt-get install -y cuda-command-line-tools-${CUDA_APT}
    travis_retry sudo apt-get clean

    export CUDA_HOME=/usr/local/cuda-${CUDA:0:3}
    export LD_LIBRARY_PATH=${CUDA_HOME}/nvvm/lib64:${LD_LIBRARY_PATH}
    export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
    export PATH=${CUDA_HOME}/bin:${PATH}

    nvcc --version
else
    echo "CUDA is NOT installed."
fi
