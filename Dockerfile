FROM python:3.8-slim-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get install \
    build-essential locales git gcc g++ curl zip wget \
    python3-dev libxml2-dev libxslt1-dev zlib1g-dev \
    libsasl2-dev libjpeg-dev krb5-user libkrb5-dev \
    -y && \
    apt-get -qq clean

RUN wget -q "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl" -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
    
RUN pip install -U \
    pytest pytest-html \
    requests requests-kerberos \
    tqdm deepdiff \
    nbconvert==5.6.0 nbformat==4.4.0 \
    jupyter-client ipykernel \
    Jinja2 pebble pydriller matplotlib \
    six bit_array thrift \
    thrift_sasl sasl impyla

RUN locale-gen "en_US.UTF-8"
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

CMD ["/bin/bash"]
