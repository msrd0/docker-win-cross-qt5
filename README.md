# docker-win-cross-qt5
Docker image to cross-compile Qt5-Projects for Windows

Corresponding docker image: [`ghcr.io/msrd0/win-cross-qt5`](https://github.com/users/msrd0/packages/container/package/win-cross-qt5)

Based on [`debian`](https://hub.docker.com/_/debian/) and [`mxe`](http://mxe.cc/).

## Supported Tags

- `i686`
- `x86_64`
- `latest`

## Cross-Compiling

To cross-compile `example.pro`, simply run:

```bash
i686-w64-mingw32-qmake-qt5 example.pro
make
```

You will find the built executable in the `release` directory.
