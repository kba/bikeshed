FROM alpine:3.4
ENV PYTHONIOENCODING utf8

COPY . /usr/bikeshed

RUN apk add --no-cache python python-dev libxslt-dev libxml2 libxml2-dev py-pygments py-pip g++ ca-certificates &&\
    pip install --editable /usr/bikeshed && \
    apk del g++ python-dev py-pip && \
    rm -rf /root/.cache && \
    bikeshed update

VOLUME /data
WORKDIR /data
ENTRYPOINT ["/usr/bin/bikeshed"]
