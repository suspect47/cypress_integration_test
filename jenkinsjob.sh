#!/bin/bash

cd $WORKSPACE/cypress && npm i

if [ "$BROWSER" == "CHROME" ]; then
npm run run -- --env host=$HOST,username=$USERNAME,password=$PASSWORD --browser chrome
elif [ "$BROWSER" == "FIREFOX" ]; then
npm run run -- --env host=$HOST,username=$USERNAME,password=$PASSWORD --browser firefox
else
echo "ERROR. Unknown browser."
fi
