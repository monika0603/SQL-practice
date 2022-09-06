""" 
You are asked to develop a simple tag counter that will look for the occurrence of certain words or phrases in a piece of text.

You are given a paragraph as a string and a list of tag groups as a list of lists of strings. Write a tag_counter function that 
returns a list of integers with the number of times each tag in the tag group was used in the text.

Note: Your function should be case-insensitive with regards to the tag groups.

Example:

Input:

tag_groups = [
    ['data scientist', 'data analyst'], 
    ['data engineer', 'data wrangler'], 
    ['machine learning engineer'], 
    ['data' , 'engineer']]
text = "Today, with the advent of data science, different roles have emerged in the industry. Job postings are abundant of 
many names such as data scientist, data engineer, data wrangler, deep learning specialist, and machine learning specialist to name a few."
"""

from itertools import count

import math
def term_frequency(document):

    count_words = {}
    word_list = document.split(' ')
    total_length = len(word_list)
    print(total_length)

    for word in word_list:
        count_words[word] = 1 + count_words.get(word, 0)

    print(count_words)

    output = {}
    for key, value in count_words.items():
        output[key] = round(value/total_length, 2)

    return output

    

if __name__ == "__main__":
    document = "I have a nice car with a nice tires"
    print(term_frequency(document))