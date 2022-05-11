from unqlite import UnQLite


db_path = "Material/Lesson 8/Blog/blog.db"

# Creates the blog database
def main():
  db = UnQLite(db_path)
  create_data(db)

def create_data(db):
  posts = db.collection("posts")

  # Check if posts collection exists. It it doesn't, create it.
  if not posts.exists():
    posts.create()

  posts.store(
    [
      {
        "headline": "NoSQL can be useful but it doesn\'t fit to all use cases",
        "created_at": "2022-02-24T12:42:00",
        "created_by": "Sami",
        "content": '''
        <h3>Benefits of NoSQL</h3>
        <ul>
        <li>Flexibility</li>
        <li>Developer friendlyness</li>
        <li>Scalability</li>
        <li>Often no need for object mapping (if data is already presented as an object)</li>
        </ul>
        <h3>Benefits of SQL</h3>
        <ul>
        <li>Validity of data</li>
        <li>Security</li>
        <li>Type safety</li>
        </ul>
        <p>
        Both relational databases and NoSQL databases can perform well. The correct type of database should
        be chosen by the requirements of the system they are implemented in. E.g. a blog or a social media
        platform can benefit from unstructured NoSQL database, but it fits poorly to a financial application.
        Read more about NoSQL and relational databases from <a href="https://www.mongodb.com/nosql-explained/nosql-vs-sql#differences-between-sql-and-nosql">here</a>.
        </p>
        '''
      },
      {
        "headline": "Most popular programming languages",
        "created_at": "2021-12-20",
        "created_by": "Unknown",
        "content": '''
        <h3>List by Google, source unknown</h3>
        <ol>
        <li>Python	30.21 %</li>
        <li>Java	17.82 %</li>
        <li>JavaScript	9.16 %</li>
        <li>C#	7.53 %</li>
        <li>C/C++	6.82 %</li>
        <li>PHP	5.84 %</li>
        <li>R	3.81 %</li>
        <li>Swift	2.03 %</li>
        <li>Objective-C	2.02 %</li>
        <li>Matlab	1.73 %</li>
        </ol>
        '''
      }
    ]
  )


if __name__ == "__main__":
  main()
