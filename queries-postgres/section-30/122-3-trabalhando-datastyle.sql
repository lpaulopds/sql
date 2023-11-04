/*
    Dependendo do banco de dados o comando muda.
    Busque por comando datestyle mysql/postregres/mssql...

    O formato de data do banco é definido no arquivo postgresql.conf
    Caminho do arquivo:
    Windows: C -> arquivos de programas -> postgresql -> date
    Linux: /var/lib/postgresql/data/postgresql.conf

    Altere:
    # - Locale and Formatting -
    datestyle = 'iso, mdy'
*/

SHOW datestyle;

