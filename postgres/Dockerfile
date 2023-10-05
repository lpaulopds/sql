FROM postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV LC_ALL POSIX
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y nano && \
    apt-get install -y net-tools && \
    apt-get install -y unzip && \
    apt-get install -y gzip && \
    apt-get install -y libpq-dev && \
    apt-get install -y postgresql-all
