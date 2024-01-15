## **Queries do curso completo de Banco de Dados e SQL, sem mistérios.**
>LINUX | DOCKER | PHP | MYSQL | MSSQL | POSTGRESQL  
  
Repositório criado para documentar as queries do curso completo  
de Banco de Dados e SQL, sem mistérios! Esse repositório irá ser  
útil para garantir o aprendizado e consultas no futuro.  
  
  
>[!NOTE]
>As queries explicadas nas aulas estão nos diretórios: 'queries-*'.  
  
  
----------------------  
  
  
### **Comandos para acessar as bases de dados e tabelas criadas durante o curso**
>MySQL | SQL Server | PostgresSQL  
  
#### **Execute o comando abaixo na raiz do projeto para subir os containers**
```bash
sudo docker compose up -d
```  
  
  
#### **Atualize o composer para administrar as dependências e gerar autoload das classes**
```bash
composer update
```  
  
  
----------------------  
  
  
#### **Para entrar no container MySQL e executar as queries**  
1. Entrar no container MySQL  
```bash
sudo docker container exec -it c-mysql bash
```  
  
2. Dentro do container, conecte no banco  
```bash
mysql -u root -p
```  
  
  
----------------------  
  
  
#### **Para entrar no container MSSQL e executar as queries**  
1. Entrar no container MSSQL  
```bash
sudo docker container exec -it c-mssql bash
```  
  
2. Dentro do container, conecte no banco  
```bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA
```  
  
  
>[!Warning]
>Caso você tenha problemas de permissão  
>no build do container MSSQL, execute o comando abaixo  
```bash
sudo chown -R 10001:0 persistent-mssql
```  
  

----------------------  
  
  
#### **Para entrar no container PostgresSQL e executar as queries**   
1. Entrar no container PostgresSQL  
```bash
sudo docker container exec -it c-postgres bash
```  
  
2. Dentro do container, conecte no banco  
```bash
psql -h postgres -U postgres
```  
  
  
>[!Warning]
>No primeiro Build do container, executar sem o padrão  
>entry point, para isso, comente a linha  
>do Dockerfile que contém o comando 'CMD'. Dessa maneira  
>todos os arquivos do database serão criados corretamente.  
  
  
----------------------  
  
  
>[!NOTE]
>Os usuários e senhas de conexão com banco de dados  
>estão nos arquivos Dockerfile de cada container.  
  
  
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
