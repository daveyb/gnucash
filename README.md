# gnucash
Builds latest version of gnucash in a container
- includes libdb drivers for mysql, pgsql, and sqlite3

## Run it (gnucash data will not persist after container is stopped unless you map a volume!)
1. `docker build .`
2. `xhost +LOCAL:`
3. `docker run -d -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <container-id-or-name>`
