# 导入包
from hyperlpr import *
# 导入OpenCV库
import cv2
import numpy as np

from PIL import ImageFont
from PIL import Image
from PIL import ImageDraw

import pytesseract as tess

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


def recoginse_text(image):
    """
    步骤：
    1、灰度，二值化处理
    2、形态学操作去噪
    3、识别
    :param image:
    :return:
    """

    # 灰度 二值化
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # 如果是白底黑字 建议 _INV
    ret, binary = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)

    # 形态学操作 (根据需要设置参数（1，2）)
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (1, 2))  # 去除横向细线
    morph1 = cv2.morphologyEx(binary, cv2.MORPH_OPEN, kernel)
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (2, 1))  # 去除纵向细线
    morph2 = cv2.morphologyEx(morph1, cv2.MORPH_OPEN, kernel)
    cv2.imshow("Morph", morph2)

    # 黑底白字取非，变为白底黑字（便于pytesseract 识别）
    cv2.bitwise_not(morph2, morph2)
    textImage = Image.fromarray(morph2)

    # 图片转文字
    text = tess.image_to_string(textImage, lang="eng")
    print("识别结果：%s" % text)
    return text


# import easyocr
#
# reader = easyocr.Reader(['en'])  # 只需要运行一次就可以将模型加载到内存中
# result = reader.readtext('data/1.jpg')
# print("easyocr:")
# print(result)

# 讀入圖片
image = cv2.imread("data/3.jpg")
# 識別结果
for pstr, confidence, rect in HyperLPR_plate_recognition(image):
    if confidence > 0.7:
        print("bounding box:")
        print(rect)
        print("plate_str:")
        print(pstr)
        print("plate_confidence")
        print(confidence)
        print("tesseract plate_str:")
        print(recoginse_text(image[int(rect[1]):int(rect[3]), int(rect[0]):int(rect[2])]))
        image = drawRectBox(image, rect, pstr + " " + str(round(confidence, 3)))

cv2.imshow("image", image[int(rect[1]):int(rect[3]), int(rect[0]):int(rect[2])])
cv2.imshow("image cropped", image)
cv2.waitKey(0)
