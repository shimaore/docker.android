OpenJDK + Android Tools

[Docker Hub Automated Build](https://hub.docker.com/r/shimaore/android/)

To use the `android` command to create and build your project,
```bash
alias android='docker run -ti --rm --workdir /opt/src -v $(pwd):/opt/src shimaore/cordova '
```

Need USB?
```bash
alias android='docker run -ti --rm --workdir /opt/src -v $(pwd):/opt/src --privileged -v /dev/bus/usb:/dev/bus/usb shimaore/cordova '
```
