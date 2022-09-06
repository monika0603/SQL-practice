""" 
You are given two lists of strings list1 and list2, which are sorted alphabetically in ascending order.

Implement a function that merges these two lists into one sorted list marking all items from list1 and list2 with 
characters "1" and "2" respectively at the end of each item and return that list.

Example:

Input:

list1 = ["ball","ninja","plan"]
list2 = ["cat","egg","zoo"]
Output:

def mark_lists(list1,list2) ->
["ball1","cat2","egg2","ninja1","plan1","zoo2"]
"""
from collections import deque 
def mark_lists(l1, l2):

    new_l1 = []
    new_l2 = []
    for word in l1:
        word += '1'
        new_l1.append(word) 

    for word in l2:
        word += '2'
        new_l2.append(word)
    
    merged_list = new_l1 + new_l2 
    if len(merged_list) <= 1:
        return merged_list 
    
    return merge_sort(merged_list)

def merge_sort(merged_list):
    if len(merged_list) <= 1:
        return merged_list

    mid = len(merged_list)//2 
    left_sorted = merge_sort(merged_list[:mid])
    right_sorted = merge_sort(merged_list[mid:])

    return merge(left_sorted, right_sorted) 

def merge(left, right):
    left_1 = deque(left)
    right_1 = deque(right)

    merged = []
    while left_1 and right_1:
        if left_1[0] < right_1[0]:
            merged.append(left_1.popleft())
        else:
            merged.append(right_1.popleft())

    merged += left_1 
    merged += right_1 

    return merged 

if __name__ == "__main__":
    list1 = ["ball","ninja","plan"]
    list2 = ["cat","egg","zoo"]

    print(mark_lists(list1,list2))