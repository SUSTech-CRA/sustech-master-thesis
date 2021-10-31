import os
import re

filename = "sustechthesis.dtx"
new_version = "1.3.6"
new_date = "2021/11/01"

with open(filename, "r", encoding="utf-8") as f1:
    with open("{filename}.bak", "w", encoding="utf-8") as f2:
        for line in f1:
            if "Southern University of Science and Technology Thesis Template" in line:
                line = re.sub("\d\.\d\.\d", new_version, line)
                line = re.sub("\d{4}/\d{2}/\d{2}", new_date, line)
                f2.write(line)
            elif "\\def\\version" in line:
                line = re.sub("\d\.\d\.\d", new_version, line)
                f2.write(line)
            else:
                f2.write(line)
        os.remove(filename)
        os.rename("{filename}.bak", filename)
