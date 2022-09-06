""" 
Given two dates, write a program to find the number of business days that exist between the date range.

Example:

Input:

date1 = 2021-01-31
date2 = 2021-02-18
Output:

def delta_buss_days(date1,date2) -> 14
"""
from datetime import datetime
def delta_buss_days(d1, d2):
    d1 = datetime.strptime(d1, "%Y-%m-%d")
    d2 = datetime.strptime(d2, "%Y-%m-%d")

    return abs((d2-d1).days)

if __name__ == "__main__":
    date1 = '2021-01-31'
    date2 = '2021-02-18'

    print(delta_buss_days(date1, date2))