def split_and_join(line):
    # write your code here
    
    #split function is called on the variable itself and the delimiter is added as a parameter to the split function
    a = line.split(" ")

    # the join function is called on the delimiter and the variable is put as a parameter to the join function
    b = '-'.join(a)

    #so syntax wise, the split and the join are opposite of each other
    
    return b

print(split_and_join("I am a Senior Data Engineer makinf $200,000 per year"))
