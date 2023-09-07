SHOW VARIABLES LIKE 'char%';/*
+--------------------------+--------------------------------+
| Variable_name            | Value                          |
+--------------------------+--------------------------------+
| character_set_client     | utf8mb4                        |
| character_set_connection | utf8mb4                        |
| character_set_database   | utf8mb4                        |
| character_set_filesystem | binary                         |
| character_set_results    | utf8mb4                        |
| character_set_server     | utf8mb4                        |
| character_set_system     | utf8mb3                        |
| character_sets_dir       | /usr/share/mysql-8.1/charsets/ |
+--------------------------+--------------------------------+*/

SHOW VARIABLES LIKE 'collation%';/*
+----------------------+------------------------+
| Variable_name        | Value                  |
+----------------------+------------------------+
| collation_connection | utf8mb4_0900_ai_ci     |
| collation_database   | utf8mb4_unicode_520_ci |
| collation_server     | utf8mb4_unicode_520_ci |
+----------------------+------------------------+*/

/*
    NO ARQUIVO my.cnf INCLUA OS SETS ABAIXO:
    
    [mysqld]
    collation-server=utf8mb4_unicode_520_ci
    init-connect='SET NAMES utf8mb4'
    character-set-server=utf8mb4

    [client]
    default-character-set=utf8mb4
*/

