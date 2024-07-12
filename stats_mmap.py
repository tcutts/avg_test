import numpy as np

file_path = '/tmp/data.bin'

with open(file_path, 'r+b') as file:
   long_integers = np.memmap(file, dtype=np.int64, mode="r")

mean = np.mean(long_integers)
std_dev = np.std(long_integers)

print("Mean:", mean)
print("Standard Deviation:", std_dev)
