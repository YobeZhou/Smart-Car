#! /usr/bin/python
# -*- coding:utf-8 -*-
import RPi.GPIO as GPIO
import time


GPIO.setmode(GPIO.BCM)
GPIO.setup(22, GPIO.OUT, initial = GPIO.LOW)
GPIO.setup(23, GPIO.IN)

def Ranging():   #超声波测量距离
    GPIO.output(22, GPIO.HIGH)
    time.sleep(0.000010)
    GPIO.output(22, GPIO.LOW)
    t = time.time()
    while not GPIO.input(23):
        t_c = time.time()
	if t_c - t > 1:
	    return 1000.00
    t_1 = time.time()
    while GPIO.input(23):
        pass
    t_2 = time.time()
    return (t_2 - t_1) * 17000

if __name__ == '__main__':
    while 1:
	d = Ranging()
	time.sleep(0.05)
	d_1 = Ranging()
	dt = abs(d - d_1)
	if dt > 20.00:
	    print dt
	else:
	    print  '############################', d
