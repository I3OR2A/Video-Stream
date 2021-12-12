# run this program on each RPi to send a labelled image stream
import time

import cv2
import imagezmq

sender = imagezmq.ImageSender(connect_to='tcp://localhost:5555')

dict = {"192.168.1.81:554": {"url": "rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1"}}

print(dict["192.168.1.81:554"]["url"])
cap = cv2.VideoCapture(dict["192.168.1.81:554"]["url"])

rpi_name = "192.168.1.81:554"  # send RPi hostname with each image
time.sleep(2.0)  # allow camera sensor to warm up
while True:  # send images as stream until Ctrl-C
    # Capture frame-by-frame
    ret, frame = cap.read()
    sender.send_image(rpi_name, frame)
