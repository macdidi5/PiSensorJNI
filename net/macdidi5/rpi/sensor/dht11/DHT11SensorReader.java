package net.macdidi5.rpi.sensor.dht11;

public class DHT11SensorReader {
    public static native float[] readData(int pin);
}
