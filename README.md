# 南方科技大学研究生学位论文模板 sustechthesis

[![Actions Status](https://github.com/SUSTech-CRA/sustech-master-thesis/actions/workflows/verify-compile.yml/badge.svg)](https://github.com/SUSTech-CRA/sustech-master-thesis/actions/workflows/verify-compile.yml)
[![GitHub downloads](https://img.shields.io/github/downloads/SUSTech-CRA/sustech-master-thesis/total)](https://github.com/SUSTech-CRA/sustech-master-thesis/releases)
[![Download Analysis](https://img.shields.io/badge/Download-Analysis-blue.svg)](https://qii404.me/github-release-statistics/?repo=/SUSTech-CRA/sustech-master-thesis/)
[![GitHub commits](https://img.shields.io/github/commits-since/SUSTech-CRA/sustech-master-thesis/latest)](https://github.com/SUSTech-CRA/sustech-master-thesis/commits/master)
[![GitHub release](https://img.shields.io/github/v/release/SUSTech-CRA/sustech-master-thesis?&label=%E5%8F%91%E5%B8%83%E7%89%88)](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/latest)
[![GitHub pre-release](https://img.shields.io/github/v/release/SUSTech-CRA/sustech-master-thesis?include_prereleases&label=%E5%BC%80%E5%8F%91%E7%89%88-%E9%A2%84%E6%9E%84%E5%BB%BA)](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/tag/dev-latest)

## 下载

推荐下载 **[发布版](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/latest)** 模板或 **[开发版-预构建](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/tag/dev-latest)** 的模版，里面包括模板使用说明以及示例文档：

* 模板使用说明（**sustechthesis.pdf**）*本模版使用说明尚不完善，仅供参考。主要功能在 `sustech-setup.tex` 示例文档基本配置文件中已经进行注释。*
* 学位论文示例文档（**sustechthesis-example.tex**）
* 报告示例文档（**sustechthesis-example-report.tex**），包括开题报告，年度考核报告

**发布版** 包含预生成的 `cls` 模版类文件和文档。**发布版** 一般会比 **开发版-预构建** 晚更新。如急需使用最新版可以使用 **开发版-预构建** 的版本。

开发版仅供开发者与需要尚未发布的功能的有经验的 TeX 用户使用，不提供任何保证。

下载途径：

* 发布版：
  * [GitHub Releases](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/latest)：最新发布版的获取途径。
  * [SUSTech 镜像站](https://mirrors.sustech.edu.cn/github-release/SUSTech-CRA/sustech-master-thesis/)：GitHub Releases 的镜像。
* 开发版：
  * [预构建 Dev Build](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/tag/dev-latest)：最新预构建的获取途径，根据开发版 master 分支构建。
  * [GitHub](https://github.com/SUSTech-CRA/sustech-master-thesis)：在 Github 上托管的源码。
  * [SUSTech-Git](https://mirrors.sustech.edu.cn/git/liziwl/sustech-master-thesis)：在南方科技大学校内 Git 服务上托管的源码。

## 更新日志

每个版本的详细更新日志，请见 [CHANGELOG.md](CHANGELOG.md)。模板使用说明（sustechthesis.pdf）中也包含了这一内容。

## 升级
### 发布版

下载发布版的的 zip 包，复制其中的 `sustechthesis.*` 开头的文件，覆盖现有项目内的旧文件即可（必须包括 `dtx`, `ins`, `cls`）。

### 开发版

从 GitHub clone 项目源码或者下载源码 zip 包，执行命令（Windows 用户在文件夹空白处按 `Shift + 鼠标右键`，点击“在此处打开命令行窗口”）：

```shell
xetex sustechthesis.ins
```

即可得到 `sustechthesis.cls` 等模板文件。

## 反馈与QA

在你遇到模板问题时，请遵守以下步骤：

1. 在 [CHANGELOG.md](CHANGELOG.md) 查看该问题是否已经修复但未发布；
   * 若是，则可以使用仓库中的[预构建的开发版](https://github.com/SUSTech-CRA/sustech-master-thesis/releases/tag/dev-latest)解决问题
2. 在 [GitHub Issue](https://github.com/SUSTech-CRA/sustech-master-thesis/issues) 中搜索该问题的关键词；
3. 在你确定这是一个新问题时：
   * 对于模板 bug、请求新功能、文档笔误等提出新 [issue](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/new/choose)
4. 如果导师或院系有额外要求，请一同附上要求原文或格式（如《撰写规范》）截图。

* 南科大研究生模板反馈群：320971126
* 南科大LaTeX学习交流群：119667812

## 相关资料

- [模板操作指南视频教程（Bilibili）](https://www.bilibili.com/video/BV1JU4y1g7bH)
  - P1: LaTeX 写作模版获取，时长03:18
  - P2: Overleaf 写作实操指南，时长39:33
  - P3: LaTeX 入门及本地环境搭建指南，时长07:58
- [模板使用培训材料（PDF）](https://github.com/SUSTech-CRA/latex-talk-master)

## 使用

### 使用 [VSCode](https://code.visualstudio.com/) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
1. 本项目内已经内置 VSCode 项目配置：
   1. `latexmk for sustechthesis` 同下使用 `latexmk` 生成学位论文示例文档 sustechthesis-example.pdf；
   2. `build cls (sustechthesis style file)` 同上生成 cls 文件的命令，仅供开发者使用。**发布版** 或 **开发版-预构建** 已包含 cls文件，无需自行生成。

### Windows 中编译，使用 `latexmk`
1. `latexmk sustechthesis-example.tex` 生成学位论文示例文档 sustechthesis-example.pdf；
2. `latexmk sustechthesis-example-report.tex` 生成报告示例文档 sustechthesis-example-report.pdf；
3. `latexmk sustechthesis.dtx` 生成说明文档 sustechthesis.pdf；
4. `latexmk -c` 清理编译生成的辅助文件；

### 使用 Makefile 编译
* `make thesis`     生成论文；
* `make report`     生成报告；
* `make all`        生成论文，与 `make thesis` 等效；
* `make clean`      删除示例文件的中间文件（不含 pdf）；
* `make cleanall`   删除示例文件的中间文件和 pdf；
* `make wordcount`  论文字数统计。
* `make doc`     生成文档；
* `make cls`        仅生成 cls 模版类文件；

### 使用 Docker 编译
1. 进入 Docker 容器内交互
   * `docker run -it --rm -v "$(pwd)":/thesis -w /thesis texlive/texlive:latest bash`
2. 回到前一种模式，使用 Makefile 编译

### 使用 LaTex 在线编辑器
* 使用 [Overleaf](https://www.overleaf.com/)（需要科学上网保证稳定使用），上传 zip 压缩包后，更改编译器为 `XeLaTeX`
* 使用 [南科大 ShareLaTex](https://sharelatex.cra.moe/)，使用方式与Overleaf相同，上传 zip 压缩包后，更改编译器为 `XeLaTeX`，并在主文档的头部 `\documentclass[degree=master,language=english,cjk-font=external]` 设置 `cjk-font` 参数 为 `external`.


### 编译前的建议

1. 在撰写论文时，我们不推荐使用原有的 `sustechthesis-example.tex` 这一名称。建议将其复制一份，改为其他的名字(如 `thesis.tex` 或者 `main.tex`)。需要注意，如果使用了来 自 `data` 目录中的 `tex` 文件，则重命名主文件后，其顶端的 `!TeX root` 选项也需要相应修改。
2. 需要注意，如果更改了主文件的名称，则需要修改 `Makefile` 顶端的 `THESIS` 变量定义；或修改 `latexmk` 命令后的参数。
3. 如果出现中文字体找不到的编译错误或期望与 Windows 下编译的字体一致，可以设置 `font` 和 `cjk-font` 参数 为 `external`，导入包内字体。
4. ⚠️ 提交最终正式版本时，需要确保所有字体选择正确且被正确嵌入，以满足《规定》：
   * Windows 中无需特别设定。其他系统（包括在线编辑器）设置 `font` 和 `cjk-font` 参数 为 `external`。

## 模板结构

### 文档内容
* `sustech-setup.tex` 示例文档基本配置（论文标题、作者等元数据）
* `sustechthesis-example.tex` 学位论文示例文档
* `sustechthesis-example-report.tex` 报告示例文档，包括开题报告，年度考核报告
* `data/` 示例文档章节具体内容
* `figures/` 示例文档图片路径
* `ref/` 示例文档参考文献目录

### 样式控制
* `sustechthesis.cls` 模板类文件，由同名 dtx 文件和 ins 文件生成（开发版不含，运行时生成）
* `sustechthesis-*.bst` BIBTEX 参考文献表样式文件

### 编译脚本
* `Makefile` Makefile
* `latexmkrc` latexmk 配置文件
* `README.md` Readme

## 致谢

* 本模板基于清华大学模板 [ThuThesis v7.1.0](https://github.com/tuna/thuthesis/releases/tag/v7.1.0) 修改。
* 本模版根据南方科技大学研究生院发布的相关 [《研究生学位论文写作指南》](https://gs.sustech.edu.cn/#/common/index?current_id=9&id=161&article_id=19) 编写，如有冲突以官网规定为准。
  * 如果范例中存在与《写作指南》中的规定不符之处，以《写作指南》中的文字叙述为准。
