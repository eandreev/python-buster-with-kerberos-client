FROM python:slim-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get install locales git gcc krb5-user libkrb5-dev curl \
    python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev g++ \
    -y && \
    apt-get -qq clean
    
RUN pip install -U \
    pytest pytest-html \
    requests requests-kerberos \
    deepdiff \
    nbconvert==5.6.0 nbformat==4.4.0 \
    jupyter-client ipykernel

RUN locale-gen "en_US.UTF-8"
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

CMD ["/bin/bash"]
