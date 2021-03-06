CDO/1.9.7
========================

<https://code.mpimet.mpg.de/projects/cdo>

Used under license:
GPL v2

Structure creating script (makeroom_CDO_1.9.7.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/CDO/makeroom_1.9.7.sh

LOG
---

    TOOL=CDO
    TOOLVERSION=1.9.7.1
    VERSION=${TOOLVERSION}
    cd /sw/apps
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    CLUSTER=rackham
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://code.mpimet.mpg.de/attachments/download/20542/eccodes-share.tar.gz
    tar xzf eccodes-share.tar.gz 
    wget https://code.mpimet.mpg.de/attachments/download/20124/cdo-${TOOLVERSION}.tar.gz
    tar xzf cdo-${TOOLVERSION}.tar.gz 
    cd cdo-${TOOLVERSION}/
    module purge
    module load uppmax
    module load netcdf/4.7.1
    module load hdf5/1.10.5
    module load PROJ.4/4.9.3
    module load ecCodes/2.13.1
    module load Magics/3.3.1
    ./configure --prefix=$PREFIX --with-eccodes=$ECCODES_ROOT --with-proj=$PROJ4_ROOT --with-hdf5=$HDF5_ROOT --with-netcdf=$NETCDF_ROOT --with-szlib=$SZLIB_ROOT --with-magics=$MAGICS_ROOT
    make
    make install

