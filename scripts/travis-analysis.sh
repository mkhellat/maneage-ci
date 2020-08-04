#!/bin/bash

set -eu
set -o pipefail

echo
echo 'performing the analysis and building output...'
echo
./project make 1> ../output-analysis.log

# END
