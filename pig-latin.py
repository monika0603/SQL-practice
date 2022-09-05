def each_word(s):
    vowels = ['a', 'e', 'i', 'o', 'u']
    new_s = ''

    
    if s[0] not in vowels:
        new_s = s[1:]
        new_s += '-'
        new_s += s[0]
        new_s += 'ay'
    if s[0] in vowels:
        new_s = s
        new_s += '-'
        new_s += 'way'

    return new_s 

def pig_latin(s):

    if len(s) == 0:
        return None 

    list_s = s.split()
    output = []
    for word in list_s:
        output.append(each_word(word))

    result = '' 
    for word in output:
        result += word 
        result += ' '

    return result 


if __name__ == "__main__":
    # Test case 01
    print(pig_latin("Pig Latin"))

    # Test case 02 
    print(pig_latin("Pig Latin is a farcical language."))
