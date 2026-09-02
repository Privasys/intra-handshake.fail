#!/usr/bin/env bash
# Rebuilds this folder from ../proposal: copies the three ProVerif files unchanged
# and applies changes.patch (eight added lines in tls-lib-simple.pvl, nothing else).
# Then run, as for every other folder:
#   proverif205 -lib tls-lib-simple.pvl tls13-multiagent.pv 2>&1 | tee log.txt
set -euo pipefail
cd "$(dirname "$0")"
cp ../proposal/tls-lib-simple.pvl ../proposal/tls13-multiagent.pv ../proposal/other-props.pvl .
patch -s tls-lib-simple.pvl < changes.patch
echo "proposal-tls13 rebuilt: tls-lib-simple.pvl patched, tls13-multiagent.pv and other-props.pvl identical to ../proposal"
