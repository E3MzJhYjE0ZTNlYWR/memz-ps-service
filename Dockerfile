FROM golang:1.7.4-wheezy

ADD package.zip.enc entrypoint.sh /home/

RUN apt-get update -y && \
	apt-get install unzip -y && \
	apt-get clean && \
	go get gopkg.in/mgo.v2 gopkg.in/mgo.v2/bson github.com/Sirupsen/logrus github.com/buaazp/fasthttprouter \
		github.com/valyala/fasthttp github.com/satori/go.uuid

ENTRYPOINT ["/go/bin/entrypoint.sh"]
