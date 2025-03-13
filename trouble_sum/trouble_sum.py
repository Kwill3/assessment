from itertools import combinations

def troubleSum(N, A):
    count = 0
    # Generate all quadruples (i, j, k, l) where i < j < k < l
    for i, j, k, l in combinations(range(N), 4):
        if A[i] + A[j] == A[k] + A[l]:
            count += 1
    print(count)
    return count


troubleSum(7, [2, 1, 3, 3, 3, 1, 2]) # 7
troubleSum(6, [1, 3, 5, 6, 4, 2]) # 2
troubleSum(5, [1, 1, 1, 1, 1]) # 5
troubleSum(5, [1, 2, 3, 4, 5]) # 0