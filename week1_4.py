R = int(input())
K = int(input())
N = int(input())
print('cakes_amount =', N)
print('rubles =', (R*100+K)*N//100 )
print('kopeeks =',(R*100+K)*N%100 )