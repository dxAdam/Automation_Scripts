import sys
import os

path = sys.argv[1] + "/"
print(path)
for filename in os.listdir(sys.argv[1]):
	new_string = filename.replace('MV', '')
	print(path + new_string)
	os.rename(path + filename, path + new_string)
	