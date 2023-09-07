/*
    ACESSAR CLI NO CONTAINER MSSQL
    - Senha do usuário SA no Dockerfile
    $ /opt/mssql-tools/bin/sqlcmd -S localhost -U SA
*/

/*
    BANCOS DEFAULT DO SQL SERVER
        MASTER
            - PRINCIPAL
        MODEL
            - UTILIZADO PARA CRIAÇÃO DE NOVOS BANCOS DE DADOS
        MSDB
            - AGENDAMENTO DE ROTINAS
            - DADOS INTEGRATION SERVICE
        TEMPDB
            - DADOS TEMPORÁRIOS
        REPORTSERVER
            - SERVER PARA GERAÇÃO DE RALATÓRIOS NATIVOS  
