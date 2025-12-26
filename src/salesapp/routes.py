"""
Filename: routes.py
Title: M5_Act_3
Description: MySQL Hardening
Author: Colorado Online
Student Name: [Enter your full name here]
"""
from salesapp import app, conn
from flask import render_template, request
from mysql.connector import Error

@app.route("/")
def index():
    try: 
        region = request.args.get("region")
        cursor = conn.cursor(dictionary=True)
        if region: 
            # warning: code vulnerable to SQL Injection!
            cursor.execute(f"""
                SELECT
                    summary_date,
                    total_orders,
                    total_revenue,
                    avg_order_value,
                    top_product_id,
                    top_product_qty,
                    region
                FROM sales_summary
                WHERE region = '{region}'
            """)
        else: 
            cursor.execute("""
                SELECT
                    summary_date,
                    total_orders,
                    total_revenue,
                    avg_order_value,
                    top_product_id,
                    top_product_qty,
                    region
                FROM sales_summary
                ORDER BY summary_date, region
            """)
        rows = cursor.fetchall()
        return render_template("index.html", rows=rows)
    except Error as ex:
        return ex
