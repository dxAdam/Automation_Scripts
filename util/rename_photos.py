# A short script I use to rename photos pulled from my Pixel 2 
# so that all photos start with the same prefix and remain in 
# chronological order.
#
# usage: python rename_photos.py <path/to/photo/directory>

import sys
import os

path = sys.argv[1] + "/"
print(path)
for filename in os.listdir(sys.argv[1]):
    new_string = filename.replace('MV', '')       # rename MVIMG -> IMG
    new_string = new_string.replace('PXL', 'IMG') # rename PXL -> IMG
    print(path + new_string)
    os.rename(path + filename, path + new_string)
	
