FROM scratch

ENV DEBIAN_FRONTEND noninteractive

ADD seed_rootfs.tar /

# Divert initctl temporarily so apt-update can work
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# Don't invoke rc.d policy scripts
ADD rc.d-policy-stub /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

# Do an initial update so we have updated lists for the build
RUN apt-get update

RUN locale-gen en_US.UTF-8

# Let the container run doing nothing
CMD [ "sh", "-c", "sleep infinity" ]
