from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# Database connection
db = mysql.connector.connect(
    host="localhost",
    user="localhost",
    user="root",
    password="Shivam@2607",
    database="library"
)

@app.route('/')
def index():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Books")
    books = cursor.fetchall()
    return render_template('index.html', books=books)

@app.route('/add_book', methods=['POST'])
def add_book():
    title = request.form['title']
    author_id = request.form['author_id']
    isbn = request.form['isbn']
    published_year = request.form['published_year']
    available_copies = request.form['available_copies']

    cursor = db.cursor()
    cursor.execute("INSERT INTO Books (title, author_id, isbn, published_year, available_copies) VALUES (%s, %s, %s, %s, %s)",
                   (title, author_id, isbn, published_year, available_copies))

    db.commit()
    return index()

if __name__ == '__main__':
    app.run(debug=True)
    
