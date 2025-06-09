from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Welcome to My SaaS Web App</h1>"

@app.route("/about")
def about():
    return "<p>This is a simple SaaS service using Flask and Naver Cloud.</p>"
