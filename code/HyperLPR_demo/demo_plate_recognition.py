# 导入包
from hyperlpr import *
# 导入OpenCV库
import cv2
import numpy as np

from PIL import ImageFont
from PIL import Image
from PIL import ImageDraw
fontC = ImageFont.truetype("./Font/platech.ttf", 14, 0)


def drawRectBox(image, rect, addText):
    cv2.rectangle(image, (int(rect[0]), int(rect[1])), (int(rect[2]), int(rect[3])), (0, 0, 255), 2,
                  cv2.LINE_AA)
    cv2.rectangle(image, (int(rect[0] - 1), int(rect[1]) - 16), (int(rect[0] + 115), int(rect[1])), (0, 0, 255), -1,
                  cv2.LINE_AA)
    img = Image.fromarray(image)
    draw = ImageDraw.Draw(img)
    draw.text((int(rect[0] + 1), int(rect[1] - 16)), addText, (255, 255, 255), font=fontC)
    imagex = np.array(img)
    return imagex


# 讀入圖片
image = cv2.imread("data/3.jpg")
# 識別结果
for pstr, confidence, rect in HyperLPR_plate_recognition(image):
    if confidence > 0.7:
        image = drawRectBox(image, rect, pstr + " " + str(round(confidence, 3)))
        print("bounding box:")
        print(rect)
        print("plate_str:")
        print(pstr)
        print("plate_confidence")
        print(confidence)

cv2.imshow("image", image)
cv2.waitKey(0)
