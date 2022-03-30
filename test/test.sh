#!/bin/zsh
set -x

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
RT_DIR="$( dirname "${SCRIPT_DIR}" )"
mkdir "$RT_DIR/public-test"

# 生成中文预览
python3 "$RT_DIR/test/test-files.py" --recipe 1
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-cn.pdf"
python3 "$RT_DIR/test/test-files.py" --recipe 1 --undo

# 生成英文预览
python3 "$RT_DIR/test/test-files.py" --recipe 2
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-en.pdf"
python3 "$RT_DIR/test/test-files.py" --recipe 2 --undo

# 生成biber预览
python3 "$RT_DIR/test/test-files.py" --recipe 3
make
cp "$RT_DIR/sustechthesis-example.pdf" "$RT_DIR/public-test/sustechthesis-example-biber.pdf"
python3 "$RT_DIR/test/test-files.py" --recipe 3 --undo
