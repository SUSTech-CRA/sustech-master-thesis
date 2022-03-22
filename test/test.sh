#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RT_DIR="$( dirname "${SCRIPT_DIR}" )"
mkdir "$RT_DIR/public-test"

# 备份原文件
cp "$RT_DIR/sustechthesis-example.tex" "$RT_DIR/sustechthesis-example.tex.bak"

# 生成中文预览
cp "$RT_DIR/sustechthesis-example.tex.bak" "$RT_DIR/sustechthesis-example.tex"
python3 "$RT_DIR/test/test-files.py" --recipe 1
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-cn.pdf"

# 生成英文预览
cp "$RT_DIR/sustechthesis-example.tex.bak" "$RT_DIR/sustechthesis-example.tex"
python3 "$RT_DIR/test/test-files.py" --recipe 2
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-en.pdf"

# 生成biber预览
cp "$RT_DIR/sustechthesis-example.tex.bak" "$RT_DIR/sustechthesis-example.tex"
python3 "$RT_DIR/test/test-files.py" --recipe 3
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-biber.pdf"

# 恢复源文件
mv "$RT_DIR/sustechthesis-example.tex.bak" "$RT_DIR/sustechthesis-example.tex"
