""" 
Given a list of tuples featuring names and grades on a test, write a function normalize_grades to normalize the values 
of the grades to a linear scale between 0 and 1.

Example:

Input:

grades = [
    ('Jason', 94),
    ('Tessa', 80),
    ('Carla', 38),
    ('Matt', 43),
    ('Jessica', 100)
]
Output:

def normalize_grades(grades) - > [
    ('Jason', 0.9),
    ('Tessa', 0.68),
    ('Carla', 0.0),
    ('Matt', 0.08),
    ('Jessica', 1.0)
]
"""
def normalize_grades(grades):

    grades_only = []
    names_only = []
    for x, y in grades:
        grades_only.append(y) 
        names_only.append(x) 

    x_min = min(grades_only)
    x_max = max(grades_only)

    normalized_grades = []
    for i in range(len(grades_only)):
        normalized_grades.append( (grades_only[i] - x_min)/(x_max - x_min) ) 

    final_grades = [] 
    for x,y in zip(normalized_grades, names_only):
        final_grades.append((y,round(x,2)))

    return final_grades

if __name__ == "__main__":
    grades = [
    ('Jason', 94),
    ('Tessa', 80),
    ('Carla', 38),
    ('Matt', 43),
    ('Jessica', 100)
    ]

    print(normalize_grades(grades)) 