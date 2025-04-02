from flask import Flask, request
from flask_cors import CORS  # Import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

VALID_USERNAME = "admin"
VALID_PASSWORD = "password123"

@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username")
    password = request.form.get("password")

    if username == VALID_USERNAME and password == VALID_PASSWORD:
        return "Login successful", 200
    else:
        return "Invalid username or password", 403

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
