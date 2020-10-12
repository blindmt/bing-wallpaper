#!/bin/bash

SAVE_PATH="/tmp/"
BING_URL="https://cn.bing.com" # or www.bing.com

curl -s $BING_URL | ag -o '\/th\?id\=.*?(jpg|png)' | grep UHD | while read f; do
  filename=$(echo $f | ag -o "OHR.*(jpg|png)")
  filename=$(date +"%Y%m%d")_$filename
  echo curl -s $BING_URL/$f -o $SAVE_PATH/$filename
  curl -s $BING_URL/$f -o $SAVE_PATH/$filename
done
