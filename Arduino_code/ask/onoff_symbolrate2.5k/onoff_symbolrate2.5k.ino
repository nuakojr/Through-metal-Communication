
//This code Transmitts a signal of all 1 and 0 bits
//1010101010
//8-17-2022 Hongzhi Guo
#include<stdlib.h>
#include<stdbool.h>
#include<stdio.h>
#include<math.h>
void setup() {
  // put your setup code here, to run once:
pinMode(11, OUTPUT);
Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:

int input = 13146;
int a[20];

    for(int i=19;i>=0;i--){
      if (i>15){
        onehightolow();
        }
      else{a[i]=input%2;
        input = input/2;
        if(a[i]==0){
          zerolowlow();
         }
        else{
           onehightolow();
            }
        }
      }
   delayMicroseconds(200);
}

//one bit is high to low
void onehightolow(){
  digitalWrite(11, HIGH);
  //delay(1);
  delayMicroseconds(200);
  digitalWrite(11, LOW);
  //delay(1);
  delayMicroseconds(200);
}

//zero bit is high to low
void zerolowlow(){
  digitalWrite(11,LOW);
  //delay(1);
  delayMicroseconds(200);
  //digitalWrite(11,HIGH);
  //delay(1);
  delayMicroseconds(200);
}

// 1 > .9
//This code is not perfect because it does not produce a perfect square wave
