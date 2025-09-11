# https://www.hackerrank.com/challenges/validating-credit-card-number/problem

# Enter your code here. Read input from STDIN. Print output to STDOUT
import re

n = int(input())

for x in range(n):
    numbers = input()
    # Check card numbers and structure
    if not re.match(r"[456][0-9]{3}(-?[0-9]{4}){3}$", numbers):
        print("Invalid")
        continue
        
    # Check for repetitive numbers
    rep_num = numbers.replace("-", "")
    if re.search(r"(\d)\1{3,}", rep_num):
        print("Invalid")
    else:
        print("Valid")
