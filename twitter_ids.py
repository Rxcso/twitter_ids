#!/usr/bin/env python

import numpy as np
import api
import config
import requests
import codecs
import json
import sys
import datetime
import time

oauth = api.get_oauth()


def extract_date(tweet):
    print tweet
    sys.exit()
    date = tweet['created_at']
    r = datetime.datetime.strptime(date, "%a %b %d %H:%M:%S +%f %Y")
    r = datetime.datetime(r.year, r.month, r.day)
    return r

def get_tweet(tweet_id):
    url = "https://api.twitter.com/1.1/search/tweets.json"

    success = "false"
    while success != "true":
        payload = { 
            'q': 'the',
            'since_id': tweet_id - 1,
            }
        r = requests.get(url=url, auth=oauth, params=payload)
        result = json.loads(r.text)
        if "errors" in result:
            print "Tweet %i does not exist" % tweet_id
            success = "false"
            tweet_id += 1
        else:
            success = "true"
            date = extract_date(result)
            # write date and tweet_id to file
            out = str(date) + "," + str(tweet_id) + "\n"
            f = codecs.open("output.csv", "a", "utf8")
            f.write(out)
            f.close()
        time.sleep(6)


for i in np.logspace(1,20, num=20):
    get_tweet(i)
