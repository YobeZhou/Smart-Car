#ifndef _MAIN_H__
#define _MAIN_H__

#define PinPWMA 14  //左侧电机
#define PinPWMB 12  //右侧电机
#define PinDirA 15
#define PinDirB 13

#define PIN_LED 16 //定义LED灯：PIN_LED所对应的引脚为16号

#define DHT11 2  //定义DHT11引脚为12号


/************* HC-SR504 *****************/
#define Sensor 0

/*********** SG90 **************/
#define SERVOMIN  110 // this is the 'minimum' pulse length count (out of 4096)
#define SERVOMAX  510 // this is the 'maximum' pulse length count (out of 4096)
ServoDriver pwm = ServoDriver();
int inputByte=0; //从串口接收的bit数据
int angle=280;
int angle_c=280;  //摄像头舵机角度控制
int angle_h = 280; //HC_04舵机角度控制
String Buffer = ""; // 缓冲区

/*********** 初始化电机参数 **************/
#define MOTORMIN  0
#define MOTORMAX  1023
int spdTargetA = 600;
int spdTargetB = 435;
bool stopFlag = true;
bool JogFlag = false;
uint16_t JogTimeCnt = 0;

/*********** DHT11 **************/
int temp;//温度
int humi;//湿度
int tol;//校对码
int j;
unsigned int loopCnt;
int chr[40] = {0};//创建数字数组，用来存放40个bit
unsigned long time;

#endif



void go_forward(){
	setAllLed(COLOR_NONE);
      leftSpeed = LEFT_THROTTLE;
      rightSpeed = RIGHT_THROTTLE;
}

void backwards(){
	      setAllLed(COLOR_RED);
      if (leftSpeed > 0 || rightSpeed > 0)
      {
        leftSpeed = 0;
        rightSpeed = 0;
      }
	         setAllLed(COLOR_RED);
        leftSpeed = -LEFT_THROTTLE;
        rightSpeed = -RIGHT_THROTTLE;
}
	  
void turn_left(){
	      if (leftSpeed < 0)
      {
        leftSpeed = -LEFT_THROTTLE + STEER;
        rightSpeed = -RIGHT_THROTTLE - STEER;
        setLed(COLOR_RED, RIGHT);
      }
      else
      {
        leftSpeed = LEFT_THROTTLE - STEER;
        rightSpeed = RIGHT_THROTTLE + STEER;
        setLed(COLOR_NONE, RIGHT);
      }
      ledBlink(500, COLOR_YELLOW, LEFT);
}


void turn_right(){
	 if (rightSpeed < 0)
      {
        rightSpeed = -LEFT_THROTTLE + STEER;
        leftSpeed = -RIGHT_THROTTLE - STEER;
        setLed(COLOR_RED, LEFT);
      }
      else
      {
        rightSpeed = LEFT_THROTTLE - STEER;
        leftSpeed = RIGHT_THROTTLE + STEER;
        setLed(COLOR_NONE, LEFT);
      }
      ledBlink(500, COLOR_YELLOW, RIGHT);
}
void stop(){
	      if (leftSpeed != 0 || rightSpeed != 0)
      {
        setAllLed(COLOR_NONE);
        leftSpeed = 0;
        rightSpeed = 0;
      }
}