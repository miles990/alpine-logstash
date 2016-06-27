# alpine-logstash
Logstash docker image of smaller than official version.

## Base Image
- anapsix/alpine-java:jdk8

## Environment
- Alpine Linux 3.4
- Oracle Java 8 JDK
- Logstash 2.3.3

## Run
`
docker run -p 3333:3333 -p 3334:3334 -d miles990/alpine-logstash
`

`
docker run -p 3333:3333 -p 3334:3334 -v $(pwd):/data -d miles990/alpine-logstash
`


## License

[MIT](http://opensource.org/licenses/MIT)