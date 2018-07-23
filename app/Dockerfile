FROM golang:1.10

RUN mkdir /app

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR /go/src/app
COPY . .

RUN dep ensure
RUN go build -o /go/bin/app_main .

ENV APP_PORT 80
ENV GIN_MODE release

EXPOSE 80

CMD ["/go/bin/app_main"]
