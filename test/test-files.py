import os
import re
import shutil


def change_line(filename, old, new):
    try:
        rollback(filename, mode=1)
        with open(filename, "r", encoding="utf-8") as f1:
            with open(f"{filename}.part", "w", encoding="utf-8") as f2:
                for line in f1:
                    if re.findall(old, line):
                        print(line)
                        line = re.sub(old, new, line)
                        f2.write(line)
                        print(line)
                    else:
                        f2.write(line)
        os.remove(filename)
        os.rename(f"{filename}.part", filename)
    except:
        rollback(filename, mode=2)
    finally:
        rollback(filename, mode=0)


def comment_line(filename, pattern, action):
    try:
        rollback(filename, mode=1)
        with open(filename, "r", encoding="utf-8") as f1:
            with open(f"{filename}.part", "w", encoding="utf-8") as f2:
                for line in f1:
                    if re.findall(pattern, line):
                        print(line)
                        if action:
                            line = f"% {line}"
                        else:
                            line = re.sub(r"^[%\s]+", "", line)
                        f2.write(line)
                        print(line)
                    else:
                        f2.write(line)
        os.remove(filename)
        os.rename(f"{filename}.part", filename)
    except:
        rollback(filename, mode=2)
    finally:
        rollback(filename, mode=0)


def rollback(filename, mode):
    if mode == 1:
        # running 1
        shutil.copyfile(filename, f'{filename}.lock')
    elif mode == 0:
        # success 0
        os.remove(f'{filename}.lock')
    else:
        # error 2
        shutil.copyfile(f'{filename}.lock', filename)


def backup(filename, mode):
    if mode:
        # before change, backup
        try:
            shutil.copyfile(filename, f'{filename}.undo.bak')
        except:
            pass
    else:
        # after change, restore
        try:
            shutil.copyfile(f'{filename}.undo.bak', filename)
            os.remove(f'{filename}.undo.bak')
        except:
            pass


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--recipe", type=int, required=True, help='recipe value')
    parser.add_argument('--undo', action='store_true')
    parser.add_argument('--lang', choices=['cn', 'en'], default='cn', help='report language')
    args = parser.parse_args()
    TOBACKUP = not args.undo
    REPORT_TYPES = {4: 'progress', 5: 'proposal', 6: 'practice'}
    LANGUAGES = {'cn': 'chinese', 'en': 'english'}

    if args.recipe == 1:
        # chinese
        filename = "sustechthesis-example.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        "documentclass.+{sustechthesis}",
                        "documentclass[degree=master,language=chinese,font=external,cjk-font=external]{sustechthesis}"
                        )
    elif args.recipe == 2:
        # english
        filename = "sustechthesis-example.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        "documentclass.+{sustechthesis}",
                        "documentclass[degree=master,language=english,font=external,cjk-font=external]{sustechthesis}"
                        )
    elif args.recipe == 3:
        # biber
        filename = "sustechthesis-example.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            comment_line(filename, "bibliography{ref/refs}", True)
            comment_line(filename, "printbibliography", False)

        filename = "sustech-setup.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            comment_line(filename, "{natbib}", True)
            comment_line(filename, "bibliographystyle{sustechthesis-numeric}", True)
            comment_line(filename, r"style=gb7714-2015,gbalign=left\]{biblatex}", False)
            comment_line(filename, "addbibresource{ref/refs.bib}", False)
    elif args.recipe in REPORT_TYPES:
        # 4: progress, 5: proposal, 6: practice
        filename = "sustech-setup.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        r"(?<!\S)type = \S+,",
                        f"type = {REPORT_TYPES[args.recipe]},"
                        )

        filename = "sustechthesis-example-report.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        "documentclass.+{sustechthesis}",
                        f"documentclass[degree=master,language={LANGUAGES[args.lang]},font=external,cjk-font=external]{{sustechthesis}}"
                        )