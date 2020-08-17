# change snow zone to mumbai

exec &>> ~/snow.log

while true 
do
    date +%a\ %T
    gcloud beta compute instances create snow --zone asia-south1-a --source-machine-image snow || \
    sleep 10s; gcloud beta compute instances create snow --zone asia-south1-b --source-machine-image snow || \
    sleep 10s; gcloud beta compute instances create snow --zone asia-south1-c --source-machine-image snow
    grep -iq  "created" ~/snow.log && notify-send "Snow created !!!"  
    echo
    sleep 30m
done
