""" 
Given a list of integers, find the index at which the sum of the left half of the list is equal to the right half.

If there is no index where this condition is satisfied return -1.

Example 1:

Input:

nums = [1, 7, 3, 5, 6]
Output:

equivalent_index(nums) -> 2
"""
def equivalent_index(nums):
    total = sum(nums)
    left_sum = 0 

    for i,x in enumerate(nums):
        right_sum = total - left_sum - x 
        left_sum += x 
        if right_sum == left_sum:
            return i 

    return -1 


if __name__ == "__main__":
    nums = [1, 7, 3, 5, 6] 

    print(equivalent_index(nums))