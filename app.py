
# from flask import Flask
# import subprocess

# app = Flask(__name__)

# @app.route("/")
# def wisecow():
#     # Run fortune | cowsay directly
#     result = subprocess.run(
#         "fortune | cowsay",
#         shell=True,
#         capture_output=True,
#         text=True
#     )
#     return f"<pre>{result.stdout}</pre>"

# @app.route("/health")
# def health():
#     return "OK"

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=3000)
from flask import Flask
import subprocess
import os

app = Flask(__name__)

@app.route("/")
def wisecow():
    # Always reference the script inside container (/app/wisecow.sh)
    script_path = os.path.join(os.path.dirname(__file__), "wisecow.sh")
    result = subprocess.run(
        [script_path],
        capture_output=True,
        text=True
    )
    return f"<pre>{result.stdout}</pre>"

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
