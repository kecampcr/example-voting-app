#!/bin/sh
#remove vote file data
rm -f posta
rm -f postb
# Generate vote file data
python make-data.py

VOTE_ENDPOINT=http://192.168.59.113:31000/

# create votes 
ab -n 500 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 400 -c 50 -p postb -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 100 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
echo "Waiting for 2 seconds"
sleep 1
ab -n 100 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 500 -c 50 -p postb -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 100 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
echo "Waiting for 1 second"
sleep 1
ab -n 200 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 650 -c 50 -p postb -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 400 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
echo "Waiting for 2 seconds"
sleep 1
ab -n 350 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 700 -c 50 -p postb -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 300 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
echo "Wait 1 second"
sleep 1
ab -n 350 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 700 -c 50 -p postb -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
ab -n 300 -c 50 -p posta -T "application/x-www-form-urlencoded" $VOTE_ENDPOINT
echo "Finish..."