#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
mkdir "$SCRIPT_DIR/../public-test"

# 备份原文件
cp "$SCRIPT_DIR/../sustechthesis-example.tex" "$SCRIPT_DIR/../sustechthesis-example.tex.bak"

# 生成中文预览
cp "$SCRIPT_DIR/sustechthesis-example-cn.tex" "$SCRIPT_DIR/../sustechthesis-example.tex"
make
cp "$SCRIPT_DIR/../sustechthesis-example.pdf" "$SCRIPT_DIR/../public-test/sustechthesis-example-cn.pdf"

# 生成英文预览
cp "$SCRIPT_DIR/sustechthesis-example-en.tex" "$SCRIPT_DIR/../sustechthesis-example.tex"
make
cp "$SCRIPT_DIR/../sustechthesis-example.pdf" "$SCRIPT_DIR/../public-test/sustechthesis-example-en.pdf"

# 恢复源文件
mv "$SCRIPT_DIR/../sustechthesis-example.tex.bak" "$SCRIPT_DIR/../sustechthesis-example.tex"
