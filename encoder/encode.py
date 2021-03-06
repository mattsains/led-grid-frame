import sys
import glob
from os import path

from PIL import Image

globs = sys.argv[1::]

files = [file for g in globs for file in glob.glob(g) if path.isfile(file) ]

outwriter = open("out.c", "w")
num = 0
for file in files:
    with Image.open(file) as image:
        pixels = image.getdata()
        
        outwriter.write(f"static const unsigned int data_{num}[{len(pixels)}] = ")
        outwriter.write("{\n")
        for pixel in pixels:
            outwriter.write(str((pixel[0]<<16) + (pixel[1]<<8) + (pixel[2])))
            outwriter.write(",")
        outwriter.write("};\n")
    num+=1
    
outwriter.write(f"static const unsigned int * data[{num}] =")
outwriter.write("{\n");

for i in range(0,num):
    outwriter.write(f"data_{i},")
outwriter.write("};\n")

outwriter.close()