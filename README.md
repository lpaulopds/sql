## **Queries do curso completo de Banco de Dados e SQL, sem mistérios.**
>LINUX | DOCKER | PHP | MYSQL | MSSQL | POSTGRESQL  
  
Repositório criado para documentar as queries do curso completo  
de Banco de Dados e SQL, sem mistérios! Esse repositório irá ser  
útil para garantir o aprendizado e consultas no futuro.  
  
  
----------------------  
  
  
>[!NOTE]
>As queries explicadas nas aulas estão nos diretórios: 'queries-*'.  
  
  
----------------------  
  
  
### **Comandos para acessar as bases de dados e tabelas criadas durante o curso**
>MySQL | SQL Server | PostgresSQL  
  
#### **Execute o comando abaixo na raiz do projeto para subir os containers**
```bash
sudo docker compose up -d
```  
  
#### **Para entrar no container MySQL e executar as queries**  
1. Veja os ids ou nomes dos containers  
```bash
sudo docker ps
```  
  
2. Entrar no container MySQL  
```bash
sudo docker container exec -it c-mysql bash
```  
  
3. Dentro do container, conecte no banco  
```bash
mysql -u root -p
```  
  
  
----------------------  
  
  
#### **Para entrar no container MSSQL e executar as queries**  
1. Veja os ids ou nomes dos containers   
```bash
sudo docker ps
```  
  
2. Entrar no container MSSQL  
```bash
sudo docker container exec -it c-mssql bash
```  
  
3. Dentro do container, conecte no banco  
```bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA
```  
  
  
----------------------  
  
  
>[!Warning]
>Caso você tenha problemas de permissão  
>no build do container MSSQL, execute o comando abaixo  
```bash
sudo chown -R 10001:0 persistent-mssql
```  
  

----------------------  
  
  
#### **Para entrar no container PostgresSQL e executar as queries**  
1. Veja os ids ou nomes dos containers   
```bash
sudo docker ps
```  
  
2. Entrar no container PostgresSQL  
```bash
sudo docker container exec -it c-postgres bash
```  
  
3. Dentro do container, conecte no banco  
```bash
psql -h postgres -U postgres
```  
  
  
----------------------  
  
  
>[!NOTE]
>Os usuários e senhas de conexão com banco de dados  
>estão nos arquivos Dockerfile de cada container.  
  
  
----------------------  
  
  
### **Mais informações**
#### **Docker**
* Arquivos de configurações das imagens do container docker: 'php/Dockerfile' e 'compose.yaml'
#### **PHP/APACHE**
* Logs do apache2 no diretório: 'apache/var/log/apache2'
* Caminho arquivo php.ini: 'apache/etc/'
* Arquivos de configurações do apache nos diretórios: 'apache/etc' e 'apache/vhost'
#### **MySQL**
* Arquivo de configuração do MySQL: 'mysql/my.cnf'  
#### **Postgres**
* Arquivo de configuração do PostgreSQL: 'postgres/postgres.conf'  
  
  
----------------------  
  
  
### **Diagramas Modelagem de Dados**  
>Software: StarUML  
  
Modelagem oficina  
  
![Modelagem oficina](/images/oficina.png "Modelagem oficina")  
  
Modelagem autorelacionamento  
  
![Modelagem autorelacionamento](/images/autorelacionamento.png "Modelagem autorelacionamento")  
  
Modelagem Formas Normais  
  
![Modelagem Formas Normais](/images/fns.png "Modelagem Formas Normais")  
  
### **Referências**  
  
[postgresqltutorial.com/postgresql-php](https://www.postgresqltutorial.com/postgresql-php/)
