export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt

echo "Compile net/macdidi5/rpi/sensor/dht11/DHT11SensorReader.java"
javac net/macdidi5/rpi/sensor/dht11/DHT11SensorReader.java

echo "Create JNI header file DHT11SensorReader.h"
javah -d net/macdidi5/rpi/sensor/dht11 net.macdidi5.rpi.sensor.dht11.DHT11SensorReader

echo "Create header net/macdidi5/rpi/sensor/dht11/DHT11SensorReader.h"
mv net/macdidi5/rpi/sensor/dht11/net_macdidi5_rpi_sensor_dht11_DHT11SensorReader.h net/macdidi5/rpi/sensor/dht11/DHT11SensorReader.h

echo "Compile net/macdidi5/rpi/sensor/dht11/dht11sensor.c with wiringPi library"
gcc -I $JAVA_HOME/include/ -I $JAVA_HOME/include/linux/ -o net/macdidi5/rpi/sensor/dht11/dht11sensor.so -shared net/macdidi5/rpi/sensor/dht11/dht11sensor.c -l wiringPi

echo "Copy new org/mandfer/dht11/dht11sensor.so in /usr/lib/"
sudo cp net/macdidi5/rpi/sensor/dht11/dht11sensor.so /usr/lib/

echo "Create symbolic link for the library"2
sudo ln -s /usr/lib/dht11sensor.so /usr/lib/libdht11sensor.so

echo "Updated library:"
ls -lart /usr/lib/libdht*