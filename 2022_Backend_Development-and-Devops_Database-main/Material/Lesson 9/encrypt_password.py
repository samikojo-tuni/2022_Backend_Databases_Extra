'''
Input:
password: user inputted plain text password
pepper: secret stored in the backend application. This is NOT stored in the database. Can be shared
between every password or can be generated
salt: randomly generated sectet which is unique for each password and is stored in the database
iteration_count: how many times the algorithm is executed for the password

Output: The password hash (an encrypted password) which can be stored in the database

pseudo code:
Used algorithm: SHA-512
hash = sha512(salt+password+pepper)
while iteration_count > 0:
    hash = sha512(hash)
    iteration_count--
'''
import mariadb
import sys
import os
import hashlib
import binascii

pepper = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
iterations = 100000

def main():
  # Connect to MariaDB Platform
  try:
    conn = mariadb.connect(
        user="admin",
        password="password",
        host="127.0.0.1",
        port=3306,
        database="shop"
    )

    conn.autocommit = False

  except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

  email = "erik.example@email.com"
  password = "qwerty123"

  #add_user(conn, email, password)
  print("Did passwords match?", check_password(conn, email, password))

# password: The one user inputted, plain text
def check_password(conn, email, password):
  cursor = conn.cursor()
  query = "SELECT password FROM user WHERE email = ?;"
  cursor.execute(query, (email,))
  row = cursor.fetchone()
  stored_pw = row[0]

  salt = stored_pw[:64]
  stored_pw = stored_pw[64:]

  password = password + pepper

  pw_hash = calculate_hash(password, salt, iterations).decode("ascii")

  return pw_hash == stored_pw

def add_user(conn, email, password):
  query = "INSERT INTO user(email, password) VALUES (?, ?);"
  hashed_pw = hash_password(password)
  cursor = conn.cursor()
  cursor.execute(query, (email, hashed_pw))
  conn.commit()


def hash_password(password):
  # 1. Generate the salt
  salt = os.urandom(60)  # The size is not that important.
  salt = hashlib.sha256(salt)
  salt = salt.hexdigest()  # Converts the hash to string format (hex)

  password = password + pepper
  pw_hash = calculate_hash(password, salt, iterations)
  return (salt.encode("ascii") + pw_hash).decode("ascii")  # returns the password in hexadecimal string


def calculate_hash(password, salt, iterations):
  hashed_pw = hashlib.pbkdf2_hmac("sha512", password.encode("utf-8"), salt.encode("ascii"), iterations)
  return binascii.hexlify(hashed_pw)


if __name__ == "__main__":
  main()
