from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/check_status', methods=['POST'])
def check_status():
    try:
        response = requests.get('https://more-eval-server-app.azurewebsites.net/')
        status_code = response.status_code
        message = response.text
    except requests.exceptions.RequestException as e:
        status_code = 'Error'
        message = str(e)
    return render_template('index.html', status_code=status_code, message=message)

if __name__ == '__main__':
     app.run()
