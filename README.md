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
    
        public class DHT11SensorReader {
            public static native float[] readData(int pin);
        }

2. Create the following methods to read information:

    public static float[] readData() {
        float[] data = DHT11SensorReader.readData(DTHPIN);
        int stopCounter = 0;
        
        while (!isValid(data)) {
            stopCounter++;
            
            if (stopCounter > 10) {
                System.out.println("Invalid data:" + data[0] + ", " + data[1]);
            }
            
            data = DHT11SensorReader.readData(DTHPIN);
        }
        
        return data;
    }
    
    private static boolean isValid(float[] data) {
        return data[0] > 0 && data[0] < 100 && data[1] > 0 && data[1] < 100;
    }    

3. Load library:

        static {
            System.loadLibrary("dht11sensor");
        }

4. Read temperature & humidity:

        // temperature:[0]
        // humidity:[1]
        float[] readData = readData();
