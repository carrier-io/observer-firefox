# observer-chrome
ui performance analysis - chrome container

Build with selenium:

```
docker build -t getcarrier/observer-firefox:latest
```

Build with selenoid:

```
docker build -f selenoid/Dockerfile -t getcarrier/observer-firefox:78.0 . --build-arg VERSION=firefox_78.0
```