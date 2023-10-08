FROM mcr.microsoft.com/mssql/server:2022-latest

WORKDIR /home/lpaulopds/sql

COPY . /home/lpaulopds/sql

ENV SA_PASSWORD password123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

CMD /bin/bash ./entrypoint.sh

# RUN apt-get update && \
#         apt-get upgrade -y && \
#         apt-get install -y git && \
#         apt-get install -y nano && \
#         apt-get install -y net-tools && \
#         apt-get install -y unzip && \
#         apt-get install -y gzip
