import math

def fill(c, width, height):
    for i in range(height):
        for j in range(width):
          if i==j:
            c[i][j] = -5
          if math.fabs(i-j)>0 and math.fabs(i-j) <= 5:
            c[i][j] = round(math.fabs(i-j), 1)
          if math.fabs(i-j)>5:
            c[i][j] = round(0.4*i-2*j, 1)
    return c


a = [[0]*23 for _ in range(23)]
for i in fill(a, 23, 23):
    print(i)

print()

print("Возьмём С = 45 > 0. Получаем..")

def fill(d, width, height):
    for i in range(height):
        for j in range(width):
          if i==j:
            d[i][j] = 40
          if math.fabs(i-j)>0 and math.fabs(i-j) <= 5:
            d[i][j] = round(math.fabs(i-j)+45, 1)
          if math.fabs(i-j)>5:
            d[i][j] = round(0.4*i-2*j+45, 1)
    return d

b = [[0]*23 for _ in range(23)]
for i in fill(b, 23, 23):
    print(i)