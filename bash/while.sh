while true 
do
  RSP="$(curl -sL -w "%{http_code}\\n"  "http://192.168.48.168:8280/services/Version" -o /dev/null)"
  echo $RSP
  if [ "$RSP" == 200 ] 
  then
      break
  fi
  echo "Server Up"
done

