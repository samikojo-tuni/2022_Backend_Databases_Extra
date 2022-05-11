from http.server import BaseHTTPRequestHandler, HTTPServer
from unqlite import UnQLite
from create_content import db_path

host_name = "localhost"
server_port = 8080

class BlogServer(BaseHTTPRequestHandler):
  def do_GET(self):
    self.send_response(200)
    self.send_header("Content-type", "text/html")
    self.end_headers()

    self.wfile.write(bytes("<html><head><title>My blog</title></head>", "utf-8"))
    self.wfile.write(bytes("<body>", "utf-8"))
    self.wfile.write(bytes("<h1>Database blog</h1>", "utf-8"))

    db = UnQLite(db_path)
    posts = db.collection("posts")
    if not posts.exists():
      self.wfile.write(bytes("<p>Unfortunately the blog database is empty :( <br>Come back later.</p>", "utf-8"))
    else:
      for post in posts:
        self.wfile.write(bytes(f"<h2>{post['headline']}</h2>", "utf-8"))
        self.wfile.write(bytes(f"<p>Created by: {post['created_by']} at {post['created_at']}</p>", "utf-8"))
        self.wfile.write(bytes(post['content'], "utf-8"))

    self.wfile.write(bytes("</body></html>", "utf-8"))


def main():
  web_server = HTTPServer((host_name, server_port), BlogServer)
  print(f"Web server started at {host_name}:{server_port}")

  try:
    web_server.serve_forever()
  except KeyboardInterrupt:
    pass

  web_server.server_close()
  print("Server stopped")


if __name__ == "__main__":
  main()
