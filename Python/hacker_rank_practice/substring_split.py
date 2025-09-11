# https://www.hackerrank.com/challenges/merge-the-tools/problem

def merge_the_tools(string, k):
    arr = []
    
    for i in range(0, len(string), k):
        arr.append(string[i: i+k])
        
    for sub_string in arr:
        sub_arr = []
        for c in sub_string:
            if c not in sub_arr:
                sub_arr.append(c)
        print(''.join(sub_arr))
    
    
    
if __name__ == '__main__':
    string, k = input(), int(input())
    merge_the_tools(string, k)