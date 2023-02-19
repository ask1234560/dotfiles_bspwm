import csv
import xirr.math
from datetime import datetime


if __name__ == "__main__":

    csv_filename = "/home/ananthu/Documents/investment/ledger-FY2163.csv"
    temp = []
    rows = []
    xirr_dict = {
        "date": [],
        "val": []
    }

    exclude_patterns = ["Funds added using", "Payout of",
                        "Funds transferred back", "Funds auto-settled"]

    with open(csv_filename) as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            temp.append(row)

    for row in temp[2:-1]:
        flag = False
        for pattern in exclude_patterns:
            if pattern in row[0]:
                flag = True
        if not flag:
            rows.append(row)

    for row in rows:
        d = datetime.strptime(row[1], "%Y-%m-%d")
        v = -1 * float(row[4])
        xirr_dict["date"].append(d)
        xirr_dict["val"].append(v)

    xirr_dict["date"].append(datetime.now())
    val = input("current holding value\n")
    xirr_dict["val"].append(float(val.replace(",", "_")))

    per = xirr.math.listsXirr(xirr_dict["date"], xirr_dict["val"])

    print("xirr returns is {}%".format(round(per*100, 2)))
