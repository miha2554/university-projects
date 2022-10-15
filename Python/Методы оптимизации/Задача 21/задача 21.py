#-------------------------МиКН---------------------------------------
#-------------------------ВАРИАНТ 11---------------------------------
#-------------------------ЛАВРЕНТЬЕВ МИХАИЛ--------------------------
import random

N = 'infinity' #БЕСКОНЕЧНОСТЬ

#задаём матрицу

A = [
     [N, 7, 23, 16, 20, 6],
     [21, N, 16, 11, 30, 25],
     [20, 13, N, 8, 5, 11],
     [11, 16, 25, N, 18, 18],
     [41, 16, 17, 8, N, 15],
     [13, 25, 35, 19, 5, N]
     ]

# пустой список кратчайших путей
path = []
cities = []

# выбираем случайный город
I = random.randint(0, len(A)-1)

# Ищем кратчайший путь
MIN = 0
NEXT = -1
PREV = -1

for i in range(len(A)):
    if I not in cities and (len(cities) < len(A) - 1):
        for j in range(len(A)):
            if (j not in cities) and (I != j):
                if A[I][j] != N:
                    if MIN == 0:
                        MIN = A[I][j]
                        NEXT = j
                    elif MIN > A[I][j]:
                        MIN = A[I][j]
                        NEXT = j
        cities.append(I)
        PREV = I
        I = NEXT
        path.append((PREV + 1, NEXT + 1))
        MIN = 0

print(path)
