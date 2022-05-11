import hashlib

passwords = ["123456", "123456789", "12345", "qwerty", "password",
             "12345678", "111111", "123123", "1234567890", "1234567"]

for pw in passwords:
  print("MD5: " + hashlib.md5(pw.encode('utf-8')).hexdigest())
  print("SHA1: " + hashlib.sha1(pw.encode('utf-8')).hexdigest())
