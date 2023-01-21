import collections
def code():
    n = input()
    res_str = n.replace('.', '')
    if len(n) > 3 and len(n) < 51 and n.isupper()==True and (n.find(".") != -1) == True and (n.find("..") != -1) == False and (sorted(list(res_str)) == sorted(list(set(res_str)))) == True:
        windows=[]
        windows.append(n[0])
        windows.append(n[len(n)-1])

        i=0
        index=0
        aisle=[]
        while (n.find(".", i) != -1) == True:
            index=n.find(".", i)
            aisle.append(n[index-1])
            aisle.append(n[index+1])
            i=+index+1

        windows.sort()
        aisle.sort()
        print("Window:", *windows, sep = " ")
        print("Aisle:", *aisle, sep = " ")
    
code()


