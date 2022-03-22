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


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--recipe", type=int, required=True, help='recipe value')
    args = parser.parse_args()

    if args.recipe == 1:
        # chinese
        filename = "sustechthesis-example.tex"
        change_line(filename,
                    "documentclass.+{sustechthesis}",
                    "documentclass[degree=master,language=chinese,cjk-font=external]{sustechthesis}"
                    )
    elif args.recipe == 2:
        # english
        filename = "sustechthesis-example.tex"
        change_line(filename,
                    "documentclass.+{sustechthesis}",
                    "documentclass[degree=master,language=english,cjk-font=external]{sustechthesis}"
                    )
