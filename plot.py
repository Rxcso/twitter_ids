#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math
import matplotlib.pyplot as plt
import brewer2mpl
import datetime
import time
import sys


start_timestamp = time.mktime(datetime.datetime(2006,3,21).timetuple())
x_axis = []
y_axis = []

with open("output.csv", "r") as filename:
    for i in filename.readlines():
        i = i.strip().split(",")
        date = datetime.datetime.strptime(i[0], "%Y-%m-%d %H:%M:%S")
        tweet_id = i[1]
        print int(time.mktime(date.timetuple()) - start_timestamp), tweet_id

        x_axis.append(date)
        #y_axis.append(float(tweet_id))
        y_axis.append(math.log(float(tweet_id)))

# queremos color
set2 = brewer2mpl.get_map('Set2', 'qualitative', 8).mpl_colors
color = set2[0]

fig, ax = plt.subplots(1)

plt.plot(x_axis, y_axis, linewidth=3, marker='o', markersize=10.0, color=color)
plt.xticks(rotation="270")
plt.ylabel(u"Tweet id")
plt.title(u'Incremento de tweet_id en el tiempo')
plt.tight_layout()
plt.savefig("timeline.png")
