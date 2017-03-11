# gnucash
Latest version of gnucash built using containers

## Run it
1. `docker build .`
2. `xhost +LOCAL:`
3. `docker run -d -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <container-id-or-name>`
