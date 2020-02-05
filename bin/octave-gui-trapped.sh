trap 'ps aux | awk "/[o]ctave/{ print \$2 }" | xargs -I{} kill -s KILL {}; exit' 2
octave --gui &
wait
sleep 1
