"""
Filename: __init__.py
Title: M5_Act_3
Description: MySQL Hardening
Author: Colorado Online
Student Name: [Enter your full name here]
"""
from flask import Flask
import os
import configparser

# app initialization
app = Flask("Sales Web App")
app.secret_key = os.environ['SECRET_KEY']

# db initialization
import mysql.connector
from mysql.connector import Error
import configparser

cfg = configparser.ConfigParser()
cfg.read(os.path.join(os.path.dirname(__file__), 'db.ini'))
section = cfg['mysql']
conn = mysql.connector.connect(
    host=section['host'],
    port=int(section['port']),
    user=section['user'],
    password=section['password'],
    database=section['database']
)

from salesapp import routes