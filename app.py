import flask, pytz, prometheus_client
from flask import Flask, send_file, request
from pytz import timezone
from datetime import datetime
from prometheus_client import generate_latest, Counter

app = Flask(__name__)

REQUESTS = Counter('http_requests_total', 'Total HTTP Requests (count)', ['method', 'endpoint', 'status_code'])

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/homersimpson")
def homer():
    filename = "Homer_Simpson_2006.png"
    REQUESTS.labels(method='GET', endpoint="/homersimpson", status_code=200).inc()
    return send_file(filename, mimetype='image/png')

@app.route('/covilha')
def covilha_time():
    format = "%Y-%m-%d %H:%M:%S %Z%z"
    now_utc = datetime.now(timezone('UTC'))
    REQUESTS.labels(method='GET', endpoint="/covilha", status_code=200).inc()

    return now_utc.strftime(format)

@app.route('/metrics')
def metrics():
    REQUESTS.labels(method='GET', endpoint="/metrics", status_code=200).inc()
    return generate_latest(REQUESTS)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
