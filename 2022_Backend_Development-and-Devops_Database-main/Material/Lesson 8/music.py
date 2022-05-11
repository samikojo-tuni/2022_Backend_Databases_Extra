from unqlite import UnQLite
from music_data import iron_maiden

db_path = 'Material/Lesson 8/music.db'

def main():
  db = UnQLite(db_path)
  albums = db.collection("albums")
  if not albums.exists():
    create_collection(db, albums, iron_maiden)
    print("Database created")
  else:
    # Database exists, let's query data
    for album in albums.all():
      print("Artist:", album["artist"])
      print("Album:", album["name"])
      print("Released:", album["year"])
      print("Tracks:")
      for track in album["tracks"]:
        print(track["number"], track["name"], track["length"], sep="\t")
      print("")


def create_collection(db, collection, data):
  if not collection.exists():
    collection.create()
  collection.store(data)


# Main is run only if we run this file as a script (not as a module)
if __name__ == "__main__":
  main()
