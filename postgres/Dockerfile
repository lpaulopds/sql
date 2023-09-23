FROM postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y nano && \
    apt-get install -y net-tools && \
    apt-get install -y unzip && \
    apt-get install -y gzip