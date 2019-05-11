# -*- coding: utf-8 -*-
import time
import TencentYoutuyun
import urllib

appid = '10083039'
secret_id = 'AKIDazB9tOhgU2KNAh6znMegT0JM8f2AQcx1'
secret_key = 'wc3E9nBMGuIPGrDJ9i6cvylHXXHlzzkH'
userid= '123'

end_point = TencentYoutuyun.conf.API_YOUTU_END_POINT


youtu = TencentYoutuyun.YouTu(appid, secret_id, secret_key, userid, end_point)

'''
ret = youtu.FaceCompare('/car/0.jpg','/car/1.jpg')
print ret['similarity'] > 60.0
'''
def auth_api():   #调用sdk
    res = youtu.FaceCompare('/car/0.jpg','/car/1.jpg')
    print res
    if res['errorcode'] == -1101:
	return
    elif res['similarity'] > 60.0:
	return 'unlock'
    elif res['errorcode'] == 0:
	return 'lock'

def get_img():   #获取图片
    try:
        url = 'http://127.0.0.1:8080/?action=snapshot'
        urllib.urlretrieve(url,'/car/1.jpg')
    except:
	get_img()


def facecheck():
    get_img()
    return auth_api()

if __name__ == '__main__':
    for i in range(10):
	do = facecheck()
	print do
	if do == 'unlock' or do == 'lock':
	    break
