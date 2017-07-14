# docker-win-cross-qt5
Docker image to cross-compile Qt5-Projects for Windows

Corresponding docker image: [`msrd0/win-cross-qt5`](https://hub.docker.com/r/msrd0/win-cross-qt5/)

Based on [`debian`](https://hub.docker.com/_/debian/) and [`mxe`](http://mxe.cc/).

## Supported Tags

- `i686` ([Dockerfile](https://github.com/msrd0/docker-win-cross-qt5/blob/master/i686/Dockerfile))
- `x86_64` ([Dockerfile](https://github.com/msrd0/docker-win-cross-qt5/blob/master/x86_64/Dockerfile))
- `both`, `latest` ([Dockerfile](https://github.com/msrd0/docker-win-cross-qt5/blob/master/both/Dockerfile))

## Cross-Compiling

To cross-compile `example.pro`, simply run:

```bash
i686-w64-mingw32-qmake-qt5 example.pro
make -j7
```

You will find the built executable in the `release` directory.
