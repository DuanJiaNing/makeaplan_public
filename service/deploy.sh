#nohup go run main.go > ./server.log 2>&1 &
#nohup ./GoMailer > server.log 2>&1 &

nohup ./makeaplan_app > ./server.log 2>&1 &
tail -f ./server.log