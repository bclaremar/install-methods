# perl-5.22.2-install-README.md

perl/5.22.2
===========

<http://www.cpan.org/src/>

LOG
---

Following Perl's own instructions.

    VERSION=5.22.2
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/comp/perl
    mkdir ${VERSION}
    cd ${VERSION}/
    mkdir -p $CLUSTER
    mkdir -p src
    cd src
    [[ -f perl-${VERSION}.tar.gz ]] || wget http://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz
    tar xzf perl-${VERSION}.tar.gz 
    mv perl-${VERSION} perl-${VERSION}-${CLUSTER}
    cd perl-${VERSION}-${CLUSTER}
    ./Configure -des -Dusethreads -Dprefix=/sw/comp/perl/${VERSION}/${CLUSTER}
    make
    make test
    make install

Fix.

    cd ../..
    fixup -g 5.22.2

