# Notes

```
docker build -t="sp" --rm  - < Dockerfile
docker build -t="sp" --no-cache --rm  - < Dockerfile // http://mmbash.de/blog/failed-fetch-with-docker-build-and-apt-get-update/

time docker build -t sp_zsh --no-cache --rm . // for COPY to work

docker ps -a
docker images -a

docker tag [image ID] ubuntu/sp:latest

docker run -p22222:22 -dt [image ID]
docker run -p22222:22 --cap-add SYS_PTRACE -dt [image ID]
docker run -p22222:22 --cap-add SYS_PTRACE  -v [absolute path] -dt 0e
* [ref 1](http://blog.johngoulah.com/2016/03/running-strace-in-docker/)
* [ref 2](https://docs.docker.com/engine/reference/run/)

docker stop [ps ID]
docker restart [ps ID]

docker stop `docker ps -aq` // stop all ps
docker rm `docker ps -aq` // remove all ps
```
