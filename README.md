# Docker image for AceStream proxy with the AceStream Engine bundled

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

https://hub.docker.com/r/rusanter/acestream-proxy

The image is based on debian:stretch-slim.

Included software:

1. AceStream 3.1.49 http://www.acestream.org/
1. AceStream HTTP Proxy (HTTPAceProxy) https://github.com/pepsik-kiev/HTTPAceProxy

## Requirements

* [Docker](https://docs.docker.com/get-docker/)
* Any media player with HTTP streaming support

## How to use

Run the software.  
You can specify port other than 8000 by replacing `-p <YOUR_PORT>:8000`.

```
docker run --rm -p 8000:8000 rusanter/acestream-proxy
```

Play a media by a given AceStream ID.  
Replace `acestreamid` with the valid AceStream ID.
Replace `localhost` if running on a remote server.  
Change the port `8000` if you changed it in the above command.

```
http://localhost:8000/pid/acestreamid/stream.mp4
```

## Build your own docker image

```
git clone https://github.com/rusanter/acestream-docker.git
cd acestream-docker
docker build -t acestream-proxy .
```

## Extending functionality

HTTPAceProxy supports Ace Stream Content-ID hashes (PIDs), .acelive files, infohash, 
usual torrent files and has a different plugins for simple use with SmartTV, KODI, VLC etc.

Pull requests which adds your favorite plugins are welcome.

## Copyright notice

Be careful with viewing torrent files. You can get copyright abuse with a huge fines! 
It depends on the copyright legislation of your country!

## License
 
[The MIT License](LICENSE)
