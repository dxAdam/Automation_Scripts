import Adafruit_BBIO.ADC as ADC
import time
from array import *
import numpy as np

rows=32
cols=8

values=np.float16([0]*cols*rows)

ADC.setup()

print("[AIN0   AIN1   AIN2   AIN3   AIN4   AIN5   AIN6   AIN7  ]")

i = 0
while (i < rows):
    values[i*cols+0] = ADC.read("AIN0")
    values[i*cols+1] = ADC.read("AIN1")
    values[i*cols+2] = ADC.read("AIN2")
    values[i*cols+3] = ADC.read("AIN3")
    values[i*cols+4] = ADC.read("AIN4")
    values[i*cols+5] = ADC.read("AIN5")
    values[i*cols+6] = ADC.read("AIN6")
    values[i*cols+7] = ADC.read("AIN7")

    print(values[i*cols:i*cols+8])
    
    time.sleep(0.5)
    i = i + 1
