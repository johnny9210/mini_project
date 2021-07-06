from flask import Flask, render_template, jsonify
from flask.globals import request
from interpark import name
from selenium import webdriver
import time
from bs4 import BeautifulSoup


app=Flask(__name__)

@app.route('/')
def post():
    return render_template('mini.html')


@app.route('/crawling',methods=["post"])
def crawling():
  word = request.form.get('word')
  return jsonify(name(word))

# @app.route('/my-link/')
# def my_link():
  

#   return jsonify(name('파리'))

# @app.route('/')

if __name__ == '__main__':
    app.run(debug=True)