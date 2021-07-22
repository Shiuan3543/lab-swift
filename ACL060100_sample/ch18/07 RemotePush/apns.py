#-*- coding: utf-8 -*-
import socket, ssl, json, struct, binascii

# 開發用
host = ('gateway.sandbox.push.apple.com', 2195)
# 產品用
#host = ('gateway.push.apple.com', 2195)

# 換成正確的 token
token = 'ae8fa52db9da8284faaf32698fb81b956b0c769585cdb13577c86430b1cd01ff'
# 換成正確的金鑰檔名與路徑
key = './key.pem'

# payload
payload = {
  "aps" : {
    "alert" : "Your message here",
    "sound" : "default",
    "badge" : 2
  }
}

#### 以下程式碼不需更改
data = json.dumps(payload)
byteToken = binascii.unhexlify(token)
format = '!BH32sH%ds' % len(data)
noti = struct.pack(format, 0, 32, byteToken, len(data), data)

ssl_sock = ssl.wrap_socket(socket.socket(), certfile = key)
ssl_sock.connect(host)
ssl_sock.write(noti)
ssl_sock.close()