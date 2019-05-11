#! /usr/bin/python
# -*- coding:utf-8 -*-
import RPi.GPIO as GPIO
import time


GPIO.setmode(GPIO.BCM)
GPIO.setup(22, GPIO.OUT, initial = GPIO.LOW)
GPIO.setup(23, GPIO.IN)

def Ranging():
    GPIO.output(22, GPIO.HIGH)
    time.sleep(0.000015)
    GPIO.output(22, GPIO.LOW)
    while not GPIO.input(23):
        pass
    t_1 = time.time()
    while GPIO.input(23):
        pass 
    t_2 = time.time()
    return (t_2 - t_1) * 17000

if __name__ == '__main__':
    while 1:
	print  '############################', Ranging()
	time.sleep(0.5)


