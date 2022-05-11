import mariadb
import sys


def main():
  try:
    conn = mariadb.connect(
        user="product_manager",
        password="password",
        host="127.0.0.1",
        port=3306,
        database="shop"
    )

    conn.autocommit = False

  except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

  # name = conn.escape_string("O'Reilly")
  id = "1 OR 1=1; -- "
  name = "Robert'; DROP TABLE customers; --"
  query = "SELECT * FROM customers WHERE first_name = '" + name + "'"
  cursor = conn.cursor()
  cursor.execute(query)
  row = cursor.fetchall()

  print(row)


if __name__ == "__main__":
  main()
