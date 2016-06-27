FROM anapsix/alpine-java:jdk8

MAINTAINER AlexLee <alexlee7171@gmail.com>

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk upgrade --update && \
	apk add --update wget ca-certificates && \
    rm -rf /var/cache/apk/*

# Logstash installation
# Create a logstash.conf and start logstash by /logstash/bin/logstash agent -f logstash.conf
RUN wget https://download.elastic.co/logstash/logstash/logstash-2.3.3.tar.gz && \
	tar xf logstash-2.3.3.tar.gz && \
	rm logstash-2.3.3.tar.gz && \
	mv logstash-2.3.3 logstash

# Define mountable directories.
VOLUME ["/data"]

# Mount logstash.conf config
ADD config/logstash.conf /logstash/config/logstash.conf

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/logstash/bin/logstash", "-f", "/logstash/config/logstash.conf"]

EXPOSE 3333
EXPOSE 3334