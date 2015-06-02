FROM fedora:latest

RUN yum -y update && yum -y install git koji python-setuptools docker python-docker-py python-pip

# let's be cutting edge and use git version of squash tool
# use whatever branch of upstream dock/osbs-client repo you want
RUN pip install git+https://github.com/goldmann/docker-scripts && \
    cd /opt/ && git clone [-b next] https://github.com/DBuildService/dock.git && cd dock && python setup.py install && \
    cd /opt/ && git clone https://github.com/DBuildService/osbs.git && cd osbs && python setup.py install

CMD ["dock", "--verbose", "inside-build", "--input", "osv3"]
