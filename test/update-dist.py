import os
import re
import sys

filename = "sustechthesis.dtx"
new_version = "1.3.7"
new_date = "2021/11/02"

def change_meta(version, date):
    with open(filename, "r", encoding="utf-8") as f1:
        with open("{filename}.bak", "w", encoding="utf-8") as f2:
            for line in f1:
                if "Southern University of Science and Technology Thesis Template" in line:
                    print(line)
                    line = re.sub("\d\.\d\.\d", version, line)
                    line = re.sub("\d{4}/\d{2}/\d{2}", date, line)
                    f2.write(line)
                    print(line)
                elif "\\def\\version" in line:
                    print(line)
                    line = re.sub("\d\.\d\.\d", version, line)
                    f2.write(line)
                    print(line)
                else:
                    f2.write(line)
            os.remove(filename)
            os.rename("{filename}.bak", filename)


if __name__ == "__main__":
    import argparse
    import time
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", "-v", default=new_version,
                        help='release version')
    parser.add_argument("--date", "-d", default=new_date,
                        help='release date')
    parser.add_argument("--dev", action='store_true',
                        help='change the meta-data for develop build')
    args = parser.parse_args()

    if args.dev:
        now_date = time.strftime("%Y/%m/%d", time.localtime())
        dev_version = "DEV.BUILD"
        try:
            git_head_sha = os.popen(r"git log -1 --format='%H'").readlines()[0]
        except:
            git_head_sha = "NAN.SHA"
        if git_head_sha:
            dev_version = f"{git_head_sha[:7].upper()}.{dev_version}"
        change_meta(dev_version, now_date)
    else:
        change_meta(args.version, args.date)
