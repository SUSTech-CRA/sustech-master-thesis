import os
import re
import sys

filename = "sustechthesis.dtx"


def change_meta(version, date):
    with open(filename, "r", encoding="utf-8") as f1:
        with open(f"{filename}.part", "w", encoding="utf-8") as f2:
            for line in f1:
                if "Southern University of Science and Technology Thesis Template" in line:
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


def get_meta():
    with open(filename, "r", encoding="utf-8") as f1:
        for line in f1:
            if "Southern University of Science and Technology Thesis Template" in line:
                try:
                    version = re.findall("(\d+)\.(\d+)\.(\d+)", line)[0]
                    date = re.findall("\d{4}/\d{2}/\d{2}", line)
                    return {
                        "ver": version,
                        "date": date
                    }
                except:
                    return None


def bump_version(version, delta=1, pos=-1):
    a, b, c = version
    ver = [int(a), int(b), int(c)]
    ver[pos] = delta+ver[pos]
    ver_str = [str(i) for i in ver]
    return ".".join(ver_str)


if __name__ == "__main__":
    import argparse
    import time
    try:
        new_version = bump_version(get_meta()["ver"])
    except:
        new_version = "0.0.1"
    now_date = time.strftime("%Y/%m/%d", time.localtime())
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", "-v", default=new_version,
                        help='release version')
    parser.add_argument("--date", "-d", default=now_date,
                        help='release date')
    parser.add_argument("--dev", action='store_true',
                        help='change the meta-data for develop build')
    args = parser.parse_args()

    if args.dev:
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
