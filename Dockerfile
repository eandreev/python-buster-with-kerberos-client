FROM python:slim-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get install locales gcc krb5-user libkrb5-dev -y && \
    apt-get -qq clean
    
RUN pip install -U pytest pytest-html requests requests-kerberos deepdiff nbconvert jupyter-client

RUN locale-gen "en_US.UTF-8"
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

CMD ["/bin/bash"]
