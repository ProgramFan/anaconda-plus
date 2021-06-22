#!/bin/bash
#

# export https_proxy=http://127.0.0.1:1080
# export http_proxy=${https_proxy}
CONSTRUCTOR=~/.local/opt/anaconda3-plus/bin/constructor

function build_for_arch() {
  local pkg=$1
  local platform=$2
  local date=$(date +%Y.%m.%d)
  gsed -ie "s|version:.*$|version: $date|g" "${pkg}/construct.yaml"
  ${CONSTRUCTOR} --conda-exe "standalone-conda/conda-${platform}.exe" \
    "--platform=${platform}" --verbose "$pkg"
}

build_for_arch miniconda3-plus linux-64
build_for_arch miniconda3-plus linux-aarch64
build_for_arch anaconda3-plus linux-64
# build_for_arch anaconda3-plus linux-aarch64
