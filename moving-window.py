""" 
Given a list of numbers nums and an integer window_size, write a function moving_window to find the moving window average.

Example 1:

Input:

nums = [1,2,3,4,5,6]
window_size = 3
Output:

def moving_window(input, window_size) -> [1, 1.5, 2, 3, 4, 5]
"""

def moving_window(nums, window_size):
    window_start = 0
    window_end = 0 
    output = [] 
    sum = 0 

    while window_end < len(nums):
        sum += nums[window_end]
        output.append(sum/(window_end - window_start + 1))
        window_end += 1 

        if window_end-window_start >= window_size:
            sum -= nums[window_start]
            window_start += 1

    return output

if __name__ == "__main__":
    nums = [1,2,3,4,5,6]
    window_size = 3
    print(moving_window(nums, window_size))
