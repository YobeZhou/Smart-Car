#-*- coding:utf-8 -*-
from hc import Ranging as R
import serial
import time


Flag = True
count = 0
bench = 50.00

def run(tar):
    try:
        with serial.Serial('/dev/ttyUSB0',9600 ) as s:
            s.write(tar)
    except Exception, e:
        print e

def Evalue():   #实现测量基准的动态变化
    global bench
    global count
    global Flag
    while True:  #测量数据去杂
    	d_1 = R()
    	time.sleep(0.02)
    	d = R()
    	if abs(d-d_1) < 30.00:
    	    break
    if d < 30 and Flag:
        count += 1
    if count > 8 and Flag:
        bench = 30.00
        count = 0
        Flag = False
    if  Flag == False and d > 50:
        count += 1
    if count > 50 and Flag == False:
        bench = 50.00
        count = 0
        Flag = True
    return d
'''
def Evalue():
    d = R()
    print d
    return d
'''
def auto_run():   #自动驾驶主体
    global bench
    d = Evalue()
    if d < bench:
        run('0')
        time.sleep(0.5)
        while True:
            run('500')
            time.sleep(1)
               # print 'left'
            d = Evalue()
            if d < bench:
                    #print d
                run('110')
                    #print 'right'
                time.sleep(1.5)
                d = Evalue()
                if d < bench:
                    run('280')
                    time.sleep(1)
                    run('2')
                    time.sleep(0.8)
                        #print 'back'
                    continue
                else:
                    run('280')
                    time.sleep(1)
                    run('4')
                    time.sleep(0.4)
                    run('1')
                        #print 'success'
                    break
            else:
                run('280')
                time.sleep(1)
                run('3')
                time.sleep(0.4)
                run('1')
                #print 'success'
                break



if __name__ == '__main__':
    auto_run()
