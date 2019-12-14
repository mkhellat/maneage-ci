# Versions of the various dependencies
#
# Copyright (C) 2018-2019 Mohammad Akhlaghi <mohammad@akhlaghi.org>
# Copyright (C) 2019 Raul Infante-Sainz <infantesainz@gmail.com>
#
# This Makefile is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This Makefile is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
#
# A copy of the GNU General Public License is available at
# <http://www.gnu.org/licenses/>.





# Basic/low-level programs and libraires (installed in any case)
# --------------------------------------------------------------
bash-version = 5.0.11
binutils-version = 2.32
coreutils-version = 8.31
curl-version = 7.65.3
diffutils-version = 3.7
file-version = 5.36
findutils-version = 4.7.0
gawk-version = 5.0.1
gcc-version = 9.2.0
git-version = 2.23.0
gmp-version = 6.1.2
grep-version = 3.3
gzip-version = 1.10
isl-version = 0.18
libbsd-version = 0.9.1
libiconv-version = 1.16
libtool-version = 2.4.6
lzip-version= 1.20
m4-version = 1.4.18
make-version = 4.2.90
metastore-version = 1.1.2-23-fa9170b
mpc-version = 1.1.0
mpfr-version = 4.0.2
ncurses-version = 6.1
openssl-version = 1.1.1a
patchelf-version = 0.10
perl-version = 5.30.0
pkgconfig-version = 0.29.2
readline-version = 8.0
sed-version = 4.7
tar-version = 1.32
texinfo-version = 6.6
unzip-version = 6.0
wget-version = 1.20.3
which-version = 2.21
xz-version = 5.2.4
zip-version = 3.0
zlib-version = 1.2.11





# Optional/high-level programs and libraries
# ------------------------------------------
#
# These are programs and libraries that are optional, The ones in
# `reproduce/software/config/installation/TARGETS.mk' will be built as part
# of a project. To specify a software there, just remove the `-version'
# suffix from the list below.
apachelog4cxx-version = 0.10.0-603-014954db
apr-version = 1.7.0
apr-util-version = 1.6.1
astrometrynet-version = 0.77
atlas-version = 3.10.3
autoconf-version = 2.69.200-babc
automake-version = 1.16.1
bison-version = 3.4.2
boost-version = 1.71.0
cairo-version = 1.16.0
cdsclient-version = 3.84
cfitsio-version = 3.47
cmake-version = 3.15.3
eigen-version = 3.3.7
fftw-version = 3.3.8
flex-version = 2.6.4
flock-version = 0.2.3
freetype-version = 2.9
gdb-version = 8.3
ghostscript-version = 9.50
gnuastro-version = 0.11
gsl-version = 2.6
hdf5-version = 1.10.5
healpix-version = 3.50
help2man-version = 1.47.11
imagemagick-version = 7.0.8-67
imfit-version = 1.6.1
libffi-version = 3.2.1
libjpeg-version = v9b
libnsl-version = 1.2.0-4a062cf
libpng-version = 1.6.37
libtiff-version = 4.0.10
libtirpc-version = 1.1.4
libxml2-version = 2.9.9
openblas-version = 0.3.5
openmpi-version = 4.0.1
openssh-version = 8.0p1
pixman-version = 0.38.0
python-version = 3.7.4
R-version = 3.6.2
rpcsvc-proto-version = 1.4
scamp-version = 2.6.7
scons-version = 3.0.5
sextractor-version = 2.25.0
swarp-version = 2.38.0
swig-version = 3.0.12
tides-version = 2.0
yaml-version = 0.2.2





# Python packages
# ---------------
#
# Similar to optional programs and libraries above.
#
# IMPORTANT: If you intend to change the version of any of the Python
# modules/libraries below, please fix the hash strings of the respective
# URL in `reproduce/software/make/python.mk'.
asn1crypto-version = 0.24.0
asteval-version = 0.9.16
astropy-version = 3.2.1
astroquery-version = 0.3.9
beautifulsoup4-version = 4.7.1
certifi-version = 2018.11.29
cffi-version = 1.12.2
chardet-version = 3.0.4
corner-version = 2.0.1
cryptography-version = 2.6.1
cycler-version = 0.10.0
cython-version = 0.29.6
eigency-version = 1.77
emcee-version = 3.0.1
entrypoints-version = 0.3
esutil-version = 0.6.4
flake8-version = 3.7.8
future-version = 0.18.1
galsim-version = 2.2.1
h5py-version = 2.9.0
healpy-version = installed-with-healpix
html5lib-version = 1.0.1
idna-version = 2.8
jeepney-version = 0.4
keyring-version = 18.0.0
kiwisolver-version = 1.0.1
lmfit-version = 0.9.14
lsstdesccoord-version = 1.2.0
matplotlib-version = 3.1.1
mpi4py-version = 3.0.2
mpmath-version = 1.1.0
numpy-version = 1.17.2
pexpect-version = 4.7.0
pip-version = 19.0.2
pycodestyle-version = 2.5.0
pycparser-version = 2.19
pyflakes-version = 2.1.1
pybind11-version = 2.4.3
pyparsing-version = 2.3.1
pypkgconfig-version = 1.5.1
python-dateutil-version = 2.8.0
pyyaml-version = 5.1
requests-version = 2.21.0
scipy-version = 1.3.1
secretstorage-version = 3.1.1
setuptools-version = 41.6.0
setuptools_scm-version = 3.3.3
sip_tpv-version = 1.1
six-version = 1.12.0
soupsieve-version = 1.8
sympy-version = 1.4
uncertainties-version = 3.1.2
urllib3-version = 1.24.1
virtualenv-version = 16.4.0
webencodings-version = 0.5.1





# Special programs and libraries
# ------------------------------
#
# When updating the version of these libraries, please look into the build
# rule first: In one way or another, the version string becomes necessary
# during their build and must be accounted for.
#
# Special notes:
#   - `netpbm' questions in the configure steps maybe change with different
#   or new versions.

# Basic/low-level
bzip2-version = 1.0.6

# Optional/high-level
lapack-version = 3.8.0
libgit2-version = 0.28.2
netpbm-version = 10.86.99
wcslib-version = 6.4
