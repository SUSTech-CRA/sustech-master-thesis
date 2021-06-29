#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RT_DIR="$( dirname "${SCRIPT_DIR}" )"
mkdir "$RT_DIR/public-test"

# 备份原文件
cp "$RT_DIR/sustechthesis-example.tex" "$RT_DIR/sustechthesis-example.tex.bak"

# 生成中文预览
cp "$SCRIPT_DIR/sustechthesis-example-cn.tex" "$RT_DIR/sustechthesis-example.tex"
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-cn.pdf"

# 生成英文预览
cp "$SCRIPT_DIR/sustechthesis-example-en.tex" "$RT_DIR/sustechthesis-example.tex"
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-en.pdf"

# 恢复源文件
mv "$RT_DIR/sustechthesis-example.tex.bak" "$RT_DIR/sustechthesis-example.tex"
