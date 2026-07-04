from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
	print("Hello,Flask app running in Docker Container!!!!")

if __name__ == "__main__":
	app.run(host="0.0.0.0",port=5000)

