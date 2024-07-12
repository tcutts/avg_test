import numpy as np

file_path = '/tmp/data.bin'

with open(file_path, 'rb') as file:
   long_integers = np.fromfile(file, dtype=np.int64)

mean = np.mean(long_integers)
std_dev = np.std(long_integers)

print("Mean:", mean)
print("Standard Deviation:", std_dev)
