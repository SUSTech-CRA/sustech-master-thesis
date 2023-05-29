# Changelog

此处记载了 SUSTechThesis 中所有值得留意的改动，格式参照 [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)。

点击版本号即可在 GitHub 上查看相邻版本间的代码变动。

Changelog 维护应保持最新版本在文件上面的原则，日期格式按照 ISO 8601 的标准: `YYYY-MM-DD`.

#### 变更分类：*major*, *minor*, *bug-fix*。

#### *major* release trigger:

- `Changed`：现有功能变更。
- `Removed`：现有功能移除。

#### *minor* release trigger:

- `Added`：引入新功能。
- `Deprecated`：标记即将被删除的功能。

#### *bug-fix* release trigger:

- `Fixed`：错误修复。
- `Security`：安全漏洞修复。

#### 使用提示

- 未发布版本使用形如 "`[Unreleased]`" 作为二级标题，
- 预发布版本使用形如 "`[1.0.2-rc.1] - 2021-06-11`" 作为二级标题，
- 正式发布版本使用形如 "`[1.0.1] - 2020-07-25`" 作为二级标题。
## [Unreleased](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.19...HEAD) - 2023-05-29
### Fixed:
- 原创性声明扫描件单面打印，即前后留空白页。

## [1.3.19](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.18...v1.3.19) - 2023-05-06
### Changed
- 添加加载外部英文字体选项，改善 Unix 系统下的英文字体编译。
- 添加加载TeX Gyre Termes Math 数学字体选项，以TeX克隆版满足Times New Roman的数学字体选项要求。
- 同步上游文献样式更新。
- 增加伪代码样例。

### Added
- 增加 Docker 编译指引。

### Fixed:
- 中文目录的Abstract改回加粗。 

## [1.3.18](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.17...v1.3.18) - 2022-09-07
### Changed
- 手动修改了模板denotation条目顺序并提醒用户手动排序， 该功能因上下标过于复杂等无法兼容暂未实现自动。
- 移除行中引用。
- 修复英文statementcopyright的错误。
- 中英文大表格样式修改。
- 学术成果变为必须列出。

## [1.3.17](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.16...v1.3.17) - 2022-09-02
### Changed
- 引用标记全改为上标格式， 废弃行内格式。
- 论文主要语言为中文时， 取消英文Abstract的加粗。
- 题名页中学术型使用“学科名称”， 对应英文用“Discipline”；专硕使用“专业类别”， 对应英文“Category”。


## [1.3.16](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.15...v1.3.16) - 2022-06-20
### Changed
- 更新授权声明，放弃阅读器直接勾选的方式，修复v1.3.15的实现的错误。

## [1.3.15](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.14...v1.3.15) - 2022-06-05

### Added
- 加入开题报告，年度考核报告的样式。

### Changed
- 更新授权声明，实现阅读器直接勾选。
- 正文统一不同操作系统中等宽字体默认值 Courier New。

## [1.3.14](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.13...v1.3.14) - 2022-05-16

### Changed
- 允许论文题目和章节题目出现特殊的小写字母（[#53](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/53)）。
- 同步上游关于图表距离的修复，浮动对象整体上下距离调整为12bp（[#54](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/54)）。
- 移除中文下数学定理、证明环境里中文冒号后多余空格。
- 更换单元格类型符号，减少一个warning。
- 插图清单，表格清单按照 label 对齐（[#57](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/57)）。
- 目录每级取消悬挂缩进（[#58](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/58)）。

## [1.3.13](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.12...v1.3.13) - 2022-04-12
### Added
- 增加数学字体配置选项 math-style（[#49](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/49)）。
- 增加公式符号解释的例子。
- 添加合并单元格的三线表的例子。

### Changed
- 修改全局的图题距离。
- 全局移除列表第一级序号后空格。
- 加粗英文的定理环境前缀和编号（[#51](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/51)）。
- 插图清单、附表清单、公式清单中加入附录中出现的实例（[#48](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/48)）。
- 更新超长列表列样式例子。

### Removed
- 删除模版未建议字体的选项。

## [1.3.12](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.11...v1.3.12) - 2022-03-30

### Added
- 示例中增加数学字体配置提示和字体对比。

### Changed
- 更新参考文献例子。
- 更新数学例子。
- 限制国标数学规范在中文论文中，英文论文不应用。
- 更新 gbt7714-bibtex 从 v2.1.2 到 v2.1.4。

### Fixed
- 修复模版默认配置导致的编译错误。

## [1.3.11](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.10...v1.3.11) - 2022-03-23

### Added
- 增加副指导教师配置。
- 增加表格示例。
- 增加源代码示例。
- 增加英文个人简历模版。
- 增加附录测试。
- 重新加入 BibLaTeX 参考文献编译模式。

### Changed
- 更新文档。
- 更新编译环境，同时测试 texlive 2021、2020 版本。
- 修改中文个人简历模版中拼写错误。
- 小于等于、大于等于号倾斜模式仅限中文生效。
- 添加允许英文版行间数字模式引用。
- 全局设定多行题注居中。
- 更新源代码、伪代码环境的标号，与图表一致。

### Removed
- 书签中移除个人简历的子条目。
- 回滚个人简历的引用包。
- 图书分类号替换为无意义占位符。

## [1.3.10](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.9...v1.3.10) - 2022-03-06

### Added
- 增加源代码示例。
- 增加伪代码示例。
- 添加英文论文的字数规定。

### Changed
- Makefile 更新字数统计命令，将结果写入本地日志。
- 修正示例文档中的打字错误和注释错误。
- 修改 texlive 最低版本要求（2017 -> 2020），由于 gbt7714 宏包的接口更新。
- 更新一些配置文件。

### Removed
- 移除v1.3.3启用的功能：示例文档中个人简历部分的自动化格式生成文献条目。由于个人简历的成果部分是定制化的国标格式，每个条目后还有括号包含的其他信息，无法兼容目前 bibunits 的方案。
- 回滚个人简历的示例。

## [1.3.9](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.8...v1.3.9) - 2022-01-05

### Removed
- 移除压缩包内多余的临时文件。

## [1.3.8](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.7...v1.3.8) - 2021-11-28

### Changed
- 更新测试文件。
- 更新文档：摘要字数要求，参考文献要求。
- 禁用参考文献的默认格式化期刊标题功能，改用自定义 bst 参考文献样式文件。
- 更新版权信息。


## [1.3.7](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.6...v1.3.7) - 2021-11-02

### Changed
- 更新注释。
- 更新文档。
- 更新封面和题名页。
- 改一级条目括号为全角。

## [1.3.6](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.5...v1.3.6) - 2021-11-01

### Changed
- 更新注释。
- 更新文档。
- 更新封面和题名页。

## [1.3.5](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.4...v1.3.5) - 2021-10-31

### Changed
- 更新注释。
- 更新文档。
- 更新 VSCode 插件配置。
- 更新英文题名页表格。

## [1.3.4](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.3...v1.3.4) - 2021-10-21

### Changed
- 更新注释。
- 更新文档。
- 修正专业型选项的拼写。

## [1.3.3](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.2...v1.3.3) - 2021-10-19

### Changed
- 【题名页】研究生姓名一栏改为“学位申请人”。
- 【题名页】专业选项名称修改，学术型博/硕士为“学科名称”，专业型博/硕士为“专业类别”。
- 条目内容对齐方式修改 ，第二行顶格。
- 参考文献的著录作者姓全大写，即改为GB/T 7714-2015。

### Added
- 增加注释。
- 增加符号和缩略语说明，并列于目录。

### Removed
- 由于引入 bibunits 对个人简历部分的文献进行管理，不再兼容 BibLaTeX 管理文献。

## [1.3.2](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.1...v1.3.2) - 2021-08-23

### Changed
- 更新字体文件名。

## [1.3.1](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.3.0...v1.3.1) - 2021-08-17

### Changed
- 更新声明括号。
- 修改英文的目录和页眉。

## [1.3.0](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.2.0...v1.3.0) - 2021-08-01

### Changed

- 【封面】封面“硕士学位论文” 修改为宋体 24 号字加粗。
- 【封面】封面论文题目中文采用黑体 22 号字。
- 【封面】封面作者及指导教师信息采用宋体 18 号字。
- 【封面】封面日期填写学位论文成文打印的日期，采用用宋体 18 号字。
- 【题名页】题目采用中文黑体 22 号字，英文Times New Roman 22号字。
- 【目录】修正目录行距目录。
- 【正文】修改条目列表，默认缩进2个中文字符，悬挂缩进，并按要求更新默认样式。
- 【正文】子图、子表改用成对圆括号。
- 【正文】修改默认数学字体为 Cambria Math。
- 【声明】对齐了声明中的签名。
- 【声明】变更声明顺序，位于在答辩委员会后。
- 【学术成果】修正学术成果部分的参考文献字体大小，改为10.5pt。
- 【学术成果】修改学术成果用节标题，前面不加（一）（二）等，序号从[1]开始往后递推。
- 【学术成果】修改学术成果用节标题样式。

### Added
- 【字体】添加加载外部字体选项，改善非 Windows 系统下的字体编译。

## [1.2.0](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.10...v1.2.0) - 2021-06-30

### Added
- 添加使用文档 `sustechthesis.pdf`。
- 改回 `dtx` 文件生成 `cls` 文件的形式，`dtx` 文件内有大量的注释方便后期维护。

### Changed
- 更改封面英文标题为自动大写。

## [1.1.10](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.9...v1.1.10) - 2021-06-14
### Changed
- 修正封面，使得表域居中。
- 手动调整 chapter 标题的行距。
- 声明行距修改。
- 更改声明形式，将声明移入cls。
- 为声明命令添加可选参数，使得可以合并扫描的声明文件。
- 重新定义封面副标题，并配置副标题格式。
- 更新测试脚本。
- 更新文件名。

### Fixed
- 修复封面标题行距。
- 修正表格等浮动体内部的字体为 11 bp。

## [1.1.9](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.8...v1.1.9) - 2021-06-10
### Changed
- 更新封面的间距。
- 更新关键词缩进，第二行应与第一行平齐。
- 参考文献改用传统 BibTeX + natbib 宏包。
- 重命名南科大特色格式。
- 更新测试脚本。
- 更新声明的缩进。

### Fixed
- 修复封面字体。

## [1.1.8](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.7...v1.1.8) - 2021-06-09
### Changed
- 同一修改 pt 为 bp。
- 移除一些无关的注释。

### Fixed
- 修复封面日期为思源宋体。

## [1.1.7](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.6...v1.1.7) - 2021-06-08
### Changed
- 独创声明加入目录。
- 更新英文独创声明。

### Fixed
- 拼写错误。

## [1.1.6](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.5...v1.1.6) - 2021-06-02
### Changed
- 分类答辩日期与封面发布日期选项。
- example 中改用 BibLaTeX。
- 更新参考文献样式文件。

### Fixed
- 英文声明的拼写错误。

## [1.1.5](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.4...v1.1.5) - 2021-05-29
### Changed
- 更新英文摘要大小写：中文为主要语言首字母大写，英文为主要语言全大写。
- 更新原创性声明和使用授权说明。

## [1.1.4](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.3...v1.1.4) - 2021-05-28
### Fixed
- 子图序号添加空格。

## [1.1.3](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.1.2...v1.1.3) - 2021-05-28
### Changed
- 更新注释。
- 更新文档。

### Fixed
- 修改表格和图表的标号用横线连接，子图仅有右括号。
- 修复工硕英文。
- 改写摘要英文为首字母大写。

## [1.1.2](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.0.6...v1.1.2) - 2021-05-27
### Added
- 添加委员会页面。
- 增加论文字数统计。

### Changed
- 更新注释，目录中移除独创声明 fix #7 。

## [1.0.6](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.0.4...v1.0.6) - 2021-04-27
### Added
- 加入镜像站链接，更新封面字体。

## [1.0.4](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/v1.0.1...v1.0.4) - 2021-04-10
### Fixed
- 修复封面超长英文系名导致的overbox问题。

## [1.0.1] - 2021-03-17
### Added
- 从清华模版 ThuThesis v7.1.0 初始化，并进行简单适配。
