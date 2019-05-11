import serial


def Ultrasonic():
    try:
        with serial.Serial('/dev/ttyUSB0', 9600, timeout = 1) as s:
            resp = s.read(1000)
        return resp
    except:
        pass


if __name__ == '__main__':
    while True:
        print Ultrasonic()
