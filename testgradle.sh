#!/bin/bash
TAG=$1
xvfb-run -a --server-args="-screen 0 1920x1080x24" gradle runWithCucumber -P tags=$TAG ; exit 0
