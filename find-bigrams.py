""" 
Write a function called find_bigrams that takes a sentence or paragraph of strings and returns a list of all bigrams.

Example:

Input:

sentence = """
#Have free hours and love children? 
#Drive kids to school, soccer practice 
#and other activities.
"""
Output:

def find_bigrams(sentence) ->

 [('have', 'free'),
 ('free', 'hours'),
 ('hours', 'and'),
 ('and', 'love'),
 ('love', 'children?'),
 ('children?', 'drive'),
 ('drive', 'kids'),
 ('kids', 'to'),
 ('to', 'school,'),
 ('school,', 'soccer'),
 ('soccer', 'practice'),
 ('practice', 'and'),
 ('and', 'other'),
 ('other', 'activities.')]
"""

def find_bigrams(sentence):

    input_words = sentence.split() 
    output = []
    for i in range(len(input_words)-1):
        output.append((input_words[i], input_words[i+1]))

    return output


if __name__ == "__main__":
    sentence = """Have free hours and love children? Drive kids to school, soccer practice and other activities."""
    print(find_bigrams(sentence))