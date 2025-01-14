#!/bin/bash
#

CONSTRUCTOR=~/.local/opt/anaconda3-plus/bin/constructor

function build_for_arch() {
  local pkg=$1
  local platform=$2
  local date=$(date +%Y.%-m.%-d)
  sed -i "s|version:.*$|version: $date|g" "${pkg}/construct.yaml"
  ${CONSTRUCTOR} "$pkg"
}

# build_for_arch miniconda3-plus linux-64
# build_for_arch mesalib-dev linux-64
# build_for_arch miniconda3-plus linux-aarch64
build_for_arch anaconda3-plus linux-64
# build_for_arch cctbx linux-64
# build_for_arch anaconda3-plus linux-aarch64
# build_for_arch code_tools linux-64
# build_for_arch bear linux-64
