from flask import Flask, request, render_template
from dao import EmpDAO
from dto import EmpDTO

app=Flask(__name__)