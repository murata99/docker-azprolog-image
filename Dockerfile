FROM ubuntu:xenial

ARG az_download_url="https://www.az-prolog.com/?ddownload=58641"
ARG az_version="9.63"

RUN apt-get update && apt-get install -y curl build-essential
RUN curl -L -o /tmp/azprolog${az_version}-ubuntu16.04x64.tar.gz ${az_download_url}

RUN cd /tmp \
  && tar xzf azprolog${az_version}-ubuntu16.04x64.tar.gz \
  && cd azprolog${az_version}-ubuntu16.04x64 \
  && make install

CMD ["prolog_c"]
