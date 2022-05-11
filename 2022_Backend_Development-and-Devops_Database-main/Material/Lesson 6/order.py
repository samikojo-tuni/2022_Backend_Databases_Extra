import mariadb
import sys

try:
  connection = mariadb.connect(
    user="product_manager",
    password="password",
    host="127.0.0.1",
    port=3306,
    database="shop"
  )
except mariadb.Error as e:
  print(f"Error connecting to MariaDB Platform: {e}")
  sys.exit(1)

connection.autocommit = False

cursor = connection.cursor()

customer = 10
employee = 2
product = 1
product_count = 7

query = "SELECT availability FROM products WHERE id=?;"
try:
  cursor.execute(query, (product,))
  row = cursor.fetchone()
  # TODO: Add error handling!
  available = int(row[0])

  if available >= product_count:
    query = "INSERT INTO orders (customer_id, employee_id) VALUES (?, ?);"
    cursor.execute(query, (customer, employee))

    # Fetch the id for the order we created above
    order_id = cursor.lastrowid

    query = "INSERT INTO order_details(order_id, product_id, count) VALUES (?, ?, ?);"
    cursor.execute(query, (order_id, product, product_count))

    query = "UPDATE products SET availability = availability - ? WHERE id = ?;"
    cursor.execute(query, (product_count, product))

    print("Order successfully created")
    connection.commit()
  else:
    print("Not enough products to create an order!")
except mariadb.Error as e:
  print(e)
  connection.rollback()

cursor.close()
connection.close()
