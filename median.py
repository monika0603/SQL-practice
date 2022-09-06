""" 
You’re given a list of sorted integers in which more than 50% of the list is comprised of the same repeating integer.

Write a function to return the median value of the list in 
O(1) computational time and space.

Note: the lists are all non-empty

Example:

Input:

li = [1,2,2]
Output:

median(li) -> 2
"""
def median(nums):
    if len(nums) == 1:
        return nums 
    
    mid = len(nums)//2
    return nums[mid]

if __name__ == "__main__":
    nums = [1,2,2]
    print(median(nums))