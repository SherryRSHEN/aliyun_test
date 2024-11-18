from flask import Flask
import os
 
app = Flask(__name__)
 
@app.route('/hello/model')
def hello_world():
    return 'Hello World'

@app.route('/hello/internet')
def check_internet_connection():
    response = os.system("ping -c 1 baidu.com")
    if response == 0:
        return 'Connected'
    else:
        return 'Not Connected'
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)  