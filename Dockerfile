FROM debian:stretch-slim
LABEL maintainer="https://github.com/rusanter"
LABEL version="1.0"
LABEL description="Acestream Proxy with integrated Acestream Engine"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl git net-tools libpython2.7 libxslt-dev python python-pip python-apsw python-setuptools && \
    pip install cffi gevent psutil && \
    curl -LSso acestream_3.1.49_debian_9.9_x86_64.tar.gz http://download.acestream.media/linux/acestream_3.1.49_debian_9.9_x86_64.tar.gz && \
    mkdir /opt/acestream && tar xf acestream_3.1.49_debian_9.9_x86_64.tar.gz -C /opt/acestream && \
    rm -f /acestream_3.1.49_debian_9.9_x86_64.tar.gz && \
    git clone --depth=1 https://github.com/pepsik-kiev/HTTPAceProxy.git /opt/httpaceproxy && \
    rm -rf /opt/httpaceproxy/.git && \
    sed -i 's/acespawn = False/acespawn = True/' /opt/httpaceproxy/aceconfig.py && \
    apt-get purge -y git python-pip && apt-get autoremove -y && \
    rm -rf ~/.cache/pip/* && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8000
CMD ["python", "/opt/httpaceproxy/acehttp.py"]
