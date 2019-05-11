#include <Wire.h>
#include <ServoDriver.h>
#include "Smartcar.h"

void setup()
{
  Serial.begin(9600); // 9600 bps
  // Serial.println("[initParseData]");
  /***************初始化电机参数*****************/
  pinMode(PinPWMA, OUTPUT); pinMode(PinPWMB, OUTPUT);
  pinMode(PinDirA, OUTPUT); pinMode(PinDirB, OUTPUT);
  digitalWrite(PinDirA, HIGH); digitalWrite(PinDirB, HIGH);
  digitalWrite(PinPWMA, LOW); digitalWrite(PinPWMB, LOW);

  pinMode(PIN_LED, OUTPUT); //初始化PIN_LED引脚模式为输出

  pwm.begin();
  pwm.setPWMFreq(60);  // servos run at 50 Hz
}


/*
  电机控制
*/
void tick_car_control()
{
  if (JogFlag == true) {
    stopFlag = false;
    if (JogTimeCnt <= 0) {
      JogFlag = false; stopFlag = true;
    }
    JogTimeCnt--;
  }
  if (stopFlag == false) {
    analogWrite(PinPWMA, spdTargetA);
    analogWrite(PinPWMB, spdTargetA);
  }
  else {
    JogTimeCnt = 0;
    analogWrite(PinPWMA, 0);
    analogWrite(PinPWMB, 0);
  }
}

/**
 * 输入函数
 */
void Input(){
   while (Serial.available() > 0) {
    inputByte = Serial.read();
    delay(30);
    if (isDigit(inputByte)) {
      Buffer += (char)inputByte;
    }
    angle = Buffer.toInt();
  }
  if (angle >= SERVOMIN && angle <= SERVOMAX) {
    angle_h = angle;
  }
}
/*
  主控制
*/
void control() {

  if (inputByte >= 48 && inputByte <= 57) {
    switch (inputByte) {
      case '0': analogWrite (PinPWMA, 0); analogWrite(PinPWMB, 0); stopFlag = true; JogTimeCnt = 0; Serial.println("Stop!"); break; //停止
      case '1': digitalWrite(PinDirA, HIGH); digitalWrite(PinDirB, HIGH); JogTimeCnt = 50; JogFlag = true; break; //后退
      case '2': digitalWrite(PinDirA, LOW); digitalWrite(PinDirB, LOW); JogTimeCnt = 50; JogFlag = true; break; //前进
      case '3': digitalWrite(PinDirA, HIGH); digitalWrite(PinDirB, LOW); spdTargetA = 900; JogTimeCnt = 50; JogFlag = true; break; // 左转
      case '4': digitalWrite(PinDirA, LOW); digitalWrite(PinDirB, HIGH); spdTargetB = 800; JogTimeCnt = 50; JogFlag = true; break; //右转
      case '5': spdTargetA += 25; if (spdTargetA > MOTORMAX) spdTargetA = MOTORMAX; spdTargetB = spdTargetA; break; //加速
      case '6': spdTargetA -= 25; if (spdTargetA < MOTORMIN) spdTargetA = MOTORMIN; spdTargetB = spdTargetA; break; //减速
      case '7': angle_c += 20; if (angle_c > SERVOMAX)  angle_c = SERVOMAX; break;  //舵机角度累加
      case '8': angle_c -= 20; if (angle_c < SERVOMIN)  angle_c = SERVOMIN; break; //舵机角度累减
      case '9': sensor_info(); break;
      //case '10': digitalWrite(PIN_LED, HIGH); break;
      default: break;
    }
  }
}

void sensor_info() {
  /******************************** DHT_11 ****************************************/

bgn:
  pinMode(DHT11, OUTPUT);
  digitalWrite(DHT11, LOW);
  delay(20);//输出低电平20ms（>18ms）
  digitalWrite(DHT11, HIGH);
  delayMicroseconds(40);//输出高电平40μs
  digitalWrite(DHT11, LOW);
  pinMode(DHT11, INPUT); //设置接口模式：输入
  loopCnt = 10000;//高电平响应信号

  while (digitalRead(DHT11) != HIGH)
  {
    if (loopCnt-- == 0)
    {
      //如果长时间不返回高电平，输出个提示，重头开始。
      Serial.println("HIGH");
      goto bgn;
    }
  }
  //低电平响应信号
  loopCnt = 30000;
  while (digitalRead(DHT11) != LOW)
  {
    if (loopCnt-- == 0)
    {
      //如果长时间不返回低电平，输出个提示，重头开始。
      Serial.println("LOW");
      goto bgn;
    }
  }
  //开始读取bit1-40的数值
  for (int i = 0; i < 40; i++)
  {
    while (digitalRead(DHT11) == LOW)
    {}
    //当出现高电平时，记下时间“time”
    time = micros();
    while (digitalRead(DHT11) == HIGH)
    {}
    /*
       当出现低电平，记下时间，再减去刚才储存的time
       得出的值若大于50μs，则为‘1’，否则为‘0’并储存到数组里去
    */
    if (micros() - time > 50)
    {
      chr[i] = 1;
    } else {
      chr[i] = 0;
    }
  }

  //湿度，8位的bit，转换为数值
  humi = chr[0] * 128 + chr[1] * 64 + chr[2] * 32 + chr[3] * 16 + chr[4] * 8 + chr[5] * 4 + chr[6] * 2 + chr[7];

  //温度，8位的bit，转换为数值
  temp = chr[16] * 128 + chr[17] * 64 + chr[18] * 32 + chr[19] * 16 + chr[20] * 8 + chr[21] * 4 + chr[22] * 2 + chr[23];

  //校对码，8位的bit，转换为数值
  tol = chr[32] * 128 + chr[33] * 64 + chr[34] * 32 + chr[35] * 16 + chr[36] * 8 + chr[37] * 4 + chr[38] * 2 + chr[39];

  /******************************** HC_SR504 ****************************************/
  pinMode(Sensor, INPUT);
  int SensorState = digitalRead(Sensor);
  if (SensorState == 0) {
    Serial.println("There's no one around.");
  }
  if (SensorState == 1) {
    Serial.println("There is anyone here!");

    digitalWrite(PIN_LED, HIGH);
    delay(15);
    digitalWrite(PIN_LED, LOW);

  }
  Serial.println(SensorState);
  //输出：温度、湿度、校对码
  Serial.print("Temperature:");
  Serial.print(temp);
  Serial.println(" C");
  Serial.print("humidity:");
  Serial.print(humi);
  Serial.println(" %");
  // Serial.print("tol:");
  // Serial.println(tol);
  //校对码，没用上
  //理论上，湿度+温度=校对码
  //如果数值不相等，说明读取的数据有错。
  /* if (temp > 30) {
     Serial.println("Temp is too hight!!");
     pinMode(buff,OUTPUT);
     tone(buff,temp*80); //输出频率
     digitalWrite(PIN_LED, HIGH);
     delay(10);
     digitalWrite(PIN_LED, LOW);
    }*/

}

/*
  舵机控制
*/
void sg_90() {
  pwm.setPWM(0, 0, angle_c);
  if (angle_h >= SERVOMIN && angle_h <= SERVOMAX) {
    // pwm.setPWM(0, 0, number);
    pwm.setPWM(15, 0, angle_h);
    //Serial.print("Angle:");
    //Serial.println(number);
    delay(200);
  }
}



void loop()
{
  Input();
  tick_car_control();
  control();
  sg_90();
  Buffer = "";
}


