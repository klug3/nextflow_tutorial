FROM python:3.12

RUN apt-get update --fix-missing \
    && cd /usr/local/ \
    && wget -O bedtools.tar.gz https://github.com/arq5x/bedtools2/releases/download/v2.31.1/bedtools-2.31.1.tar.gz \
    && tar -xzvf bedtools.tar.gz \
    && rm -rf bedtools.tar.gz \
    && cd bedtools2 \
    && make \
    && mv bin/* /usr/local/bin \
    && cd /usr/local \
    && rm -rf /usr/local/bedtools2 \
    && apt-get remove -y wget gcc g++ make \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Utils/* /usr/local/bin/

#CMD [ "usr/bin/env bash" ]
#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
