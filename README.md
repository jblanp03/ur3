# ur3
CI/CD. Exercise DevSecOps.

#Objetive
The objetive of this exercise is to load this docker image locally and tested.

## Build and Run

```shell
docker build -t ur3:noetic ./
docker run -p 6080:80 -p 5900:5900 -e VNC_PASSWORD=vncpassword --rm -it ur3:noetic
```

# Launch

Local:
http://127.0.0.1:6080
