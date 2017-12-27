to flash

sudo avrdude -p atmega32u4 -c avr109 -U flash:w:atreus_zclod.hex -P /dev/ttyACM0
