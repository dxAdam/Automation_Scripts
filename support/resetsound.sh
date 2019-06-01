mkdir test
rm -r ~/.config/pulse
pulseaudio -k 
sleep 3 
pacmd set-sink-volume 0 15000

