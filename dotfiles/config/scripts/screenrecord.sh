# fname="~/Videos/Screencast-$(date +%F-%R:%S).mkv"
# fname="~/Videos/Screencast-`date +%F %R %S`.mkv"
# fname="temp.mkv"
# echo $fname

ffmpeg -y -f x11grab -s 1366x768 -i :0.0 -i ~/Music/Bed_and_Breakfast\ audio.mp3  -af 'volume=0.4' -c:v libx264 -r 30 -c:a flac ~/Videos/Screencast-`date +%F_%R_%S`.mkv 

# echo "Remove?" 
# read op
# 
# [ $op = "y" ] && rmtrash $fname
