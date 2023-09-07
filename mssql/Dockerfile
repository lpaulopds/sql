FROM mcr.microsoft.com/mssql/server:2022-latest
WORKDIR /home/lpaulopds/queries-sql
COPY . /home/lpaulopds/queries-sql
ENV SA_PASSWORD password123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express
CMD /bin/bash ./entrypoint.sh