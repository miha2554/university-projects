import numpy as np
A1 = [[], [], [], [], []]
solve1 = [0,0,0,0,0,0,0,0]
n =11
def comb(n,k):
  d = list(range(0,k))
  yield d

  while True:
    i = k-1
    while i >= 0 and d[i] + k - i + 1 > n:
      i -= 1
    if i < 0:
      return
    d[i] += 1
    for j in range(i+1, k):
      d[j] = d[j-1] + 1
    yield d

A = np.zeros((5,8))
A = [[3.0, -11.0, 11.0, 4.0, -5.0, 6.0, -2.0, 8.0],
     [-2.0, 0.0, -4.54, 11.0, 12.0, -6.0, -1.0, 3.0],
     [-2.0, 4.0, 6.0, 7.0, 12.0, -11.0, -1.0, 13.0],
     [-1.0, 3.0, -2.75, -4.0, 5.0, -1.0, 12.0, -1.0],
     [2.0, 5.0, 7.0, -11.0, 6.0, 1.0, 1.0, -2.0]]

B = np.zeros((5,1))
B = [[112.0],
      [113.0],
      [9.0],
      [132.0],
      [211.0]]


rank = np.linalg.matrix_rank(A)
print("Ранг матрицы равен ", rank)

print ("Обнуляем 8 -",rank, "=", 8-rank,  "переменные")
for a in comb(8,rank):
  A = [[3.0, -11.0, 11.0, 4.0, -5.0, 6.0, -2.0, 8.0],
     [-2.0, 0.0, -4.54, 11.0, 12.0, -6.0, -1.0, 3.0],
     [-2.0, 4.0, 6.0, 7.0, 12.0, -11.0, -1.0, 13.0],
     [-1.0, 3.0, -2.75, -4.0, 5.0, -1.0, 12.0, -1.0],
     [2.0, 5.0, 7.0, -11.0, 6.0, 1.0, 1.0, -2.0]]  
  for i in range(len(A)):
    for j in range(8):
      for k in range(5):
       if j == a[k]:
         A1[i].append(A[i][j])
  matrix = np.array(A1)
  vector = np.array(B)
  solve = np.linalg.solve(matrix, vector)
  for i in range(8):
      for j in range(5):
        if i == a[j]:
            solve1[i] = solve[j]
  if ((solve1[0] >= 0) and (solve1[1] >= 0) and (solve1[2] >= 0) and (solve1[3] >= 0) and (solve1[4] >= 0) and (solve1[5] >= 0) and(solve1[6] >= 0) and (solve1[7] >= 0)):  
      print (solve1)
  A1 = [[], [], [], [], []]
  solve1 = [0,0,0,0,0,0,0,0]
