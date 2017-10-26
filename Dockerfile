FROM alpine
RUN apk add --no-cache haveged pwgen coreutils util-linux
COPY pwtools /pwtools
CMD ["/usr/sbin/haveged"]