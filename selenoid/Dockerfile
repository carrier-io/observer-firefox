ARG VERSION

FROM selenoid/vnc:firefox_$VERSION

USER root

RUN apt-get update \
  && apt-get install -y supervisor \
  && apt-get install -y  software-properties-common \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN add-apt-repository -y ppa:jonathonf/ffmpeg-4
RUN apt -y install ffmpeg git && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN mkdir -p /var/run/supervisor /var/log/supervisor \
  && chmod -R 777 /var/run/supervisor /var/log/supervisor

RUN git clone https://github.com/carrier-io/observer_video_client.git && \
    cd observer_video_client && python3 setup.py install
ADD observervideoclient.conf /etc/supervisor/conf.d/observervideoclient.conf
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh  /

USER selenium

EXPOSE 9999
EXPOSE 4444
