#-*- coding :utf-8 -*-
import tornado.web
import tornado.ioloop
import serial
import threading
from auto import auto_run
from face import facecheck
import os

unlock_flag = True
def run_car(tar, x = 0, y = 0):   #小车动作指令
    try:
        with serial.Serial('/dev/ttyUSB0',9600 ) as s:   #串口通信指令
            if x > 40 and y < 0:
                tar = '4'
            elif x < -30 and y < 0:
                tar = '3'
            elif -40 < x < 40 and y < 0:
                tar = '1'
            elif -40 < x < 40 and y > 0:
                tar = '2'
            s.write(tar)
    except Exception, e:
        print e
def Ultrasonic():
    try:
    	with serial.Serial('/dev/ttyUSB0', 9600, timeout = 0.03) as s:
    	    resp = s.read(1000)
    	return resp
    except:
	       pass

class CarController(tornado.web.RequestHandler):
    def get(self):
    	try:
    	    if self.get_argument('Ult',default=[]):
    	        self.write(Ultrasonic())
    	    else:
    	        with open('/car/fangfa_2/webcar.html', 'r') as fp:   #传感器数据获取
    	            self.write(fp.read())
    	except:
    	    pass
    def post(self):
	    global unlock_flag
        x = float(self.get_argument('x'))
        y = float(self.get_argument('y'))
        tar = str(self.get_argument('a'))
        self.write('ok')
	if tar == '233' and unlock_flag:
	    run_car('1')
	    drive_thread.resume()
	elif tar == '23' and unlock_flag:
	    drive_thread.pause()
	elif tar == '38' and unlock_flag == False:
	    os.system('mplayer /car/start.wav')    #执行播放声音
	    tag = True
	    for i in range(10):
		do = facecheck()
		if do == 'unlock':
		    unlock_flag = True
		    os.system('mplayer /car/open.mp3')
		    os.system('mplayer /car/1.wav')
		    tag = False
		    break
		elif do == 'lock':
		    os.system('mplayer /car/31.wav')
		    tag = False
	    if tag:
		    os.system('mplayer /car/3.wav')
	elif tar == '38' and unlock_flag == True:
	    os.system('mplayer /car/4.wav')
	elif tar == '39' and unlock_flag == True:
	    unlock_flag = False
	    os.system('mplayer /car/lock.wav')
	elif tar == '39' and unlock_flag == False:
	    os.system('mplayer /car/already_lock.wav')
	elif unlock_flag:
       	run_car(tar, x = x, y = y)
	else:
	    os.system('mplayer /car/locking.wav')
	    print 'lock'


class web_thread(threading.Thread):   #小车手动驾驶线程
    def __init__(self,thread_ID):
	threading.Thread.__init__(self)
	self.threadID = thread_ID
	self.__running = threading.Event()
	self.__running.set()
    def run(self):
	app = tornado.web.Application([('/', CarController)], static_path='/car/fangfa_2/static', debug=True)
    app.listen(80)
    tornado.ioloop.IOLoop.instance().start()

class Mythread(threading.Thread):    #小车自动驾驶线程
    def __init__(self, thread_ID):
        threading.Thread.__init__(self)
	    self.threadID = thread_ID
	    self.__flag = threading.Event()
    def run(self):
    	while True:
	        self.__flag.wait()   #线程阻塞
	        auto_run()
    def pause(self):
        self.__flag.clear()
    def resume(self):
	    self.__flag.set()

if __name__ == '__main__':
    drive_thread = Mythread(1)
    web_thread = web_thread(2)
    web_thread.start()
    drive_thread.start()
