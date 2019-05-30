#!/bin/bash
#

export https_proxy=http://127.0.0.1:1080
export http_proxy=${https_proxy}
CONSTRUCTOR=~/.local/opt/miniconda3/bin/constructor
DATE=$(date +%Y.%m.%d)

sed -ie "s|version:.*$|version: $DATE|g" python[23]/construct.yaml

${CONSTRUCTOR} --platform=linux-64 --verbose python2
${CONSTRUCTOR} --platform=linux-64 --verbose python3
