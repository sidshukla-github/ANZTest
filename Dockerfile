FROM golang:alpine  as builder

ENV GO111MODULE=on


RUN apk update --no-cache and apk add git

ADD ./ /app


WORKDIR /app


RUN go build -o golang-test  .

FROM alpine:latest as final

COPY --from=builder /app/golang-test/ .

RUN pwd 

RUN  ls -la 

ENTRYPOINT ./golang-test

EXPOSE 8000
