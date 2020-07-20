# fetch base image and tag as builder stage
FROM golang:alpine  as builder

# set env variable
ENV GO111MODULE=on

# install required packages
RUN apk update --no-cache and apk add git

# add relevant files 
ADD ./ /app

# set the work directory
WORKDIR /app

# build package
RUN go build -o golang-test  .

FROM alpine:latest as final

# use the output of builder stage and copy relevant files
COPY --from=builder /app/golang-test/ .
 
# define entry point
ENTRYPOINT ./golang-test

# export port
EXPOSE 8000
