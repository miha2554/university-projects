import sys
import math

def gcd(a, b):
    while a > 0 and b > 0:
        if a >= b:
            a = a % b
        else:
            b = b % a

    return max(a, b)

def extended_gcd(a, b):
    x = 1 
    x1 = 0
    y = 0
    y1 = 1
    while b != 0:
        q = a // b
        r = a % b
        x2 = x - q * x1
        y2 = y - q * y1
        a, b = b, r
        x, x1 = x1, x2
        y, y1 = y1, y2
    return x, y

def diophantine(a, b, c):
    (u, v) = extended_gcd(a, b)
    x = u * (c // gcd(a, b))
    y = v * (c // gcd(a, b))
    return x, y

def check(a,b,c):
    while True:
        c = a % b
        a = b
        b = c
        if c == 0:
            break
    return a

j = 0

a=int(input('Введите a: '))
b=int(input('Введите b: '))
c=int(input('Введите c: '))

d1 = gcd(a, b)

if (d1 != 1) and (c % d1 != 0):
    print("ЛДУ не разрешимо в целых числах.")
    sys.exit()
else:
    a = int(a/d1)
    b = int(b/d1)
    c = int(c/d1)

a1 = a
b1 = b
c1 = c

d = check(a,b,c)
d = abs(d)

answ = diophantine(a,b,c)

answ = list(answ)

if (a>0 and b>0) :
    print('(' + str(answ[0]) + ' + ' + str(b) + 't, ' + str(answ[1]) + ' - ' + str(a) + 't)')
elif (a<0 and b<0) :
    print('(' + str(answ[0]) + ' - ' + str(abs(b)) + 't, ' + str(answ[1]) + ' + ' + str(abs(a)) + 't)')
else:
    print("Ошибка")

t1 = - answ[0]/b1
t2 = answ[1]/a1
#print(t1,t2)

if t1 < t2:
    t1 = math.ceil(t1)
    t2 = math.floor(t2)
    for i in range(t1, t2+1):
        if (answ[0]+b*i>0) and (answ[1]-a*i>0):
            j = j+1
            print('t =', i)
            print('(' + str(answ[0]+b*i) + ', ' + str(answ[1]-a*i) + ')')
else:
    t1 = math.floor(t1)
    t2 = math.ceil(t2)
    for i in range(t2, t1+1):
        if (answ[0]+b*i>0) and (answ[1]-a*i>0):
            j = j+1
            print('t =', i)
            print('(' + str(answ[0]+b*i) + ', ' + str(answ[1]-a*i) + ')')

if j == 0:
    print('ЛДУ не имеет решения в натуральных числах')
    
