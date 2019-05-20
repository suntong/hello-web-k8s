FROM golang:alpine as builder

WORKDIR /usr/build
ADD main.go .
#RUN go build -o app .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /app .

FROM scratch
COPY --from=builder /app ./

ENTRYPOINT ["./app"]
