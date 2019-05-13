#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Friday, May 3, 2019

@author: Samuel T Reeves
@email: samtreeves@gmail.com
"""

# I want to scrape the Central Bank of Myanmar
# to create a local database with all the information 
# on MMK exchange rates.  The available data appears to 
# begin 02-01-2018 (dd-mm-yyyy) with significant gaps.

import time
import pandas
import datetime

import urllib

## Define the web address and the date of first entry
url_base = 'http://forex.cbm.gov.mm/api/history/'
db_start = pandas.to_datetime('02-01-2018', format='%d-%m-%Y')


end_date = pandas.to_datetime('today')
total_days = (end_date - db_start).days

# Scrape every page of the domain, waiting 3 seconds between
# pages.
for day in range(0,total_days-1):
    
    date = db_start + datetime.timedelta(days=day)
    date_str = date.strftime('%d-%m-%Y')
    title = date.strftime('%Y.%m.%d')
    
    time.sleep(3)
    response = urllib.request.urlopen(url_base + date_str)
    
    web_content = response.read()
    html_str = web_content.decode()
    with open(title + '.json', "w") as entry:
        print(html_str, file=entry)
