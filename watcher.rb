video_dir = File.expand_path File.join File.dirname(__FILE__), ".."

while true
  system "omxplayer #{video_dir}/H264_test7_voiceclip_mp4_480x360.mp4"
  sleep 5
end
