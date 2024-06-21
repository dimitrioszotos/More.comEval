from flask import Flask


app = Flask(__name__)

@app.route('/')
def health_check():
    return "Server is running", 200

if __name__ == '__main__':
    app.run()
