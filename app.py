# from flask import Flask
# import subprocess
# import os

# app = Flask(__name__)

# @app.route("/")
# def wisecow():
#     try:
#         # Since the original script is a web server, we'll extract just the fortune+cowsay part
#         # Get a fortune
#         fortune_result = subprocess.run(
#             ["fortune"],
#             capture_output=True,
#             text=True,
#             timeout=10,
#             env=dict(os.environ, PATH="/usr/games:" + os.environ.get("PATH", ""))
#         )
        
#         if fortune_result.returncode != 0:
#             return f"<pre>Error getting fortune: {fortune_result.stderr}</pre>"
        
#         # Pipe it to cowsay
#         cowsay_result = subprocess.run(
#             ["cowsay", fortune_result.stdout.strip()],
#             capture_output=True,
#             text=True,
#             timeout=10,
#             env=dict(os.environ, PATH="/usr/games:" + os.environ.get("PATH", ""))
#         )
        
#         if cowsay_result.returncode != 0:
#             return f"<pre>Error with cowsay: {cowsay_result.stderr}</pre>"
        
#         return f"<pre>{cowsay_result.stdout}</pre>"
        
#     except subprocess.TimeoutExpired:
#         return "<pre>Error: Command timed out</pre>"
#     except Exception as e:
#         return f"<pre>Unexpected error: {str(e)}</pre>"

# @app.route("/health")
# def health():
#     return "OK"

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=3000, debug=False)

from flask import Flask
import subprocess

app = Flask(__name__)

@app.route("/")
def wisecow():
    # Run fortune | cowsay directly
    result = subprocess.run(
        "fortune | cowsay",
        shell=True,
        capture_output=True,
        text=True
    )
    return f"<pre>{result.stdout}</pre>"

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
