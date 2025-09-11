import pandas as pd
import requests

# Fetch table element from html page
def fetch_table(url):
    html = requests.get(url).content
    df_list = pd.read_html(html, header=0, encoding="utf-8")
    return df_list[0]

def main():
    # Fetch the table from the URL
    url = "https://docs.google.com/document/d/e/2PACX-1vTER-wL5E8YC9pxDx43gk8eIds59GtUUk4nJo_ZWagbnrH0NFvMXIw6VWFLpf5tWTZIT9P9oLIoFJ6A/pub"
    df = fetch_table(url).sort_values(by=["y-coordinate", "x-coordinate"], ascending=[False, True])
    # get max value of y coordinate
    y = df["y-coordinate"].max()
    # print lines starting from the top
    while y >= 0:
        # print characters from left to right
        x = 0
        current_line = df.loc[df["y-coordinate"] == y]
        # print whitespaces if there are gaps in the x values
        for index, row in current_line.iterrows():
            while x < row["x-coordinate"]:
                print(" ", end="")
                x += 1
            print(row["Character"], end="")
            x += 1
        # add a newline after each line ends
        print("\n", end="")
        y -= 1

main()