FROM ubuntu
ENV workdir=/bin
WORKDIR $workdir

COPY ./target .


FROM alpine
COPY ./bin/target* /usr/local/data/

CMD[ java -c '']
