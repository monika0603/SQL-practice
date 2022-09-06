""" 
Write a function find_change to find the minimum number of coins that make up the given amount of change cents. Assume 
we only have coins of value 1, 5, 10, and 25 cents.

Example:

Input:

cents = 73
def find_change(cents) -> 7
#(25 + 25 + 10 + 10 + 1 + 1 + 1)
"""

def minimum_change(amount):
    coins = [25, 10, 1]
    return _minimum_change(amount, coins, 0)

def _minimum_change(amount, coins, i):
    if amount == 0:
        return 1 

    if i == len(coins):
        return 0 

    coin = coins[i]
    total_ways = 0
    print(amount//coin)
    for qty in range(0, (amount//coin)+1):
        remainder = amount - (qty*coin)
        total_ways += _minimum_change(remainder, coins, i+1)

    return total_ways


if __name__ == "__main__":
    amount = 73 
    print(minimum_change(amount))