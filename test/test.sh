#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
mkdir "$SCRIPT_DIR/../public-test"

cp "$SCRIPT_DIR/thuthesis-example-cn.tex" "$SCRIPT_DIR/../thuthesis-example.tex"
make
cp "$SCRIPT_DIR/../thuthesis-example.pdf" "$SCRIPT_DIR/../public-test/thuthesis-example-cn.pdf"


cp "$SCRIPT_DIR/thuthesis-example-en.tex" "$SCRIPT_DIR/../thuthesis-example.tex"
make
cp "$SCRIPT_DIR/../thuthesis-example.pdf" "$SCRIPT_DIR/../public-test/thuthesis-example-en.pdf"
