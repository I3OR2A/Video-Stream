import os
from functools import wraps

import yaml
from flask import Flask, render_template, request, jsonify, Response, current_app, Blueprint
from flask_sqlalchemy import SQLAlchemy, Model
import datetime
import cv2

from flask.json import JSONEncoder as BaseJSONEncoder
import decimal
import uuid

from sqlalchemy import DateTime, Numeric, Date, Time


def queryToDict(models):
    if (isinstance(models, list)):
        if (isinstance(models[0], Model)):
            lst = []
            for model in models:
                gen = model_to_dict(model)
                dit = dict((g[0], g[1]) for g in gen)
                lst.append(dit)
            return lst
        else:
            res = result_to_dict(models)
            return res
    else:
        if (isinstance(models, Model)):
            gen = model_to_dict(models)
            dit = dict((g[0], g[1]) for g in gen)
            return dit
        else:
            res = dict(zip(models.keys(), models))
            find_datetime(res)
            return res


# 当结果为result对象列表时，result有key()方法
def result_to_dict(results):
    res = [dict(zip(r.keys(), r)) for r in results]
    # 这里r为一个字典，对象传递直接改变字典属性
    for r in res:
        find_datetime(r)
    return res


def model_to_dict(model):  # 这段来自于参考资源
    for col in model.__table__.columns:
        if isinstance(col.type, DateTime):
            value = convert_datetime(getattr(model, col.name))
        elif isinstance(col.type, Numeric):
            value = float(getattr(model, col.name))
        else:
            value = getattr(model, col.name)
        yield (col.name, value)


def find_datetime(value):
    for v in value:
        if (isinstance(value[v], datetime.datetime)):
            value[v] = convert_datetime(value[v])  # 这里原理类似，修改的字典对象，不用返回即可修改


def convert_datetime(value):
    if value:
        if (isinstance(value, (datetime.datetime, DateTime))):
            return value.strftime("%Y-%m-%d %H:%M:%S")
        elif (isinstance(value, (datetime.datetime.date, Date))):
            return value.strftime("%Y-%m-%d")
        elif (isinstance(value, (Time, datetime.datetime.time))):
            return value.strftime("%H:%M:%S")
    else:
        return ""


class ResponseCode(object):
    Success = 0  # 成功
    Fail = -1  # 失败
    NoResourceFound = 40001  # 未找到资源
    InvalidParameter = 40002  # 参数无效
    AccountOrPassWordErr = 40003  # 账户或密码错误
    VerificationCodeError = 40004  # 验证码错误
    PleaseSignIn = 40005  # 请登陆
    WeChatAuthorizationFailure = 40006  # 微信授权失败
    InvalidOrExpired = 40007  # 验证码过期
    MobileNumberError = 40008  # 手机号错误
    FrequentOperation = 40009  # 操作频繁,请稍后再试


class ResponseMessage(object):
    Success = "成功"
    Fail = "失败"
    NoResourceFound = "未找到资源"
    InvalidParameter = "参数无效"
    AccountOrPassWordErr = "账户或密码错误"
    VerificationCodeError = "验证码错误"
    PleaseSignIn = "请登陆"


class ResMsg(object):
    """
    封装响应文本
    """

    def __init__(self, data=None, code=ResponseCode.Success, rq=request):
        # 获取请求中语言选择,默认为中文
        self.lang = rq.headers.get("lang",
                                   current_app.config.get("LANG", "zh_CN")
                                   )
        self._data = data
        self._msg = current_app.config[self.lang].get(code, None)
        self._code = code

    def update(self, code=None, data=None, msg=None):
        """
        更新默认响应文本
        :param code:响应编码
        :param data: 响应数据
        :param msg: 响应消息
        :return:
        """
        if code is not None:
            self._code = code
            # 获取对应语言的响应消息
            self._msg = current_app.config[self.lang].get(code, None)
        if data is not None:
            self._data = data
        if msg is not None:
            self._msg = msg

    def add_field(self, name=None, value=None):
        """
        在响应文本中加入新的字段，方便使用
        :param name: 变量名
        :param value: 变量值
        :return:
        """
        if name is not None and value is not None:
            self.__dict__[name] = value

    @property
    def data(self):
        """
        输出响应文本内容
        :return:
        """
        body = self.__dict__
        body["data"] = body.pop("_data")
        body["msg"] = body.pop("_msg")
        body["code"] = body.pop("_code")
        return body


class JSONEncoder(BaseJSONEncoder):
    """
    重新default方法，支持更多的转换方法
    """

    def default(self, o):
        """
        如有其他的需求可直接在下面添加
        :param o:
        :return:
        """
        if isinstance(o, datetime.datetime):
            # 格式化时间
            return o.strftime("%Y-%m-%d %H:%M:%S")
        if isinstance(o, datetime.date):
            # 格式化日期
            return o.strftime('%Y-%m-%d')
        if isinstance(o, decimal.Decimal):
            # 格式化高精度数字
            return str(o)
        if isinstance(o, uuid.UUID):
            # 格式化uuid
            return str(o)
        if isinstance(o, bytes):
            # 格式化字节数据
            return o.decode("utf-8")
        return super(JSONEncoder, self).default(o)


def route(*args, **kwargs):
    """
    路由设置,统一返回格式
    :param bp: 蓝图
    :param args:
    :param kwargs:
    :return:
    """
    kwargs.setdefault('strict_slashes', False)

    def decorator(f):
        @app.route(*args, **kwargs)
        @wraps(f)
        def wrapper(*args, **kwargs):
            rv = f(*args, **kwargs)
            # 响应函数返回整数和浮点型
            if isinstance(rv, (int, float)):
                res = ResMsg()
                res.update(data=rv)
                return jsonify(res.data)
            # 响应函数返回元组
            elif isinstance(rv, tuple):
                # 判断是否为多个参数
                if len(rv) >= 3:
                    return jsonify(rv[0]), rv[1], rv[2]
                else:
                    return jsonify(rv[0]), rv[1]
            # 响应函数返回字典
            elif isinstance(rv, dict):
                return jsonify(rv)
            # 响应函数返回字节
            elif isinstance(rv, bytes):
                rv = rv.decode('utf-8')
                return jsonify(rv)
            else:
                return jsonify(rv)

        return wrapper

    return decorator


def read_yaml(config_name, config_path):
    """
    config_name:需要读取的配置内容
    config_path:配置文件路径
    """
    if config_name and config_path:
        with open(config_path, 'r', encoding='utf-8') as f:
            conf = yaml.safe_load(f.read())
        if config_name in conf.keys():
            return conf[config_name.upper()]
        else:
            raise KeyError('未找到对应的配置信息')
    else:
        raise ValueError('请输入正确的配置名称或配置文件路径')


config_path = None
config_name = 'DEVELOPMENT'

app = Flask(__name__)
# 读取配置文件
if not config_path:
    pwd = os.getcwd()
    config_path = os.path.join(pwd, 'config/config.yaml')
if not config_name:
    config_name = 'PRODUCTION'

# 读取配置文件
conf = read_yaml(config_name, config_path)
app.config.update(conf)

# 读取msg配置
with open(app.config['RESPONSE_MESSAGE'], 'r', encoding='utf-8') as f:
    msg = yaml.safe_load(f.read())
    app.config.update(msg)

# 返回json格式转换
app.json_encoder = JSONEncoder

# MySql datebase
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://root:root@localhost:3306/video"

db = SQLAlchemy(app)


# 模型( model )定義
class Camera(db.Model):
    __tablename__ = 'tbl_camera_info'
    pid = db.Column(db.Integer, primary_key=True)
    type_id = db.Column(db.Integer, nullable=False)
    hostname = db.Column(
        db.String(20), nullable=False)
    ip_address = db.Column(
        db.String(20), nullable=False)
    port = db.Column(db.Integer, nullable=False)
    url = db.Column(
        db.String(255), nullable=False)
    remark = db.Column(
        db.String(255), nullable=False)
    update_user = db.Column(
        db.String(20), nullable=False)
    update_time = db.Column(
        db.DateTime, onupdate=datetime.datetime.now, default=datetime.datetime.now)
    create_time = db.Column(
        db.DateTime, default=datetime.datetime.now)

    def __init__(self, type_id, hostname, ip_address, port, url, remark, update_user):
        self.type_id = type_id
        self.hostname = hostname
        self.ip_address = ip_address
        self.port = port
        self.url = url
        self.remark = remark
        self.update_user = update_user


# @app.route('/create_table/', methods=["GET"])
@route('/create_table/', methods=["GET"])
def create_table():
    # Create data
    db.create_all()

    return 'ok'


@route('/test/', methods=["GET"])
def test():
    """
    测试返回不同的类型
    :return:
    """
    res = ResMsg()
    now = datetime.datetime.now()
    date = datetime.datetime.now().date()
    test_dict = dict(now=now, date=date)
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=test_dict)
    # 此处不再需要用jsonify，如果需要定制返回头或者http响应如下所示
    # return res.data,200,{"token":"111"}
    return res.data


@route('/test2/', methods=["GET"])
def test2():
    """
    测试返回不同的类型
    :return:
    """
    res = ResMsg()
    camera = Camera(1, '192.168.1.81', '192.168.1.81', 554,
                    'rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1', 'test', '1')
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    # 此处不再需要用jsonify，如果需要定制返回头或者http响应如下所示
    # return res.data,200,{"token":"111"}
    return res.data


@route('/camera/<int:pid>', methods=["GET"])
def query_camera(pid):
    camera = Camera.query.filter_by(pid=pid).first()

    res = ResMsg()
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    return res.data


@route('/camera/query_all', methods=["GET"])
def query_all():
    camera = Camera.query.all()

    res = ResMsg()
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    return res.data


@route('/camera/add_camera', methods=["POST"])
def add_camera():
    # camera = Camera(1, '192.168.1.81', '192.168.1.81', 554,
    #                 'rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1', 'test', '1')
    camera = Camera(int(request.form['type_id']), request.form['hostname'], request.form['ip_address'],
                    int(request.form['port']), request.form['url'], request.form['remark'], request.form['update_user'])
    db.session.add(camera)
    db.session.commit()

    res = ResMsg()
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    return res.data


@route('/camera/update_camera', methods=["PUT"])
def update_camera():
    # camera = Camera(1, '192.168.1.81', '192.168.1.81', 554,
    #                 'rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1', 'test', '1')
    camera = Camera.query.filter_by(pid=int(request.form['pid'])).first()
    camera.type_id = int(request.form['type_id'])
    camera.hostname = request.form['hostname']
    camera.ip_address = request.form['ip_address']
    camera.port = int(request.form['port'])
    camera.url = request.form['url']
    camera.remark = request.form['remark']
    camera.update_user = request.form['update_user']
    # camera = Camera(int(request.form['type_id']), request.form['hostname'], request.form['ip_address'],
    # int(request.form['port']), request.form['url'], request.form['remark'], request.form['update_user'])
    db.session.add(camera)
    db.session.commit()

    res = ResMsg()
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    return res.data


@route('/camera/<int:pid>', methods=["DELETE"])
def delete_camera(pid):
    camera = Camera.query.filter_by(pid=pid).first()
    db.session.delete(camera)
    db.session.commit()

    res = ResMsg()
    # 此处只需要填入响应状态码,即可获取到对应的响应消息
    res.update(code=ResponseCode.Success, data=queryToDict(camera))
    return res.data


def find_camera(id):
    cameras = ['rtsp://admin:dh123456@192.168.1.81:554/cam/realmonitor?channel=1&subtype=1']
    return cameras[int(id)]


# for cctv camera use rtsp://username:password@ip_address:554/user=username_password='password'_channel
# =channel_number_stream=0.sdp' instead of camera for webcam use zero(0)


def gen_frames(camera_id):
    cam = find_camera(camera_id)
    cap = cv2.VideoCapture(cam)

    while True:
        # for cap in caps:
        # # Capture frame-by-frame
        success, frame = cap.read()  # read the camera frame
        if not success:
            break
        else:
            ret, buffer = cv2.imencode('.jpg', frame)
            frame = buffer.tobytes()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')  # concat frame one by one and show result


# @app.route('/video_feed/<string:id>/', methods=["GET"])
@route('/video_feed/<string:id>/', methods=["GET"])
def video_feed(id):
    """Video streaming route. Put this in the src attribute of an img tag."""
    return Response(gen_frames(id),
                    mimetype='multipart/x-mixed-replace; boundary=frame')


# @app.route('/', methods=["GET"])
@route('/', methods=["GET"])
def index():
    return render_template('index.html')


if __name__ == '__main__':
    app.run()
