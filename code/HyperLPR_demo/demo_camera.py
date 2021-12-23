# 再将以下代码重新运行一下
import cv2

# Example URLs
# rtsp://192.168.1.81:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif
# rtsp://admin:admin@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1
# rtsp://192.168.1.81:554/live

# url = 'rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1'
url = 'rtsp://tapocamera:062607171@192.168.68.112:554/stream1'
cap = cv2.VideoCapture(url)
while cap.isOpened():
    # Capture frame-by-frame
    ret, frame = cap.read()
    # Display the resulting frame
    cv2.imshow('frame', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    # When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
