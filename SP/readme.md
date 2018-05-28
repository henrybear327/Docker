# Notes

## Build

* Build from `stdin`
    * `docker build -t="sp_zsh" --rm  - < Dockerfile`
        * **NOTICE**: `COPY` and `ADD` command won't work
    * `docker build -t="sp_zsh" --no-cache --rm  - < Dockerfile`
        * http://mmbash.de/blog/failed-fetch-with-docker-build-and-apt-get-update/
* Normal building (run in directory with `DOCKERFILE`)
    * docker build -t sp_zsh --no-cache --rm .

# Useful commands

* checking status
    * `docker ps -a`
    * `docker images -a`
    * `docker tag [image ID] ubuntu/sp:latest`
    * `docker stop [ps ID]`
    * `docker restart [ps ID]`
* run
    * `docker run -p22222:22 -dt [image ID]`
    * `docker run -p22222:22 --cap-add SYS_PTRACE -dt [image ID]`
    * `docker run -p22222:22 --cap-add SYS_PTRACE  -v [absolute path] -dt [image ID]`
    * [ref 1](http://blog.johngoulah.com/2016/03/running-strace-in-docker/)
    * [ref 2](https://docs.docker.com/engine/reference/run/)

```
docker stop `docker ps -aq` // stop all ps
docker rm `docker ps -aq` // remove all ps
```
