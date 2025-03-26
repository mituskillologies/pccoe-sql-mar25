def square(num):
	sq = num * num
	cu = num ** 3
	return cu, sq
	
n = int(input('Enter the number:'))
c, sq = square(n)
print('Cube and Square is:', c, sq)
