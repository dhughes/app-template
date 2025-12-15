from flask import Flask, render_template, request, jsonify
import os
from pathlib import Path

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/example', methods=['GET'])
def example_endpoint():
    return jsonify({'message': 'Hello from App Template!'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7999, debug=True)
