from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def hello_world():
    public_ip = requests.get('https://api.ipify.org').text
    return f'Hello, World! My public IP is: {public_ip}'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
