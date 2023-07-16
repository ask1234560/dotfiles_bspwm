import csv
import xirr.math
from datetime import datetime


if __name__ == "__main__":

    n = int(input("Enter number of accounts:\n"))

    xirr_dict = {
        "date": [],
        "val": []
    }
    exclude_patterns = ["Funds added using", "Payout of",
                        "Funds transferred back", "Funds auto-settled"]
    holding_value = 0.0

    for i in range(n):
        csv_filename = f"/home/ananthu/Documents/investment/ledger-FY2163_{i}.csv"
        temp = []
        rows = []

        with open(csv_filename) as csvfile:
            csvreader = csv.reader(csvfile)
            for row in csvreader:
                temp.append(row)

        for row in temp[2:-1]:
            flag = True
            for pattern in exclude_patterns:
                if pattern in row[0]:
                    flag = False
                    break
            if flag:
                rows.append(row)

        for row in rows:
            d = datetime.strptime(row[1], "%Y-%m-%d")
            v = -1 * float(row[4])
            xirr_dict["date"].append(d)
            xirr_dict["val"].append(v)

    for i in range(n):
        val = input(f"Current holding value for {i}:\n")
        holding_value += float(val.replace(",", "_"))

    xirr_dict["date"].append(datetime.now())
    xirr_dict["val"].append(holding_value)

    per = xirr.math.listsXirr(xirr_dict["date"], xirr_dict["val"])

    print(f"XIRR returns is {round(per*100, 2)}%")
