FROM python:slim-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get install locales gcc krb5-user libkrb5-dev curl -y && \
    apt-get -qq clean
    
RUN pip install -U \
    pytest pytest-html \
    requests requests-kerberos \
    deepdiff \
    nbconvert==5.6.0 nbformat==4.4.0 \
    jupyter-client ipykernel \
    git

RUN locale-gen "en_US.UTF-8"
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

CMD ["/bin/bash"]
