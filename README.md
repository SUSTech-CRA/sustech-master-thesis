# 南方科技大学研究生毕业论文模板

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

## 模板结构

* `thusetup.tex` 示例文档基本配置（论文标题、作者等元数据）
* `thuthesis-example.tex` 示例文档主文件
* `data/` 示例文档章节具体内容
* `figures/` 示例文档图片路径
* `ref/` 示例文档参考文献目录

## 致谢
本模板基于清华大学模板 [ThuThesis v7.1](https://github.com/tuna/thuthesis/releases/tag/v7.1.0) 修改。