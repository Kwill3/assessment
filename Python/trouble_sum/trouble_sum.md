# Trouble Sum

Given is an array, **A[i]** of length **N**.

Find the number of tuples *(i, j, k, l)* such that the following holds:

- *1 ≤ i < j < k < l ≤ N*
- *A[i] + A[j] = A[k] + A[l]*

**Note**

Print 0 if you are not able to find any such tuples.

**Input Format**

The first line contains one integer *N*, denoting the size of the array.

The second line contains *N* space-separated non-negative integers, denoting the elements of the array.

**Sample Input**
```
5       -- denotes N
1 1 1 1 1   -- denotes A[i]
```
**Constraints**

- *4 ≤ **N** ≤ 3000*
- *1 ≤ **A[i]** ≤ **N***

**Output Format**

The output contains a single integer denoting the number of tuples.

**Sample Output**
```
5
```
**Explanation**

Following are the valid tuples in the given array:

1. (1, 2, 3, 4).
2. (1, 2, 3, 5).
3. (1, 2, 4, 5).
4. (1, 3, 4, 5).
5. (2, 3, 4, 5).

Hence, the output is 5.