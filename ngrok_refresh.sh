pid=$(lsof -i:4040 | awk 'NR==2 {print $2}')

if [ -z "$pid" ]; then
  echo "no ngrok in port 4040"
else
  echo "killing ngrok on port 4040 with PID: $pid"
  kill -9 $pid
fi
ngrok http 8888
echo "ngrok running on port 4040"
