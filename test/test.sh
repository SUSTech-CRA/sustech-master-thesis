#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
mkdir "$SCRIPT_DIR/../public-test"

# 备份原文件
cp "$SCRIPT_DIR/../thuthesis-example.tex" "$SCRIPT_DIR/../thuthesis-example.tex.bak"

# 生成中文预览
cp "$SCRIPT_DIR/thuthesis-example-cn.tex" "$SCRIPT_DIR/../thuthesis-example.tex"
make
cp "$SCRIPT_DIR/../thuthesis-example.pdf" "$SCRIPT_DIR/../public-test/thuthesis-example-cn.pdf"

# 生成英文预览
cp "$SCRIPT_DIR/thuthesis-example-en.tex" "$SCRIPT_DIR/../thuthesis-example.tex"
make
cp "$SCRIPT_DIR/../thuthesis-example.pdf" "$SCRIPT_DIR/../public-test/thuthesis-example-en.pdf"

# 恢复源文件
mv "$SCRIPT_DIR/../thuthesis-example.tex.bak" "$SCRIPT_DIR/../thuthesis-example.tex"
