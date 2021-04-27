# 南方科技大学研究生毕业论文模板

## 仓库
GitHub：https://github.com/liziwl/sustech-master-thesis

Gitee镜像：https://gitee.com/liziwl/sustech-master-thesis

Mirrors of SUSTech: https://mirrors.sustech.edu.cn/github-release/SUSTech-CRA/sustech-master-thesis/

## 使用
### Windows 中编译
1. `build.bat` 构建PDF文件；
2. `clean.bat` 清理编译时生成的中间文件。

### 使用 Makefile 编译
* `make thesis`    生成论文；
* `make viewthesis` 生成论文，编译完成开启预览；
* `make all`       生成论文，与 `make thesis` 等效；
* `make clean`     删除示例文件的中间文件（不含 thuthesis-example.pdf）；
* `make cleanall`  删除示例文件的中间文件和 thuthesis-example.pdf；
* `make distclean` 删除示例文件和模板的所有中间文件和 PDF。

### 使用 LaTex 在线编辑器
* 使用 [Overleaf](https://www.overleaf.com/)（需要科学上网保证稳定使用），上传 zip 压缩包后，更改编译器为 `XeLaTex`
* 使用 南科大[ShareLaTex](https://sharelatex.cra.moe/)，使用方式与Overleaf相同，上传 zip 压缩包后，更改编译器为 `XeLaTex`，并在主文档的头部 `\documentclass[degree=master,language=english,fontset=fandol]` 设置 `fontset` 参数 为 `fandol`.
* 在线预览样例文章：
  * [Overleaf](https://www.overleaf.com/): [https://www.overleaf.com/read/dmkfydkmbbwh](https://www.overleaf.com/read/dmkfydkmbbwh)
  * 南科大[ShareLaTex](https://sharelatex.cra.moe/): [https://sharelatex.sustcra.com/read/bxzyxckdzqqy](https://sharelatex.sustcra.com/read/bxzyxckdzqqy)


### 编译前的建议

1. 在撰写论文时，我们不推荐使用原有的 `thuthesis-example.tex` 这一名称。建议将其复制一份，改为其他的名字(如 `thesis.tex` 或者 `main.tex`)。需要注意，如果使用了来 自 `data` 目录中的 `tex` 文件，则重命名主文件后，其顶端的 `!TeX root` 选项也需要相应修改。
2. 需要注意，如果更改了主文件的名称，则需要修改 `Makefile` 顶端的 `THESIS` 变量定义；或修改 `build.bat` 和 `clean.bat` 中 `latexmk` 命令后的参数。
3. ⚠️ 提交最终正式版本时，建议在 Windows 下本地编译且设置 `fontset` 参数 为 `windows`，以保证字体正确。

## 模板结构

### 文档内容
* `thusetup.tex` 示例文档基本配置（论文标题、作者等元数据）
* `thuthesis-example.tex` 示例文档主文件
* `data/` 示例文档章节具体内容
* `figures/` 示例文档图片路径
* `ref/` 示例文档参考文献目录

### 样式控制
* `thuthesis.cls` 模板类文件
* `thuthesis-*.bst` BIBTEX 参考文献表样式文件
* `thuthesis-*.bbx` BibLaTeX 参考文献表样式文件
* `thuthesis-*.cbx` BibLaTeX 参考文献引用样式文件

### 编译脚本
* `Makefile` Makefile
* `latexmkrc` latexmk 配置文件
* `README.md` Readme

## 反馈与QA

1. 南科大LaTex学习交流群：119667812
2. 提交 GitHub Issue

## 致谢
本模板基于清华大学模板 [ThuThesis v7.1](https://github.com/tuna/thuthesis/releases/tag/v7.1.0) 修改。
