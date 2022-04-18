FROM alpine:3.13.5

ENV NOVNC_TAG="v1.3.0"

ENV WEBSOCKIFY_TAG="v0.10.0"

ENV VNC_SERVER "localhost:5900"

ENV NO_VNC_PORT="6900"

ENV TOKEN_DIR=/token

RUN apk --no-cache --update --upgrade add \
        bash \
        python3 \
        python3-dev \
        gfortran \
        py-pip \
        build-base \
        procps \
        git

RUN pip install --no-cache-dir numpy

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC --branch ${NOVNC_TAG} /root/noVNC && \
    git clone https://github.com/novnc/websockify --branch ${WEBSOCKIFY_TAG} /root/noVNC/utils/websockify

RUN cp /root/noVNC/vnc.html /root/noVNC/index.html



ADD ./token $TOKEN_DIR/
RUN cp -R /token /root/noVNC/utils/websockify/




ENTRYPOINT [ "bash", "-c", "/root/noVNC/utils/websockify/run --web /root/noVNC/ --target-config /root/noVNC/utils/websockify/token/token.conf ${NO_VNC_PORT}" ]


