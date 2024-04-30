import os
import re

filename = "sustechthesis.dtx"
changelog_file = "CHANGELOG.md"
repository_url = "https://github.com/SUSTech-CRA/sustech-master-thesis"


def change_meta(version, date):
    with open(filename, "r", encoding="utf-8") as f1:
        with open(f"{filename}.part", "w", encoding="utf-8") as f2:
            for line in f1:
                if (
                    "Southern University of Science and Technology Thesis Template"
                    in line
                ):
                    print(line)
                    line = re.sub("\d+\.\d+\.\d+", version, line)
                    line = re.sub("\d{4}/\d{2}/\d{2}", date, line)
                    f2.write(line)
                    print(line)
                elif "\\def\\version" in line:
                    print(line)
                    line = re.sub("\d+\.\d+\.\d+", version, line)
                    f2.write(line)
                    print(line)
                else:
                    f2.write(line)
    os.remove(filename)
    os.rename(f"{filename}.part", filename)


def generate_changelog_md(old_version, new_version, date):
    new_ver = f"v{new_version}"
    old_ver = "v" + ".".join(old_version)
    md_template = f"""## [Unreleased]({repository_url}/compare/{new_ver}...HEAD)

## [{new_ver}]({repository_url}/compare/{old_ver}...{new_ver}) - {date}

### Fixed:
- 这里可以添加具体的修复内容，根据实际情况调整。

### Changed
- 这里可以添加具体的修复内容，根据实际情况调整。

### Added
- 这里可以添加具体的修复内容，根据实际情况调整。

### Removed
- 这里可以添加具体的修复内容，根据实际情况调整。
"""

    return md_template


def update_changelog(old_version, new_version, date):
    date_hyphen = date.replace("/", "-")
    with open(changelog_file, "r", encoding="utf-8") as f:
        changelog_content = f.read()
        body_index = changelog_content.index("<!-- BODY -->") + len("<!-- BODY -->")
        new_entry = "\n" * 2 + generate_changelog_md(
            old_version, new_version, date_hyphen
        )
        print(new_entry)
        updated_content = (
            changelog_content[:body_index] + new_entry + changelog_content[body_index:]
        )
    with open(changelog_file, "w", encoding="utf-8") as f:
        f.write(updated_content)


def get_meta():
    with open(filename, "r", encoding="utf-8") as f1:
        for line in f1:
            if "Southern University of Science and Technology Thesis Template" in line:
                try:
                    version = re.findall("(\d+)\.(\d+)\.(\d+)", line)[0]
                    date = re.findall("\d{4}/\d{2}/\d{2}", line)
                    return {"version": version, "release_date": date}
                except:
                    return None


def bump_version(version, level="patch"):
    a, b, c = version
    if level == "major":
        a = int(a) + 1
    elif level == "minor":
        b = int(b) + 1
    else:  # level == 'patch'
        c = int(c) + 1
    ver_str = [str(i) for i in [a, b, c]]
    return ".".join(ver_str)


if __name__ == "__main__":
    import argparse
    import time

    try:
        meta = get_meta()
        if meta:
            current_version = meta["version"]
        else:
            current_version = "0.0.1"
    except:
        current_version = "0.0.1"
    now_date = time.strftime("%Y/%m/%d", time.localtime())
    nan_commit_sha = "NAN.SHA"
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--version", "-v", default=current_version, help="release version"
    )
    parser.add_argument("--sha", "-s", default=nan_commit_sha, help="git commit hash")
    parser.add_argument("--date", "-d", default=now_date, help="release date")
    parser.add_argument(
        "--level",
        "-l",
        choices=["major", "minor", "patch"],
        default="patch",
        help="specify the version level to bump (major, minor, or patch)",
    )
    parser.add_argument(
        "--dev", action="store_true", help="change the meta-data for develop build"
    )
    args = parser.parse_args()

    if args.dev:
        dev_version = f"{args.sha[:7].upper()}.DEV.BUILD"
        change_meta(dev_version, now_date)
    else:
        new_version = bump_version(args.version, args.level)
        change_meta(new_version, args.date)
        update_changelog(current_version, new_version, args.date)
