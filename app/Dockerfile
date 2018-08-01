FROM golang:1.10

RUN mkdir /app

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

RUN apt-get update -y && apt-get install rsync -y

WORKDIR /go/src/app
COPY . .

RUN dep ensure \
  && go get github.com/canthefason/go-watcher \
  && go install github.com/canthefason/go-watcher/cmd/watcher

ENV APP_PORT 8080
ENV GIN_MODE release

EXPOSE 8080

CMD ["/go/bin/watcher","main.go"]
