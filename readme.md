# Notes

## Install

* Mac 
    * `brew cask install docker`

## Build

* Normal build (run in directory with `DOCKERFILE`)
    * `time docker build -t ubuntu1804 --no-cache --rm .`
    * About 3.5 minutes of build time from scratch on Macbook pro 2015
* Build from `stdin`
    * `docker build -t="ubuntu1804" --rm  - < Dockerfile`
        * **NOTICE**: `COPY` and `ADD` command won't work
    * `docker build -t="ubuntu1804" --no-cache --rm  - < Dockerfile`
        * http://mmbash.de/blog/failed-fetch-with-docker-build-and-apt-get-update/

# Useful commands

* checking status
    * `docker ps -a`
    * `docker images -a`
    * `docker tag [image ID] ubuntu/sp:latest`
    * `docker stop [ps ID]`
    * `docker restart [ps ID]`
* run
    * `docker run -p22222:22 -dt [image ID]`
        * `ssh ubuntu@localhost -p 22222`, with password `ubuntu`
    * `docker run -p22222:22 -v [absolute path] -dt [image ID]`
    * [ref 1](http://blog.johngoulah.com/2016/03/running-strace-in-docker/)
    * [ref 2](https://docs.docker.com/engine/reference/run/)
* Starting and stopping
```bash
docker stop `docker ps -aq` // stop all ps
docker rm `docker ps -aq` // remove all ps
```
