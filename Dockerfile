FROM fedora:latest

RUN yum -y update && yum -y install git koji python-setuptools docker python-docker-py python-pip

# let's be cutting edge and use git version of squash tool
# use whatever branch of upstream dock/osbs-client repo you want
RUN pip install git+https://github.com/goldmann/docker-scripts && \
    cd /opt/ && git clone -b store-metadata-api https://github.com/DBuildService/atomic-reactor.git && cd atomic-reactor && python setup.py install && \
    cd /opt/ && git clone -b dock-api-fixes https://github.com/DBuildService/osbs.git && cd osbs && python setup.py install

CMD ["atomic-reactor", "--verbose", "inside-build"]
