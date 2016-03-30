# Raspberry Pi Sensor JNI

Install DHT11 JNI library:

    cd ~
    git clone git://github.com/macdidi5/PiSensorJNI.git
    cd PiSensorJNI
    chmod +x build.sh
    sudo ./build.sh
    
Usage:

1. Create the following pacakge and Java class:

        package net.macdidi5.rpi.sensor.dht11;
    
        // DHT11 溫、濕度感應器類別
        public class DHT11SensorReader {
            // 使用 C 撰寫的方法
            public static native float[] readData(int pin);
        }

2. x
3. x
4. x
5. x

