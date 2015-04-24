FROM fedora:latest
# e2fsprogs -- docker @ F20 wants it
RUN yum -y install docker-io git python-docker-py python-setuptools GitPython e2fsprogs koji dock dock-koji
CMD ["dock", "--verbose", "inside-build", "--input", "osv3"]
