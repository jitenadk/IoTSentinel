from flask import Flask, render_template, request
from module1 import scan_network, check_vulnerabilities

app = Flask(__name__, template_folder="../templates")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/scan', methods=['POST'])
def scan():
    ip_range = request.form.get('ip_range')
    devices = scan_network(ip_range)
    for device in devices:
        device['vulnerabilities'] = check_vulnerabilities(device)
    return render_template('results.html', devices=devices)

def start_server():
    app.run(debug=True)
