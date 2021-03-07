#! /usr/bin/env python3
import sys
import glob
from os import path

import math

from PIL import Image

inputFile = sys.argv[1::][0]
outputFile = sys.argv[1::][1]

outwriter = open(outputFile, "w")
num = 0

def convertColor(pixel):
    _25overmax = 26/math.pow(2, 255)
    red = int(pixel[0] / 5)
    green = int(pixel[1] / 5)
    blue = int(pixel[2] / 5)
    
    return (red<<16) + (green<<8) + blue

with Image.open(inputFile) as image:
    for frame in range(0, image.n_frames):
        image.seek(frame)
        # pixels = image.convert().resize((19, 27)).getdata()
        pixels = image.convert().resize((19, 27), Image.NEAREST).getdata()
        
        outwriter.write(f"static const unsigned int data_{num}[{len(pixels)}] = ")
        outwriter.write("{\n")

        result = [str(convertColor(pixel)) for pixel in pixels]
        result.reverse()

        for c in result:
            outwriter.write(c)
            outwriter.write(",")

        outwriter.write("};\n")
        num+=1
    
outwriter.write(f"static const unsigned int * data[{num}] =")
outwriter.write("{\n");

for i in range(0,num):
    outwriter.write(f"data_{i},")
outwriter.write("};\n")

outwriter.close()