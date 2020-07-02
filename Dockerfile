FROM selenium/standalone-firefox:3.141.59-20200525

USER root

RUN apt-get update && apt-get upgrade -y python3 && apt-get install -y  software-properties-common python3-pip
RUN add-apt-repository -y ppa:jonathonf/ffmpeg-4
RUN apt -y install ffmpeg git && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN git clone https://github.com/carrier-io/observer_video_client.git && \
    cd observer_video_client && python3 setup.py install
ADD observervideoclient.conf /etc/supervisor/conf.d/observervideoclient.conf
ADD supervisord.conf /etc/supervisord.conf

USER seluser

EXPOSE 9999
