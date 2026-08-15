# 正式版本发布流程

本文档说明 SUSTechThesis 正式版本的准备、构建和发布流程。原流程记录于 [GitHub Issue #23](https://github.com/SUSTech-CRA/sustech-master-thesis/issues/23)，后续以本文档为准。

## 1. 准备版本

确保位于 `master` 分支，且本地代码已经与远端同步：

```shell
git switch master
git pull --ff-only origin master
git status
```

查看当前最新版本：

```shell
git tag --sort=-version:refname
```

运行版本更新脚本。脚本默认从 `sustechthesis.dtx` 读取当前版本并递增补丁版本，同时更新其中三处版本元数据，并在 `CHANGELOG.md` 顶部生成新版本骨架：

```shell
python3 test/update-dist.py --date YYYY/MM/DD
```

Windows 如果没有 `python` 命令，可使用：

```powershell
py -3 test/update-dist.py --date YYYY/MM/DD
```

脚本只负责更新版本元数据和生成 changelog 骨架。必须人工整理 `CHANGELOG.md`：

- 将原有 `Unreleased` 内容归入新版本；
- 删除占位文字和重复的 `Unreleased` 标题；
- 保留一个指向新版本至 `HEAD` 的 `Unreleased` 比较链接；
- 按 `Added`、`Changed`、`Deprecated`、`Removed`、`Fixed`、`Security` 分类；
- 同一个 Pull Request 在同一版本中只保留一条记录；
- 确认版本日期使用 `YYYY-MM-DD` 格式。

版本标题格式如下：

```md
## [Unreleased](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/vX.Y.Z...HEAD)

## [vX.Y.Z](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/vA.B.C...vX.Y.Z) - YYYY-MM-DD
```

最后确认 `sustechthesis.dtx` 中三处版本号和日期一致：

```shell
rg -n "Southern University of Science and Technology Thesis Template|\\def\\version" sustechthesis.dtx
```

## 2. 本地验证

检查 diff 和空白错误：

```shell
git diff --check
git diff --stat
```

使用 TeX Live 执行与 CI 对应的构建和测试：

```shell
make doc test
```

如需同时生成发布归档，可运行：

```shell
make dist-github
```

## 3. 提交并推送

只添加本次发布涉及的文件，检查暂存区后提交：

```shell
git add CHANGELOG.md sustechthesis.dtx
git diff --cached --check
git diff --cached
git commit -m "Bump to vX.Y.Z"
git push origin master
```

等待 `master` 对应的 Verify and sync 工作流通过后再创建 tag。

## 4. 创建版本 tag

```shell
git tag vX.Y.Z
git push origin vX.Y.Z
```

推送 tag 后，Release 工作流会执行以下操作：

1. 构建模板说明书、示例文档和 `sustechthesis.cls`；
2. 生成版本压缩包；
3. 创建对应 tag 的 GitHub Release 草稿并上传构建产物。

## 5. 发布 GitHub Release

在 GitHub Actions 中确认 Release 工作流成功，然后打开生成的 Release 草稿。

将 `CHANGELOG.md` 中当前版本的分类和条目复制到 Release 正文，并在末尾添加相邻版本比较链接：

```md
### Added
- 版本新增内容。

### Changed
- 版本变更内容。

### Fixed
- 版本修复内容。

[`vA.B.C...vX.Y.Z`](https://github.com/SUSTech-CRA/sustech-master-thesis/compare/vA.B.C...vX.Y.Z)
```

发布前确认以下附件齐全：

- `sustechthesis.cls`；
- `sustechthesis.pdf`；
- 中文、英文及报告示例 PDF；
- `sustech-thesis-vX.Y.Z.zip`。

确认版本号、发布日期、正文和附件无误后，将草稿正式发布。

## 6. 删除错误的 tag

如果 tag 尚未正式发布且需要重建，先删除对应的 Release，再删除本地和远端 tag：

```shell
gh release delete vX.Y.Z --yes
git tag -d vX.Y.Z
git push --delete origin vX.Y.Z
```

修正版本内容后，重新执行提交、推送 tag 和检查 Release 草稿的步骤。
