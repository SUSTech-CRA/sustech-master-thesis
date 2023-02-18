import os
import re
import shutil
import sys


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
                            line = re.sub("^[%\s]+", "", line)
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
    args = parser.parse_args()
    TOBACKUP = not args.undo

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
            comment_line(filename, "{gbt7714}", True)
            comment_line(filename, "citestyle{super}", True)
            comment_line(filename, "citestyle{numbers}", True)
            comment_line(filename, "bibliographystyle{sustechthesis-numeric}", True)
            comment_line(filename, "{biblatex}", False)
            comment_line(filename, "addbibresource{ref/refs.bib}", False)
    elif args.recipe == 4:
        # progress
        filename = "sustech-setup.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        "type = \S+,",
                        "type = progress,"
                        )
    elif args.recipe == 5:
        # proposal
        filename = "sustech-setup.tex"
        backup(filename, TOBACKUP)
        if not args.undo:
            change_line(filename,
                        "type = \S+,",
                        "type = proposal,"
                        )