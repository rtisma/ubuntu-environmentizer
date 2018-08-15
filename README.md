Ubuntu Environmentizer
---

### Description
This Dockerfile builds an image with the latest ubuntu image, and initializes it first with ansible and python, as well as a user-specified init script. The image can then run any command in an isolated ubuntu environment. Initial motivation was to have a fresh new environemnt for testing ansible scripts locally

### Building
The user can intialized the image (i.e at build time) by building the image with the argument `--build-arg INIT_SCRIPT_FILE=./docker/host/path/to/init/script.sh` which will run.

Example
```bash
docker build --build-arg INIT_SCRIPT_FILE=./scripts/build_init.sh -t "ansible-stage:latest" ./
```
For convienence, the `./build.sh` script does this exactly

### Running
After building the image, the user can run any command relative to a specified working directory. The working directory must exist on the docker host and is mounted to a path inside the container. The specified command is run RELATIVE to the previously specified working directory inside the docker containers. 

Example
```bash
docker run --rm --it -v "/my/absolute/working/directory:/user-dir" ubuntu-environmentizer:latest  myCmd myArg1 myArg2
```
For convienence, the `./run.sh` script does this exactly. The command is appended with a forever-loop, to ensure the container does not exit. 


