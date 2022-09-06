""" 
Write a function find_change to find the minimum number of coins that make up the given amount of change cents. 
Assume we only have coins of value 1, 5, 10, and 25 cents.

Example:

Input:

cents = 73
Output:

def find_change(cents) -> 7
#(25 + 25 + 10 + 10 + 1 + 1 + 1)
"""

def minimum_change(target):
    coins = [25, 10, 1]
    return _minimum_change(target, coins) 

def _minimum_change(target, coins):
    if target < 0:
        return float("inf")

    if target == 0:
        return 0 

    min_change = float("inf")
    for coin in coins:
        remainder = target - coin 
        attempt = 1 + _minimum_change(remainder, coins)
        min_change = min(min_change, attempt)

    return min_change 

# Driver code 
if __name__ == "__main__":
    target = 73 
    print(minimum_change(target))